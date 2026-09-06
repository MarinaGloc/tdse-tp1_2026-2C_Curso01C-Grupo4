# Actuator Layer: State Machine & Timers

## 1. Módulo Actuator

El módulo **Actuator** es el encargado de comandar las salidas digitales de la placa prototipo (LEDs y comunicación UART) según las órdenes recibidas de la capa `System`. 

Garantiza la independencia del hardware mediante máquinas de estado locales que gestionan tiempos de encendido, apagado y frecuencias de destello (parpadeos) sin bloquear la ejecución del bucle principal de $1\text{ms}$.

---

## 2. Salidas Digitales Mapeadas

* `OUT_LED_PRINT` (LED Azul): Indicador de impresión y emisión de ticket.
* `OUT_LED_BARRIER` (LED Verde): Indicador del estado y movimiento de la barrera vehicular.
* `OUT_LED_SERVER` / `UART_TX` (LED Rojo / Serie): Indicador de transmisión/recepción de datos con el servidor central.

---

## 3. Definición de Variables y Comandos del Módulo

### Comandos Recibidos de `System` (`actuatorCmd_t`)
* `ACT_CMD_PRINT_START`: Enciende el indicador de impresión.
* `ACT_CMD_BARRIER_OPEN_FAST`: Inicia parpadeo rápido ($5\text{Hz}$, $T = 200\text{ms}$) para indicar barrera subiendo.
* `ACT_CMD_BARRIER_KEEP_OPEN`: Enciende en forma continua el LED de barrera (barrera levantada).
* `ACT_CMD_BARRIER_CLOSE_SLOW`: Inicia parpadeo lento ($1\text{Hz}$, $T = 1000\text{ms}$) para indicar barrera bajando.
* `ACT_CMD_BARRIER_LOWERED`: Apaga el LED de la barrera (barrera completamente cerrada).
* `ACT_CMD_SERVER_LOG_PATENT`: Genera un destello corto ($100\text{ms}$) para indicar envío de datos de patente al servidor.
* `ACT_CMD_RESET_ALL`: Fuerza el apagado de todas las salidas y resetea las FSM de la capa Actuator.

### Estados Internos de Parpadeo (`actuatorState_t`)
* `ST_ACT_OFF`: Salida forzada a nivel bajo ($0\text{V}$).
* `ST_ACT_ON`: Salida forzada a nivel alto ($3.3\text{V}$).
* `ST_ACT_BLINK_ON`: Indicador de la barrera en subida o bajada.
* `ST_ACT_BLINK_OFF`: Indicador de la barrera en subida o bajada.

### Temporizadores Internos (`uint32_t`)
* `DEL_BLINK_BARRIER`: Contador para controlar el medio período de destello del LED de barrera.
* `DEL_COMM_PULSE`: Contador para el pulso de transmisión del LED de servidor.

---
## 4. Diagrama de Transición de Estados (Sensor FSM)

ACT_CMD_BARRIER_OPEN_FAST 
                                  (HALF_PERIOD = 100ms) / 
                                  ACT_CMD_BARRIER_CLOSE_SLOW 
                                  (HALF_PERIOD = 500ms)
                               ┌───────────────────────────┐
                               │                           ▼
   ┌────────────────┐          │                ┌────────────────────┐
   │   ST_ACT_OFF   │──────────┼───────────────>│  ST_ACT_BLINK_ON   │
   └────────────────┘          │                └────────────────────┘
     ▲   ▲        │            │                   │         ▲
     │   │        │            │    tick [DEL==0]  │         │ tick [DEL==0]
     │   │        │ ACT_CMD_   │   / OUT = LOW     ▼         │ / OUT = HIGH
     │   │        │ PRINT_     │                ┌────────────────────┐
     │   │        │ START      │                │  ST_ACT_BLINK_OFF  │
     │   │        │            │                └────────────────────┘
     │   │        ▼            │                           │
     │   │ ┌────────────────┐  │                           │
     │   │ │   ST_ACT_ON    │<─┘                           │
     │   │ └────────────────┘                              │
     │   │        │                                        │
     │   └────────┴────────────────────────────────────────┘
     │            ACT_CMD_BARRIER_KEEP_OPEN / OUT = HIGH
     │
     └─────────────────────────────────────────────────────
            ACT_CMD_BARRIER_LOWERED / ACT_CMD_RESET_ALL /
            OUT = LOW

