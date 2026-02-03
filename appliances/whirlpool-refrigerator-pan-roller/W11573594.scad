// ==========================================
// Whirlpool Refrigerator Pan Roller - AXLE
// Part Number: W11573594
// Material: TPU (flexible for snap-fit)
// ==========================================

$fn = 60;

// AXLE PARAMETERS (20mm total)
axle_shaft_d = 8;
axle_shaft_h = 8;
axle_shoulder_d = 10;
axle_shoulder_h = 2;
leg_length = 10;

// Leg geometry
leg_width = 3;
leg_thickness = 1.5;
leg_offset = 2.2;
fillet_r = 1.0;

// Rib reinforcement
rib_width = 1.0;
rib_height = 0.8;

// Wedge
wedge_height = 3;
wedge_extension = 1.2;

echo("=== W11573594 PAN ROLLER AXLE ===");
echo("Total height: 20mm");
echo("Shoulder:", axle_shoulder_d, "x", axle_shoulder_h, "mm");
echo("Shaft:", axle_shaft_d, "x", axle_shaft_h, "mm");
echo("Legs: 3 at 120°");
echo("Material: TPU");

module axle() {
    // Shoulder at BOTTOM (print bed)
    cylinder(h = axle_shoulder_h, d = axle_shoulder_d);
    
    // Main shaft
    translate([0, 0, axle_shoulder_h])
        cylinder(h = axle_shaft_h, d = axle_shaft_d);
    
    // Center core for leg attachment
    translate([0, 0, axle_shoulder_h + axle_shaft_h])
        cylinder(h = 4, d = 6);
    
    // Three legs at 120°
    for (angle = [0, 120, 240]) {
        rotate([0, 0, angle])
            translate([leg_offset, 0, axle_shoulder_h + axle_shaft_h])
                leg_with_wedge();
    }
}

module leg_with_wedge() {
    // Main leg body
    translate([-leg_thickness/2, -leg_width/2, 0])
        cube([leg_thickness, leg_width, leg_length - wedge_height]);
    
    // Center rib
    translate([-leg_thickness/2 - rib_height, -rib_width/2, 0])
        cube([rib_height, rib_width, leg_length - wedge_height]);
    
    // Fillet at base
    fillet();
    
    // Solid wedge at tip
    translate([0, 0, leg_length - wedge_height])
        solid_wedge();
}

module fillet() {
    difference() {
        translate([-leg_thickness/2 - fillet_r, -leg_width/2, 0])
            cube([fillet_r, leg_width, fillet_r]);
        translate([-leg_thickness/2 - fillet_r, -leg_width/2 - 0.1, fillet_r])
            rotate([-90, 0, 0])
                cylinder(h = leg_width + 0.2, r = fillet_r);
    }
}

module solid_wedge() {
    polyhedron(
        points = [
            [-leg_thickness/2, -leg_width/2, 0],
            [-leg_thickness/2, leg_width/2, 0],
            [-leg_thickness/2, leg_width/2, wedge_height],
            [-leg_thickness/2, -leg_width/2, wedge_height],
            [leg_thickness/2, -leg_width/2, 0],
            [leg_thickness/2, leg_width/2, 0],
            [leg_thickness/2, leg_width/2, wedge_height],
            [leg_thickness/2, -leg_width/2, wedge_height],
            [leg_thickness/2 + wedge_extension, -leg_width/2, 0],
            [leg_thickness/2 + wedge_extension, leg_width/2, 0],
            [leg_thickness/2 + wedge_extension, leg_width/2, wedge_height * 0.6],
            [leg_thickness/2 + wedge_extension, -leg_width/2, wedge_height * 0.6],
        ],
        faces = [
            [0, 1, 2, 3],
            [0, 4, 5, 1],
            [4, 8, 9, 5],
            [0, 3, 7, 4],
            [4, 7, 11, 8],
            [1, 5, 6, 2],
            [5, 9, 10, 6],
            [3, 2, 6, 7],
            [7, 6, 10, 11],
            [8, 11, 10, 9],
        ]
    );
}

axle();
