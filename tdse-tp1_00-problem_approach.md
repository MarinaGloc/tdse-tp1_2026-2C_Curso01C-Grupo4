# Problem Approach: Intelligent Parking Management System (PTDM)

## Descripción General de la Solución Comercial
El sistema gestiona el control de acceso, cobro y nivel de ocupación de una playa de estacionamiento mediante arquitectura cliente-servidor.

### Componentes Principales:
* **Servidor Central (Parking System Server):** Base de datos unificada para validar tarifas, ingresos, egresos, abonados y registros de patentes.
* **Carril de entrada:**
  * **Máquina expendedora de tickets de estacionamiento (PTDM):** Módulo emisor de tickets.
  * **Cámara de captura / ANPR:** Lectura automática de patentes de vehículos. // PREGUNTAR AL PROFE SI ES MUY NECESARIA
  * **Lazo inductivo (Bobina sensor):** Detección inductiva de presencia de vehículo.
  * **Barrera:** Control físico de paso.
* **Estación de pago:** Terminales de cobro automático o manual. // TAMBIEN CONSULTAR ESTO
* **Carril de salida:** Módulo lector de tickets validados y control de salida.

---

## Flujo de Operación de la Máquina Expendedora de Tickets (PTDM)
1. **Detección Inicial:** El vehículo se ubica sobre el sensor inductivo (*Bobina*) frente al dispensador.
2. **Captura de Patente:** La cámara toma la fotografía del vehículo y envía el número de patente al servidor central para su registro. //VER SI ES NECESARIA
3. **Solicitud de Ticket:** El usuario presiona el botón (*Ticket Button*).
4. **Emisión y Registro:** El PTDM imprime el ticket con código de barras/QR (asociando ID, patente, fecha y hora) y notifica la entrada al servidor.
5. **Habilitación de Paso:** El PTDM envía la orden a la barrera vehicular para su apertura.
6. **Paso y Cierre:** El vehículo atraviesa la barrera, el sensor de salida confirma que la zona quedó liberada y la barrera procede al cierre automático.

CONSULTAR SI AGREGAMOS LA TARJETA AL SISTEMA,  y display de numero de vacantes.-

---

## Arquitectura de Software Temporizada (Update by Time, period = 1ms)
El programa está organizado en módulos independientes que se ejecutan de forma cíclica cada **1 ms**:
//CAMBIAR CON MERMAID
┌──────────────────┐      ┌──────────────────┐      ┌──────────────────┐
│      SENSOR      │───>  │      SYSTEM      │───>  │     ACTUATOR     │
│ (Lectura/Filtro) │      │ (Lógica/Estados) │      │ (Salidas/Control)│
└──────────────────┘      └──────────────────┘      └──────────────────┘

1. **`Sensor` (Escrutar):** 
   * Módulo encargado de realizar el muestreo de entradas digitales hardware.
   * Aplica algoritmos de filtrado (debounce/antirrebote por tiempo) a la señal física.
   * Genera y notifica eventos lógicos limpios hacia la capa *System*.

2. **`System` (Procesar):**
   * Módulo central que implementa la Máquina de Estados Finitos (FSM) principal.
   * Evalúa las transiciones de estado según los eventos provenientes del módulo *Sensor* o temporizaciones internas.
   * Dicta las órdenes de control hacia el módulo *Actuator*.

3. **`Actuator` (Actuar):**
   * Módulo encargado del comando de las salidas digitales hardware.
   * Controla retardo, parpadeos o tiempos de activación/desactivación de los periféricos físicos según las instrucciones recibidas de *System*.

---

## Abstracción para Desarrollo y Simulación en Placa Prototipo

Para simular y validar el comportamiento lógico de la máquina de estados sin contar con la infraestructura física real, se mapean los componentes a los periféricos de la placa de desarrollo y se define su comportamiento operativo:

| Periférico Real del Sistema | Mapeo en Placa Prototipo | Tipo de E/S | Comportamiento Simulado |
| :--- | :--- | :--- | :--- |
| **Ticket Button** | Pulsador 1 | Entrada Digital (`Sensor`) | **Presionado:** Solicita la emisión del ticket.<br>**Suelto:** Estado de reposo. |
| **Bobina (Entrada)** | DIP Switch 1 | Entrada Digital (`Sensor`) | **ON:** Simula presencia de vehículo sobre el lazo.<br>**OFF:** Sin vehículo. |
| **Bobina (Salida)** | DIP Switch 2 | Entrada Digital (`Sensor`) | **ON:** Simula vehículo pasando por la barrera.<br>**OFF:** Zona de paso libre. |
| **Cámara ANPR (Lectura)** | DIP Switch 3 / Pulsador 2 | Entrada Digital (`Sensor`) | **ON:** Simula lectura y validación correcta de patente.<br>**OFF:** En espera / Sin captura. |
| **Impresora / Display** | LED 1 (Azul) | Salida Digital (`Actuator`) | **Apagado:** En reposo.<br>**Encendido:** Indica que se está imprimiendo/emitiendo el ticket. |
| **Barrera Vehicular (Motor)** | LED 2 (Verde) | Salida Digital (`Actuator`) | **Apagado:** Barrera baja (cerrada).<br>**Encendido continuo:** Barrera alta (completamente abierta).<br>**Titileo rápido (ej. 5 Hz):** Barrera subiendo.<br>**Titileo lento (ej. 1 Hz):** Barrera bajando. |
| **Conexión Servidor** | LED 3 (Rojo) / UART | Salida / Comm (`Actuator`) | **Parpadeo corto:** Transmisión/recepción de datos con el servidor central. | //PREGUNTAR