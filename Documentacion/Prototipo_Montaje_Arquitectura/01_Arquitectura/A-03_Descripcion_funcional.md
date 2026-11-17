# Arquitectura funcional del prototipo — propuesta P0.1

## 1. Objetivo de la arquitectura

Supervisar el nivel de agua en un tanque de 250 L que conserva su propia **válvula de flotador mecánico**. La electrónica es independiente de dicha válvula y únicamente cumple funciones de **medición, detección de anomalías, aviso local y notificación remota**.

## 2. Cadena de información

| Origen | Dato / interfaz | Destino | Función |
|---|---|---|---|
| Superficie de agua | Eco ultrasónico | JSN-SR04T | Obtener distancia `d` |
| JSN-SR04T | Pulsos TRIG/ECHO; conversión adecuada del ECHO | ESP32 | Calcular nivel `h = Hs - d` |
| ESP32 | Salida de activación | Etapa del buzzer | Alarma de nivel anormal |
| ESP32 | Wi-Fi; nivel y evento con tiempo | Plataforma IoT | Historial y gestión de aviso |
| Plataforma IoT | Notificación | Celular | Informar al usuario |
| Referencia graduada / video | Nivel real y tiempo de cruce | Registro de pruebas | Contrastar el desempeño en OE4 |

## 3. Estados previstos

- **Normal:** el nivel permanece entre los límites y no debe existir alarma.
- **Anormal alto:** el nivel supera el umbral superior durante el tiempo de confirmación y debe activarse el aviso.
- **Anormal bajo:** el nivel desciende bajo el umbral inferior durante el tiempo de confirmación y debe activarse el aviso.
- **Retorno a normal:** al retornar al intervalo permitido, se debe registrar el cambio y definir el restablecimiento de la alarma.
- **Conectividad no disponible:** la alarma local no debería depender del acceso a internet. El tratamiento exacto de pérdida, reintento y duplicación del aviso requiere definición e implementación.
- **Lectura de sensor no válida:** el comportamiento seguro, su registro y cualquier advertencia de falla de medición requieren especificarse antes de la puesta en marcha; no deben confundirse con una falla comprobada de la válvula.

## 4. Parámetros por definir con OE1 y montaje

`Hs`, `h_alto`, `h_bajo`, `t_confirmacion`, `intervalo_muestreo`, `t_max_deteccion`, `t_max_notificacion`, versión de sensor, versión ESP32, credenciales/configuración de la plataforma (fuera del repositorio), y límites de conectividad.

## 5. Referencia experimental

La propuesta considera las condiciones **N, E1, E2a, E2b y E3** para evaluar alertas de nivel alto o bajo. Se busca evaluar la supervisión de condiciones anormales asociadas a esos escenarios; **no se implementa un clasificador de fallas por componente**.

**Estado:** arquitectura de diseño. La transición a `IMPLEMENTADO` requiere fotografías reales, registro de firmware y resultados de integración.
