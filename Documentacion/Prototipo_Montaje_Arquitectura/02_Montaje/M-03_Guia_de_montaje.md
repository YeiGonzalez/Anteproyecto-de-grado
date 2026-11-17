# Guía de montaje propuesta — banco de 250 L

**Revisión:** P0.1  
**Estado:** procedimiento previsto, pendiente de ejecutar y registrar en el banco de la UTP.

## A. Preparación del banco

1. Solicitar autorización de uso del banco, identificar válvula de flotador, punto de alimentación y drenaje, y verificar disponibilidad de fuente de agua.
2. Medir y registrar geometría: altura del tanque, ubicación del nivel máximo y mínimo, punto de fijación del sensor y altura `Hs` sobre el fondo.
3. Seleccionar lugar protegido para el ESP32, la fuente y el buzzer; separar el área eléctrica de agua y salpicaduras.
4. Confirmar **revisión específica** del JSN-SR04T y su zona ciega; no dejar la superficie del agua dentro de esta zona en nivel máximo.

## B. Montaje de instrumentación

5. Verificar las dimensiones del transductor y del soporte contra las cotas del diseño. No fabricar la pieza preliminar si no coincide con el componente real.
6. Fijar el sensor **vertical y dirigido hacia la superficie libre**, sin interferir con boya, brazo, tubería o chorro de entrada.
7. Colocar una **referencia graduada fija** en el tanque, visible en el registro fotográfico o de video.
8. Anotar la distancia geométrica `Hs` y tomar fotografías del sensor y su posición (con escala visible).

## C. Electrónica y alimentación

9. Revisar el esquema **preliminar** y confirmar el pinout real del ESP32 antes de cablear. No asumir que los GPIO propuestos son los definitivos.
10. Comprobar tensión de alimentación del sensor y lógica de **ECHO** para la variante adquirida. Proveer adaptación de nivel si supera los límites de entrada del ESP32.
11. Conectar el buzzer mediante una etapa de accionamiento acorde con su tensión y corriente; verificar la protección necesaria según el modelo elegido.
12. Integrar gabinete, prensaestopas y fuente certificada; mantener la red de 120 V fuera del montaje experimental expuesto.
13. Hacer una **revisión sin energía** (polaridad, ausencia de cortocircuitos, aislamiento, sujeción y posibilidad de goteo). Registrar responsable y fecha.

## D. Integración de software y comunicación

14. Instalar firmware **versionado** con parámetros `Hs`, umbrales, filtrado e intervalo de muestreo definidos en OE1.
15. Configurar Wi-Fi, la plataforma IoT y el destino de notificaciones. Nunca incorporar claves o tokens al repositorio público.
16. Verificar individualmente medición, alarma sonora y registro en la plataforma antes de probarlos simultáneamente.
17. Registrar códigos, versiones, asignación real de pines y capturas del historial de eventos.

## E. Puesta en marcha preliminar

18. Llenar y vaciar bajo supervisión mientras se contrasta la lectura del sensor con la referencia graduada. Documentar cualquier inestabilidad, lectura perdida o reinicio.
19. Comprobar una alerta por nivel alto y otra por nivel bajo de forma controlada, **solo tras fijar sus umbrales en OE1**.
20. Confirmar un evento local y su correspondencia con registro IoT y recepción del aviso, diferenciando tiempos de detección y notificación.
21. Registrar los cambios del montaje y actualizar esquemas, fotografías y bitácora.

## Reglas de seguridad

- Mantener un desagüe operativo y limitar el volumen empleado en pruebas de rebose; recircular cuando sea viable.
- Desenergizar para modificar conexiones.
- Evitar alimentar directamente el GPIO con señales de 5 V sin adaptación verificada.
- Si se pierde Wi-Fi, documentar el estado del aviso sin confundirlo con la activación de la alarma local.
- No presentar pruebas preliminares de integración como **validación OE4**: esa evaluación exige ensayos independientes y métricas trazables.

## Evidencias mínimas sugeridas

Fotografías de vista general, sensor y altura `Hs`, gabinetes/cableado protegido, alarma, pantalla de la plataforma IoT; croquis final del montaje; tabla de pines; versión del firmware; hoja de registro de integración.
