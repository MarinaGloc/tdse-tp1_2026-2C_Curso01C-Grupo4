# System Layer: FSM & Main Logic

## 1. Módulo System

El módulo **System** es el núcleo del firmware. Implementa la Máquina de Estados Finitos (FSM) principal encargada de procesar las señales recibidas de la capa `Sensor`, coordinar los tiempos de espera y enviar comandos de control a la capa `Actuator`.

---
### Estados (`systemState_t`)
* `ST_IDLE`: Estado de reposo. El sistema espera a que un vehículo se estacione sobre la bobina de entrada.
* `ST_WAIT_CAM_PANEL`: Espera a que la cámara registre y valide la patente del vehículo detectado.
* `ST_WAIT_BTN_PRESS`: Espera a que el usuario presione el botón para solicitar su ticket.
* `ST_PRINT_TICKET`: Simula el tiempo de impresión/emisión del ticket.
* `ST_OPENING_BARRIER`: Barrera subiendo (LED titilando a alta frecuencia).
* `ST_WAIT_CAR_PASS`: Barrera completamente abierta; espera a que el auto cruce y deje libre la bobina de salida.
* `ST_CLOSING_BARRIER`: Barrera bajando (LED titilando a baja frecuencia).

### Eventos / Signals Entrantes (`systemEvent_t`)
* `EV_SYS_CAR_ARRIVED`: Notificación de la capa `Sensor` de presencia de auto en la bobina de entrada.
* `EV_SYS_CAM_VALIDATED`: Notificación de lectura y validación correcta de la patente.
* `EV_SYS_BTN_DOWN`: Notificación de pulsación del botón de ticket.
* `EV_SYS_CAR_LEFT_IN`: El vehículo se retiró de la entrada antes de completar la operación.
* `EV_SYS_CAR_PASSED`: Notificación de la bobina de salida de que el auto atravesó la barrera.
* `tick`: Evento de reloj del sistema ($1\text{ms}$) utilizado para decrementar los temporizadores.

### Comandos Hacia la Capa Actuator (`actuatorCmd_t`)
* `ACT_CMD_CAM_CAPTURE`: Activa el modo de espera/captura de la cámara.
* `ACT_CMD_SERVER_LOG_PATENT`: Envía la información de la patente al servidor central via UART.
* `ACT_CMD_PRINT_START`: Enciende el indicador de impresión (LED 1 en ON).
* `ACT_CMD_BARRIER_OPEN_FAST`: Configura el LED 2 en parpadeo rápido ($5\text{Hz}$, barrera subiendo).
* `ACT_CMD_BARRIER_KEEP_OPEN`: Mantiene el LED 2 encendido continuo (barrera alta).
* `ACT_CMD_BARRIER_CLOSE_SLOW`: Configura el LED 2 en parpadeo lento ($1\text{Hz}$, barrera bajando).
* `ACT_CMD_BARRIER_LOWERED`: Apaga el LED 2 (barrera cerrada).
* `ACT_CMD_RESET_ALL`: Apaga todas las salidas y restablece el estado de reposo.

### Temporizadores del Sistema (`uint32_t`)
* `DEL_TIMEOUT`: Contador para tiempos máximos de espera (cancela la operación si el auto o el usuario no responden).
* `DEL_PRINT`: Tiempo fijado para la simulación de impresión del ticket ($2000\text{ms}$).
* `DEL_BARRIER`: Tiempo de movimiento de la barrera al subir ($3000\text{ms}$) o bajar ($5000\text{ms}$).

## 2. Diagrama de Estados FSM Principal (`System`)

