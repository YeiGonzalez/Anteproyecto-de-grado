# Interfaces y parámetros de integración

> Los GPIO y elementos de circuito indicados como «propuestos» proceden de los diseños conceptuales R0. Deben validarse y actualizarse cuando se seleccione el hardware real.

| Interfaz / parámetro | Valor / propuesta | Confirmación necesaria |
|---|---|---|
| Banco de pruebas | Tanque de 250 L | Confirmar disponibilidad y punto de instalación |
| Transductor ultrasónico | JSN-SR04T | Confirmar revisión, cable y zona ciega |
| Controlador | ESP32 con Wi-Fi | Confirmar modelo, GPIO disponibles y alimentación |
| TRIG sensor | GPIO18 (propuesto) | Verificar pinout final |
| ECHO sensor | GPIO19 con adaptación eléctrica (propuesto) | Verificar nivel de salida y divisor/acondicionador real |
| Buzzer | GPIO23 hacia etapa de accionamiento (propuesto) | Elegir buzzer y medir consumo |
| Alimentación | Fuente certificada de 5 V (propuesta) | Verificar corriente, aislamiento, cableado y seguridad |
| `Hs` | Por medir, cm | Medir altura de montaje con referencia al fondo |
| Umbral alto / bajo | Por definir en OE1 | Justificar con nivel normal y ensayos caracterizados |
| Tiempo de confirmación | Por definir en OE1 | Seleccionar según variación y filtrado |
| Muestreo y filtrado | Por definir | Registrar versión y mantener constante en ensayos |
| Wi-Fi / plataforma | Por seleccionar y configurar | Registrar condiciones, sin claves ni tokens |
| Tiempo máximo de alarma | Por definir en OE1 | Límite independiente de la notificación remota |
| Tiempo máximo de notificación | Por definir en OE1 | Depende de conectividad y protocolo |
| Criterio de error | Menor a 2 cm | Meta de OE2/OE4, aún no demostrada |
| Criterio de aciertos | Al menos 95 % | Meta de OE4, aún no demostrada |

**Condiciones experimentales:** N (normal), E1 (sello), E2a (bloqueo con rebose), E2b (bloqueo sin apertura) y E3 (boya).

**Regla:** actualizar esta tabla con **valores realmente usados** al implementar; no reemplazar valores desconocidos por supuestos.
