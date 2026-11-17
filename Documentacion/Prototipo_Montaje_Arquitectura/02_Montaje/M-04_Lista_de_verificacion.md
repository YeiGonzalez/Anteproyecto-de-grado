# Lista de verificación de montaje e integración

**Banco:** ________  **Fecha:** ________  **Responsable(s):** ________  **Firmware:** ________

## Antes de fabricar o instalar

- [ ] Versión y hoja técnica del JSN-SR04T identificadas.
- [ ] Dimensiones del transductor, soporte y fijación verificadas en el banco.
- [ ] Altura `Hs` medida y documentada.
- [ ] Distancia sensor–nivel máximo fuera de la zona ciega del sensor.
- [ ] Sensor no interfiere con válvula, flotador ni chorro de entrada.
- [ ] Referencia graduada fija disponible.

## Antes de energizar

- [ ] Modelo de ESP32 y GPIO reales documentados.
- [ ] Voltajes y polaridad verificados (sensor, ESP32, buzzer).
- [ ] Nivel de `ECHO` adaptado a entrada del ESP32, si corresponde.
- [ ] Etapa de potencia del buzzer verificada frente a su consumo.
- [ ] Conexiones firmes, masa de referencia y aislamiento revisados.
- [ ] Fuente certificada y electrónica protegida de humedad.
- [ ] Desagüe y control del agua disponibles.
- [ ] Aprobación para energizar / responsable registrado.

## Integración funcional (completar con evidencia)

- [ ] Distancia y nivel de agua leídos y registrados.
- [ ] Error frente a referencia comprobado (sin declarar aún el cumplimiento OE4).
- [ ] Alarma local activada en prueba controlada de nivel alto.
- [ ] Alarma local activada en prueba controlada de nivel bajo.
- [ ] Eventos identificables en historial IoT.
- [ ] Avisos correlacionados con recepción en celular.
- [ ] Se documentó el comportamiento al perder o recuperar Wi-Fi.
- [ ] Se conservaron fotos y versión final de conexiones.

**Resultado de la lista:** ☐ Pendiente ☐ Conforme para integración ☐ No conforme  
**Hallazgos / acciones correctivas:** __________________________

Esta lista verifica preparación y montaje, **no reemplaza** el protocolo estadístico de aceptación de OE4.
