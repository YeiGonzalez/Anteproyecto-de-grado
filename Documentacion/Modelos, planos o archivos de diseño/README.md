# Modelos, planos y archivos de diseño

**Proyecto:** Desarrollo y validación de un método para detectar fallas en válvulas de flotador mecánico de tanques de almacenamiento de agua  
**Universidad Tecnológica de Pereira — Ingeniería Mecatrónica**  
**Estado de los diseños:** versión conceptual **R0**. Pendientes de verificación dimensional, eléctrica y experimental.

## Propósito de esta carpeta

Esta carpeta reúne los **archivos de diseño mecánico, diagramas de arquitectura, esquemas eléctricos y documentos de apoyo** previstos para la implementación de un sistema independiente de supervisión del nivel de agua en un banco de pruebas de **250 L**.

El sistema propuesto utiliza un **sensor ultrasónico JSN-SR04T**, un **ESP32**, una **alarma sonora** y una **plataforma IoT** para advertir condiciones de nivel alto o bajo asociadas a posibles fallas de la válvula de flotador mecánico.

**Alcance:** los archivos documentan el *diseño preliminar* de la solución. No representan un montaje fabricado, probado o aprobado. La electrónica no acciona la válvula ni identifica qué pieza mecánica falló.

## Estructura de archivos

```text
Modelos_Planos_Archivos_Diseno/
├── README.md
├── LEEME_PRIMERO.txt
├── 01_Diagramas/
│   ├── A-01_Arquitectura.drawio
│   ├── A-01_Arquitectura.svg
│   ├── A-01_Arquitectura.pdf
│   ├── L-01_Logica_supervision.dot
│   ├── L-01_Logica_supervision.svg
│   ├── L-01_Logica_supervision.pdf
│   ├── M-01_Implantacion_banco.svg
│   └── M-01_Implantacion_banco.pdf
├── 02_Electronica/
│   ├── E-01_Conexion_electrica.svg
│   └── E-01_Conexion_electrica.pdf
├── 03_Mecanica/
│   ├── M-02_Soporte_sensor_parametrico.scad
│   ├── M-02_Soporte_sensor_preliminar.step
│   ├── M-02_Soporte_sensor_preliminar.stl
│   ├── M-02_Placa_soporte_contorno.dxf
│   ├── M-02_Plano_placa_soporte.svg
│   └── M-02_Plano_placa_soporte.pdf
└── 04_Documentacion/
    ├── README.md
    ├── BOM_preliminar.csv
    ├── Interfaces_y_parametros.csv
    └── Trazabilidad.csv
```

> La estructura anterior representa el contenido del paquete de diseños R0. Los archivos podrán cambiar de nombre o revisión al avanzar la construcción.

## Descripción de los diseños

| Carpeta | Contenido | Aplicación en el proyecto |
|---|---|---|
| `01_Diagramas` | Arquitectura, lógica de supervisión e implantación conceptual del banco | Comprender el flujo de medición, procesamiento, alarma y envío IoT. |
| `02_Electronica` | Esquema preliminar de conexión entre sensor, ESP32, buzzer y alimentación | Preparar y revisar la interfaz electrónica antes del montaje. |
| `03_Mecanica` | Placa de soporte del sensor en CAD 3D, contorno DXF y plano acotado | Adaptar el transductor ultrasónico a la geometría real del banco. |
| `04_Documentacion` | Lista de materiales, tabla de interfaces y trazabilidad con los objetivos | Registrar decisiones, parámetros por definir y evidencias esperadas. |

## Archivos editables y formatos

- **`.drawio`**: diagrama de arquitectura editable en [diagrams.net](https://app.diagrams.net/).
- **`.dot`**: diagrama lógico editable con [Graphviz](https://graphviz.org/).
- **`.scad`**: modelo paramétrico editable en [OpenSCAD](https://openscad.org/).
- **`.step`**: modelo CAD 3D intercambiable; puede importarse en **Autodesk Fusion 360** para revisar y adaptar el soporte.
- **`.dxf`**: geometría 2D editable para bocetos o preparación de corte; **unidades en milímetros**.
- **`.stl`**: malla 3D para visualización o comprobaciones preliminares; **no se recomienda imprimir directamente sin validar las medidas**.
- **`.svg` / `.pdf`**: versiones de consulta y presentación de diagramas y planos.
- **`.csv`**: tablas editables de materiales, parámetros y trazabilidad.

## Aspectos pendientes de verificación

Antes de usar estos diseños para fabricar piezas o realizar conexiones eléctricas, el equipo deberá:

1. Medir las dimensiones reales del tanque, la tapa y el área donde se instalará el sensor.
2. Confirmar la **versión exacta del JSN-SR04T**, las dimensiones de su transductor y la distancia mínima operativa indicada por el fabricante; comprobar que el nivel máximo permanezca fuera de su zona ciega.
3. Verificar las cotas preliminares de la placa soporte (**90 × 65 × 5 mm**, con orificio propuesto de **Ø23 mm**) y adaptar el CAD si es necesario.
4. Confirmar el modelo de ESP32, los GPIO y los niveles eléctricos del sensor. Los pines **GPIO18 (TRIG)**, **GPIO19 (ECHO)** y **GPIO23 (buzzer)** son **propuestas de diseño**, no conexiones definitivas.
5. Adaptar de forma segura la señal **ECHO** a los niveles admitidos por el ESP32; el divisor resistivo dibujado es preliminar y requiere comprobación.
6. Definir experimentalmente los **umbrales de nivel alto y bajo**, el tiempo de confirmación y los tiempos máximos de detección y notificación a partir del objetivo específico 1 (OE1).
7. Revisar la protección de la electrónica frente a humedad, la fuente de alimentación y la seguridad del montaje antes de energizarlo.

## Relación con los objetivos del anteproyecto

| Objetivo | Contribución de los archivos |
|---|---|
| **OE1 — Definir requisitos** | Diagramas del sistema y tabla de parámetros pendientes de caracterización. |
| **OE2 — Implementar medición y alarma** | Esquema eléctrico y diseños del soporte del sensor ultrasónico. |
| **OE3 — Integrar IoT y registrar eventos** | Arquitectura de comunicación y lógica de notificación. |
| **OE4 — Evaluar el desempeño** | Trazabilidad de los diseños que servirán de referencia para los protocolos y registros de prueba. |

Estos archivos son evidencia de la **fase de diseño**. El cumplimiento de las metas de medición y detección se comprobará posteriormente con los ensayos previstos; no se presenta aquí como un resultado ya obtenido.

## Control de revisión

| Revisión | Estado | Descripción |
|---|---|---|
| **R0** | Preliminar | Primera colección de diagramas, propuesta eléctrica, modelos del soporte y documentación técnica. |

**Nota:** para especificaciones, supuestos técnicos y advertencias detalladas, consultar [`04_Documentacion/README.md`](04_Documentacion/README.md).