```text
                  EV_SYS_CAR_ARRIVED
  ┌──────────┐ ─────────────────────────> ┌───────────────────┐
  │ ST_IDLE  │                            │ ST_WAIT_CAM_PANEL │
  └──────────┘ <───────────────────────── └───────────────────┘
       ▲            timeout / no_car                │ EV_SYS_CAM_VALIDATED
       │                                            ▼
       │                                  ┌───────────────────┐
       │                                  │ ST_WAIT_BTN_PRESS │
       │                                  └───────────────────┘
       │                                            │ EV_SYS_BTN_DOWN
       │                                            ▼
       │                                  ┌───────────────────┐
       │                                  │ ST_PRINT_TICKET   │
       │                                  └───────────────────┘
       │                                            │ TIM_PRINT_END
       │                                            ▼
       │                                  ┌───────────────────┐
       │                                  │ ST_OPENING_BARRIER│
       │                                  └───────────────────┘
       │                                            │ TIM_BARRIER_OPEN
       │                                            ▼
       │  EV_SYS_CAR_PASSED               ┌───────────────────┐
       └───────────────────────────────── │ ST_CLOSING_BARRIER│
                                          └───────────────────┘
```
## Tabla de Transición de Estados (System STT)

| Estado Actual | Evento / Signal Recibido | Condición [Guardia] | Estado Siguiente | Acciones Realizadas / Comandos a `Actuator` |
| :--- | :--- | :--- | :--- | :--- |
| `ST_IDLE` | `EV_SYS_CAR_ARRIVED` | - | `ST_WAIT_CAM_PANEL` | `ACT_CMD_CAM_CAPTURE`, `tick=DEL_TIMEOUT_10s` | //(establecimos de manera arbitraria una espera de 10s, con fines prudenciales para la práctica)
| `ST_WAIT_CAM_PANEL` | `EV_SYS_CAM_VALIDATED` | - | `ST_WAIT_BTN_PRESS` | `ACT_CMD_SERVER_LOG_PATENT`, `tick=DEL_TIMEOUT_15s` |
| `ST_WAIT_CAM_PANEL` | - | `[tick == 0]` | `ST_IDLE` | `tick=ACT_CMD_RESET_ALL` | //caso de perturbaciones externas
| `ST_WAIT_CAM_PANEL` | `EV_SYS_CAR_LEFT_IN` | - | `ST_IDLE` | `tick=ACT_CMD_RESET_ALL` |
| `ST_WAIT_BTN_PRESS` | `EV_SYS_BTN_DOWN` | - | `ST_PRINT_TICKET` | `ACT_CMD_PRINT_START`, `tick=DEL_PRINT_2s` |
| `ST_WAIT_BTN_PRESS` | - | `[tick == 0]` | `ST_IDLE` | `tick=ACT_CMD_RESET_ALL` |
| `ST_WAIT_BTN_PRESS` | `EV_SYS_CAR_LEFT_IN` | - | `ST_IDLE` | `tick=ACT_CMD_RESET_ALL` |
| `ST_PRINT_TICKET` | - | `[tick == 0]` | `ST_OPENING_BARRIER` | `tick=ACT_CMD_BARRIER_OPEN_FAST`, `frecuency_up= DEL_BARRIER_5Hz` |
| `ST_OPENING_BARRIER` | - | `[frecuency_up == true]` | `ST_WAIT_CAR_PASS` | `ACT_CMD_BARRIER_KEEP_OPEN`, `tick= DEL_TIMEOUT_20s` |
| `ST_OPENED_BARRIER` | - | `[LED_ON == true]` | `ST_WAIT_CAR_PASS` | `ACT_CMD_BARRIER_KEEP_OPEN`, `tick= DEL_TIMEOUT_20s` |
| `ST_WAIT_CAR_PASS` | `EV_SYS_CAR_PASSED` | - | `ST_CLOSING_BARRIER` | `ACT_CMD_BARRIER_CLOSE_SLOW`, `frecuency_down= DEL_BARRIER_1Hz` |
| `ST_WAIT_CAR_PASS` | - | `[frecuency_down == true]` | `ST_CLOSING_BARRIER` | `ACT_CMD_BARRIER_CLOSE_SLOW`, `tick= DEL_TIMEOUT_20s`|
| `ST_CLOSING_BARRIER` | - | `[tick == 0]` | `ST_IDLE` | `ACT_CMD_RESET_ALL` |
