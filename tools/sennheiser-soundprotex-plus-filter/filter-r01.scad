// Soundprotex-Plus Filter Cap
// Flipped: wide base on bottom, open stem at top, with grip groove

$fn = 100;

// --- Key dimensions (mm) ---
cap_r          = 4.5;      // base radius (9mm diameter)
hole_r         = 2.0;      // hole radius (4mm diameter)
stem_wall      = 1.0;      // stem wall thickness
stem_r         = hole_r + stem_wall;  // stem outer radius (4mm = 8mm diameter)
cap_thickness  = 0.9;      // solid base thickness (tripled from 0.3)
total_h        = 4.5;      // total height
stem_h         = total_h - cap_thickness;  // 3.1mm stem height

// Groove dimensions
groove_h       = 1.5;      // groove height
groove_depth   = 0.5;      // groove depth (inward from outer surface)
groove_z       = cap_thickness;  // groove starts at top of base

// --- TPU print adjustments ---
tpu_hole_tol   = 0;        // extra clearance on hole for TPU flex
chamfer_h      = 0.4;      // edge chamfer height
chamfer_w      = 0.4;      // edge chamfer width
hole_chamfer   = 0.3;      // chamfer at hole entry (printability)
hole_draft     = 0.8;      // degrees of draft on hole walls

// Adjusted hole radius with tolerance
hole_r_adj     = hole_r + tpu_hole_tol;

// --- Modules ---

// Chamfered ring on base bottom to improve first-layer adhesion
module bottom_chamfer() {
    translate([0, 0, -0.01])
        difference() {
            cylinder(r=cap_r + 0.01, h=chamfer_h + 0.01);
            cylinder(r1=cap_r - chamfer_w, r2=cap_r, h=chamfer_h + 0.01);
        }
}

// Circular hole from top with draft angle and entry chamfer
module circular_hole() {
    // Main hole with slight draft (wider at top for easy insertion)
    draft_offset = stem_h * tan(hole_draft);
    
    // Tapered cylinder using hull
    hull() {
        // Top of hole (wider)
        translate([0, 0, total_h + 0.01])
            cylinder(r=hole_r_adj + draft_offset, h=0.01);
        // Bottom of hole (narrower, stops at base)
        translate([0, 0, cap_thickness])
            cylinder(r=hole_r_adj, h=0.01);
    }

    // Entry chamfer at top edge
    translate([0, 0, total_h - hole_chamfer])
        cylinder(r1=hole_r_adj + draft_offset, 
                 r2=hole_r_adj + draft_offset + hole_chamfer, 
                 h=hole_chamfer + 0.02);
}

// Groove around stem circumference with tapered top edge
module groove() {
    translate([0, 0, groove_z])
        difference() {
            cylinder(r=stem_r + 0.01, h=groove_h);
            // Main groove depth
            cylinder(r=stem_r - groove_depth, h=groove_h - chamfer_h + 0.01);
            // Tapered exit at top of groove
            translate([0, 0, groove_h - chamfer_h])
                cylinder(r1=stem_r - groove_depth, r2=stem_r - chamfer_w, h=chamfer_h + 0.01);
        }
}

// --- Main assembly ---
module filter_cap() {
    difference() {
        union() {
            // Wide base on bottom (9mm OD, solid)
            cylinder(r=cap_r, h=cap_thickness);
            
            // Stem (narrow tube, 8mm OD)
            translate([0, 0, cap_thickness])
                cylinder(r=stem_r, h=stem_h);
        }

        // Circular hole from top
        circular_hole();

        // Bottom edge chamfer for bed adhesion
        bottom_chamfer();
        
        // Grip groove
        groove();
    }
}

filter_cap();
