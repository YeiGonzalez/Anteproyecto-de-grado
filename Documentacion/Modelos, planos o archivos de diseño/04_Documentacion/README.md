# Repositorio de diseños · Supervisión de nivel en válvulas de flotador

**Universidad Tecnológica de Pereira | Ingeniería Mecatrónica | Anteproyecto (noviembre de 2026)**  
**Estado:** `R0 — diseño conceptual y preliminar, NO validado ni fabricable directamente`.

## Objeto
Anteproyecto: desarrollo y validación de un método de detección de niveles anormales asociados a fallas de válvulas con flotador mecánico, mediante sensor ultrasónico JSN-SR04T, ESP32, alarma sonora e IoT. Ensayos en banco representativo de **250 L** de la UTP.

El sistema electrónico **no abre/cierra la válvula, no identifica la pieza averiada y no realiza reparación**. Genera alertas por nivel alto/bajo. Condiciones de estudio: `N` (normal), `E1` (sello), `E2a` (brazo bloqueado con rebose), `E2b` (brazo bloqueado sin apertura), `E3` (boya sin flotabilidad).

## Contenido / trazabilidad

| Archivo | Qué contiene | Relación con el anteproyecto |
|---|---|---|
| `01_Diagramas/A-01_Arquitectura.drawio` (+ SVG/PDF) | Arquitectura editable en diagrams.net | OE1-OE3; producto de diseño del §9.1 |
| `01_Diagramas/M-01_Implantacion_banco.svg` (+ PDF) | Disposición física conceptual en tanque 250 L | OE1, OE2; medir Hs y zona ciega |
| `01_Diagramas/L-01_Logica_supervision.dot` (+ SVG/PDF) | Lógica de umbrales, alarma, IoT y trazabilidad | OE1-OE4; diagrama fuente Graphviz |
| `02_Electronica/E-01_Conexion_electrica.svg` (+ PDF) | Conexiones, resistores de adaptación y etapa de buzzer | OE2, OE3; **propuesta por verificar** |
| `03_Mecanica/M-02_Soporte_sensor_parametrico.scad` | CAD paramétrico editable para placa | OE2; cotas provisionales |
| `03_Mecanica/M-02_Soporte_sensor_preliminar.step` | Sólido CAD intercambiable (Fusion 360, otros) | OE2; generado desde geometría propuesta |
| `03_Mecanica/M-02_Soporte_sensor_preliminar.stl` | Malla para visualización o prueba dimensional | OE2; NO imprimir sin verificar |
| `03_Mecanica/M-02_Placa_soporte_contorno.dxf` | Contorno 2D de corte en mm | OE2; NO cortar sin verificar |
| `03_Mecanica/M-02_Plano_placa_soporte.svg` (+ PDF) | Plano acotado preliminar | OE2; revisar agujeros y soporte |
| `04_Documentacion/BOM_preliminar.csv` | Materiales propuestos y estado de confirmación | OE2/OE3 |
| `04_Documentacion/Interfaces_y_parametros.csv` | Pines y parámetros por confirmar | OE1/OE2/OE3 |
| `04_Documentacion/Trazabilidad.csv` | Relación OE-evidencia | §7 y §9.1 |

## Condiciones por verificar antes de fabricar o conectar

1. **Geometría del banco:** medidas reales de tapa/estructura, soporte existente, distancia desde sonda al fondo `Hs`, posición del nivel máximo y rebose. Verificar ausencia de interferencias del cono ultrasónico (paredes, boya, chorro de entrada).
2. **Zona ciega:** manual clásico JSN-SR04T indica **25 cm** de distancia mínima. Debe cumplirse incluso con el agua al nivel alto a detectar; esto puede requerir un soporte elevado sobre la tapa. Comprobar la versión real; algunos fabricantes especifican cifras distintas.
3. **Sonda mecánica:** diámetro de taladro Ø23 mm del CAD es **hipótesis de trabajo** (no medida). Existen variantes con dimensiones distintas. Confirmar brida, rosca, tuerca y cable antes del mecanizado.
4. **ESP32 y JSN específicos:** placa DevKit, pin VIN/5 V, modo de trabajo del JSN (TRIG/ECHO) y señales reales. GPIO18/19/23 son una **propuesta**, no decisiones ya acordadas.
5. **Nivel lógico ECHO:** en módulos alimentados a 5 V la salida puede tener nivel de 5 V; **no conectar directamente al ESP32**. El divisor preliminar R1=10 kΩ (serie), R2=15 kΩ (a GND) deja una salida nominal de 3,0 V a partir de 5,0 V. Corroborar con multímetro/osciloscopio y tolerancias de componentes.
6. **Buzzer y alimentación:** usar un avisador activo de 5 V compatible; transistor NPN dimensionado a su corriente; si es inductivo, añadir diodo apropiado. Utilizar fuente de 5 V aislada/certificada y gabinete protegido. No incluye diseño de acometida a 120 V.
7. **Umbrales y temporización:** `hA`, `hB`, `t_confirmación`, y máximos de aviso **no se conocen todavía**: se determinan con la caracterización del OE1 y no se incluyen valores arbitrarios en los diagramas.
8. **Aplicabilidad:** la validación se realiza en el banco de 250 L y no demuestra automáticamente desempeño en tanques de 10.000 L.

## Abrir / editar
- `.drawio`: diagrams.net (Archivo → Abrir).
- `.svg`: Inkscape o editor vectorial; se exportaron PDF para impresión.
- `.dot`: Graphviz (`dot -Tsvg L-01_Logica_supervision.dot -o salida.svg`).
- `.scad`: OpenSCAD; cambiar parámetros del encabezado y generar STL.
- `.step`: importar en Fusion 360 para ubicar y adaptar a la geometría real.
- `.dxf`: Fusion 360 / AutoCAD; unidades mm.

## Fuentes técnicas consultadas (no incluidas como archivos)
- ESP32-WROOM-32, datos eléctricos oficiales Espressif: https://documentation.espressif.com/esp32-wroom-32_datasheet_en.html
- JSN-SR04T, manual con 5 V y zona ciega 25 cm: https://www.openbikesensor.org/docs/other/collective-order/jsn-sr04t-en.pdf
- JSN-SR04T versiones alternativas y dimensiones de sonda: https://protosupplies.com/product/jsn-sr04t-v3-0-waterproof-ultrasonic-range-finder/

**Alcance de esta versión:** paquete base documentable en el repositorio, NO diseño constructivo aprobado, ni PCB/fabricación final. Las dimensiones/pines propuestos son hipótesis que requieren revisión del equipo y director.
