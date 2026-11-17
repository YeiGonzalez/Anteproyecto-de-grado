// M-02 Placa soporte paramétrica para sonda JSN-SR04T (PRELIMINAR)
// Objeto: adaptador genérico para soporte externo del laboratorio, no fijación al tanque.
// Las dimensiones siguientes SON PROVISIONALES. Medir diámetro real del transductor,
// su sistema de retención, la separación del soporte y disponibilidad de tornillos.
// NO FABRICAR sin revisar las medidas y la holgura por zona ciega del sensor.
// Unidades: mm
plate_x = 90.0;
plate_y = 65.0;
plate_thickness = 5.0;
probe_hole_d = 23.0; // VERIFICAR: versiones comerciales pueden diferir.
mount_slot_length = 12.0; // Longitud total, incluidos extremos redondeados.
mount_slot_width = 5.0;
mount_x = 33.0;
mount_y = 22.0;
$fn = 96;
module slot_2d(L, W) {
    hull() {
        translate([-(L-W)/2, 0]) circle(d=W);
        translate([+(L-W)/2, 0]) circle(d=W);
    }
}
module support_plate() {
    difference() {
        translate([-plate_x/2,-plate_y/2,0]) cube([plate_x,plate_y,plate_thickness]);
        translate([0,0,-1]) cylinder(d=probe_hole_d,h=plate_thickness+2);
        for(x=[-mount_x,mount_x],y=[-mount_y,mount_y])
            translate([x,y,-1]) linear_extrude(height=plate_thickness+2)
                slot_2d(mount_slot_length,mount_slot_width);
    }
}
support_plate();
