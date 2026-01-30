# Functional Specification Document

**Document Title:** Whirlpool Dishwasher Rinse Aid Gasket  
**Document Number:** RINSE-AID-GASKET-R08-FSD  
**Revision:** r08  
**Date:** January 2026  
**Status:** Released  

---

## 1. Purpose

This document defines the functional specifications for a 3D-printed gasket designed for sealing applications. The gasket features a dual-lip design with an internal groove channel for improved sealing performance.

---

## 2. Scope

This specification covers:
- Physical dimensions and tolerances
- Material requirements
- Manufacturing process (3D printing)
- Functional requirements

---

## 3. Functional Requirements

| ID | Requirement | Value |
|----|-------------|-------|
| FR-01 | Gasket shall provide seal between two mating surfaces | Pass/Fail |
| FR-02 | Gasket shall withstand repeated compression cycles | Min. 100 cycles |
| FR-03 | Gasket shall be manufactured via FDM 3D printing | Required |
| FR-04 | Gasket shall include revision marking | Engraved text |

---

## 4. Physical Specifications

### 4.1 Outer Dimensions
| Parameter | Nominal | Tolerance |
|-----------|---------|-----------|
| Length | 46 mm | ± 0.3 mm |
| Width | 34 mm | ± 0.3 mm |
| Height | 4 mm | ± 0.2 mm |
| Corner Radius | 8 mm | ± 0.5 mm |

### 4.2 Internal Features
| Feature | Nominal | Tolerance |
|---------|---------|-----------|
| Outer Lip Thickness | 1 mm | ± 0.1 mm |
| Groove Width | 3 mm | ± 0.2 mm |
| Inner Lip Thickness | 1 mm | ± 0.1 mm |
| Floor Thickness | 1 mm | ± 0.1 mm |
| Groove Depth | 3 mm | ± 0.2 mm |

### 4.3 Derived Dimensions
| Feature | Value |
|---------|-------|
| Outer→Inner Distance | 4 mm |
| Inner Lip Outer | 38 × 26 mm |
| Center Floor Area | 36 × 24 mm |

### 4.4 Revision Marking
| Parameter | Value |
|-----------|-------|
| Text | "r08" |
| Font Size | 6 mm |
| Depth | 0.4 mm |
| Method | Engraved (recessed) |
| Location | Center of floor |

---

## 5. Material Specification

### 5.1 Approved Material
| Property | Specification |
|----------|---------------|
| Material | PETG (Polyethylene Terephthalate Glycol) |
| Form | 1.75 mm filament |
| Color | As required |

### 5.2 Material Properties
| Property | Typical Value |
|----------|---------------|
| Tensile Strength | 50 MPa |
| Flexural Modulus | 2,100 MPa |
| Heat Deflection | 70°C |
| Chemical Resistance | Good |

### 5.3 Non-Approved Materials
| Material | Status | Reason |
|----------|--------|--------|
| PLA | ❌ Rejected | Too rigid, poor seal, brittle failure |
| TPU | ⚠️ Not tested | May be suitable for enhanced flexibility |

---

## 6. Manufacturing Specification

### 6.1 Process
| Parameter | Value |
|-----------|-------|
| Method | FDM (Fused Deposition Modeling) |
| Orientation | Flat (floor on build plate) |
| Supports | None required |

### 6.2 Print Parameters
| Parameter | Value |
|-----------|-------|
| Layer Height | 0.2 mm |
| Wall Count | 3-4 |
| Infill | 100% |
| Print Speed | 40-50 mm/s |
| Nozzle Temperature | 230-250°C |
| Bed Temperature | 70-80°C |
| Cooling | 50% |
| Retraction | 4-6 mm |

---

## 7. Quality Requirements

### 7.1 Visual Inspection
| Criteria | Requirement |
|----------|-------------|
| Surface Finish | No visible layer separation |
| Warping | None |
| Stringing | Minimal, easily removable |
| Revision Text | Legible |

### 7.2 Dimensional Inspection
| Feature | Method | Frequency |
|---------|--------|-----------|
| Outer dimensions | Caliper | 100% |
| Wall thickness | Caliper | Sample |
| Height | Caliper | 100% |

---

## 8. Revision History

| Rev | Date | Changes | Author |
|-----|------|---------|--------|
| r01 | - | Initial stamped version (43×35×5, 2mm groove) | - |
| r02 | - | Height -2mm, Length +2mm | - |
| r03 | - | Corner radius 5mm → 8mm | - |
| r04 | - | Length +2mm, Groove +2mm | - |
| r05 | - | Groove -1mm | - |
| r06 | - | Width -1mm | - |
| r07 | - | Length -1mm, outer dims finalized | - |
| **r08** | **Jan 2026** | **Height +1mm (3→4mm)** | **Current** |

---

## 9. Reference Files

| File | Description |
|------|-------------|
| `gasket_r08.stl` | 3D printable model |
| `gasket_r08.scad` | OpenSCAD parametric source |
| `gasket-r08-FSD.md` | This document |

---

## 10. OpenSCAD Source Parameters

```openscad
outer_length = 46;          // mm
outer_width = 34;           // mm
height = 4;                 // mm
outer_lip_thickness = 1;    // mm
groove_width = 3;           // mm
inner_lip_thickness = 1;    // mm
floor_thickness = 1;        // mm
corner_radius = 8;          // mm
revision = "r08";
```