## 5. Tabla de Transición de Estados (STT) - Control de Barrera (`OUT_LED_BARRIER`)

| Estado Actual | Evento / Comando Recibido | Condición [Guardia] | Estado Siguiente | Acciones Realizadas |
| :--- | :--- | :--- | :--- | :--- |
| `ST_ACT_OFF` | `ACT_CMD_BARRIER_OPEN_FAST` | - | `ST_ACT_BLINK_ON` | `OUT_LED_BARRIER = HIGH`, `DEL_BLINK_BARRIER = 100ms` |
| `ST_ACT_BLINK_ON` | `tick` | `[DEL_BLINK_BARRIER > 0]` | `ST_ACT_BLINK_ON` | `DEL_BLINK_BARRIER--` |
| `ST_ACT_BLINK_ON` | `tick` | `[DEL_BLINK_BARRIER == 0]` | `ST_ACT_BLINK_OFF` | `OUT_LED_BARRIER = LOW`, `DEL_BLINK_BARRIER = HALF_PERIOD` |
| `ST_ACT_BLINK_OFF` | `tick` | `[DEL_BLINK_BARRIER > 0]` | `ST_ACT_BLINK_OFF` | `DEL_BLINK_BARRIER--` |
| `ST_ACT_BLINK_OFF` | `tick` | `[DEL_BLINK_BARRIER == 0]` | `ST_ACT_BLINK_ON` | `OUT_LED_BARRIER = HIGH`, `DEL_BLINK_BARRIER = HALF_PERIOD` |
| `ST_ACT_BLINK_ON` / `OFF` | `ACT_CMD_BARRIER_KEEP_OPEN` | - | `ST_ACT_ON` | `OUT_LED_BARRIER = HIGH` |
| `ST_ACT_ON` | `ACT_CMD_BARRIER_CLOSE_SLOW` | - | `ST_ACT_BLINK_ON` | `OUT_LED_BARRIER = HIGH`, `DEL_BLINK_BARRIER = 500ms` |
| `Cualquiera` | `ACT_CMD_BARRIER_LOWERED` / `RESET` | - | `ST_ACT_OFF` | `OUT_LED_BARRIER = LOW` |

> **Nota:** Para `ACT_CMD_BARRIER_OPEN_FAST` el medio período `HALF_PERIOD` es de $100\text{ms}$ ($5\text{Hz}$), mientras que para `ACT_CMD_BARRIER_CLOSE_SLOW` es de $500\text{ms}$ ($1\text{Hz}$).

---

## 6. Tabla de Transición de Estados (STT) - Impresora y Servidor

### 6.1. Indicador de Impresión (`OUT_LED_PRINT`)
| Estado Actual | Comando Recibido | Condición | Estado Siguiente | Acciones Realizadas |
| :--- | :--- | :--- | :--- | :--- |
| `ST_ACT_OFF` | `ACT_CMD_PRINT_START` | - | `ST_ACT_ON` | `OUT_LED_PRINT = HIGH` |
| `ST_ACT_ON` | `ACT_CMD_RESET_ALL` | - | `ST_ACT_OFF` | `OUT_LED_PRINT = LOW` |

### 6.2. Indicador de Comunicación Servidor (`OUT_LED_SERVER`)
| Estado Actual | Evento / Comando | Condición [Guardia] | Estado Siguiente | Acciones Realizadas |
| :--- | :--- | :--- | :--- | :--- |
| `ST_ACT_OFF` | `ACT_CMD_SERVER_LOG_PATENT` | - | `ST_ACT_ON` | `OUT_LED_SERVER = HIGH`, `DEL_COMM_PULSE = 100ms` |
| `ST_ACT_ON` | `tick` | `[DEL_COMM_PULSE > 0]` | `ST_ACT_ON` | `DEL_COMM_PULSE--` |
| `ST_ACT_ON` | `tick` | `[DEL_COMM_PULSE == 0]` | `ST_ACT_OFF` | `OUT_LED_SERVER = LOW` |