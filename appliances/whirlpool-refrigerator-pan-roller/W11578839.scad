// ==========================================
// Whirlpool Refrigerator Pan Roller - WHEEL
// Part Number: W11578839
// Material: PETG or PLA (rigid)
// ==========================================

$fn = 60;

// WHEEL PARAMETERS
wheel_od = 31;
wheel_h = 8;
wheel_hole = 9;

echo("=== W11578839 PAN ROLLER WHEEL ===");
echo("Diameter:", wheel_od, "mm");
echo("Height:", wheel_h, "mm");
echo("Center hole:", wheel_hole, "mm");
echo("Material: PETG or PLA");

difference() {
    cylinder(h = wheel_h, d = wheel_od);
    translate([0, 0, -0.5])
        cylinder(h = wheel_h + 1, d = wheel_hole);
}
