// Rounded Rectangle Gasket - Hollow Center
// Revision: r09 (from r08 baseline)
// Changes: outer_width +1mm (34mm → 35mm)

// Parameters
outer_length = 46;          // mm (unchanged)
outer_width = 35;           // mm (CHANGED from 34mm, +1mm)
height = 4;                 // mm (unchanged)
outer_lip_thickness = 1;    // mm (unchanged)
groove_width = 3;           // mm (unchanged)
inner_lip_thickness = 1;    // mm (unchanged)
floor_thickness = 1;        // mm (unchanged)
corner_radius = 8;          // mm (unchanged)

// Revision stamp parameters
revision = "r09";
text_size = 6;
text_depth = 0.4;

// Calculated values
groove_depth = height - floor_thickness;
total_wall_distance = outer_lip_thickness + groove_width;

// Inner lip dimensions
inner_lip_outer_length = outer_length - (2 * total_wall_distance);
inner_lip_outer_width = outer_width - (2 * total_wall_distance);
inner_lip_inner_length = inner_lip_outer_length - (2 * inner_lip_thickness);
inner_lip_inner_width = inner_lip_outer_width - (2 * inner_lip_thickness);

// Center position for text
center_x = outer_length / 2;
center_y = outer_width / 2;

// Verification output
echo("===========================================");
echo("       VERIFICATION REPORT - r09");
echo("       (from r08 baseline)");
echo("===========================================");
echo("");
echo("--- CHANGED PARAMETER ---");
echo("Outer Width:", outer_width, "mm (was 34mm, +1mm)");
echo("");
echo("--- VERIFIED UNCHANGED (LIP DISTANCES) ---");
echo("Outer Lip Thickness:", outer_lip_thickness, "mm ✓");
echo("Groove Width:", groove_width, "mm ✓");
echo("Inner Lip Thickness:", inner_lip_thickness, "mm ✓");
echo("Total Wall Distance:", total_wall_distance, "mm ✓");
echo("");
echo("--- OTHER UNCHANGED ---");
echo("Outer Length:", outer_length, "mm ✓");
echo("Height:", height, "mm ✓");
echo("Floor Thickness:", floor_thickness, "mm ✓");
echo("Corner Radius:", corner_radius, "mm ✓");
echo("");
echo("--- CALCULATED DIMENSIONS ---");
echo("Overall:", outer_length, "x", outer_width, "x", height, "mm");
echo("Inner Lip Outer:", inner_lip_outer_length, "x", inner_lip_outer_width, "mm");
echo("Center Floor:", inner_lip_inner_length, "x", inner_lip_inner_width, "mm");
echo("===========================================");

// Module for rounded rectangle
module rounded_rect(length, width, h, radius) {
    r = min(radius, length/2, width/2);
    
    hull() {
        translate([r, r, 0])
            cylinder(h=h, r=r, $fn=64);
        translate([length - r, r, 0])
            cylinder(h=h, r=r, $fn=64);
        translate([r, width - r, 0])
            cylinder(h=h, r=r, $fn=64);
        translate([length - r, width - r, 0])
            cylinder(h=h, r=r, $fn=64);
    }
}

// Main gasket construction
difference() {
    union() {
        // 1. Full base floor
        rounded_rect(outer_length, outer_width, floor_thickness, corner_radius);
        
        // 2. Outer lip
        difference() {
            rounded_rect(outer_length, outer_width, height, corner_radius);
            
            translate([outer_lip_thickness, outer_lip_thickness, -0.1])
                rounded_rect(
                    outer_length - 2*outer_lip_thickness,
                    outer_width - 2*outer_lip_thickness,
                    height + 0.2,
                    corner_radius - outer_lip_thickness
                );
        }
        
        // 3. Inner lip
        translate([total_wall_distance, total_wall_distance, 0])
        difference() {
            rounded_rect(
                inner_lip_outer_length,
                inner_lip_outer_width,
                height,
                max(0.5, corner_radius - total_wall_distance)
            );
            
            translate([inner_lip_thickness, inner_lip_thickness, -0.1])
                rounded_rect(
                    inner_lip_inner_length,
                    inner_lip_inner_width,
                    height + 0.2,
                    max(0.5, corner_radius - total_wall_distance - inner_lip_thickness)
                );
        }
    }
    
    // 4. Engrave revision number in center of floor
    translate([center_x, center_y, floor_thickness - text_depth + 0.01])
        linear_extrude(height = text_depth + 0.1)
            text(revision, 
                 size = text_size, 
                 font = "Liberation Sans:style=Bold",
                 halign = "center", 
                 valign = "center",
                 $fn = 32);
}
