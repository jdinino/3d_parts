# Pan Roller Full Specifications Document

## Overview

Two-piece assembly: wheel and snap-fit axle for refrigerator drawer support.

## Wheel Specifications (W11578839)

| Parameter | Value |
|-----------|-------|
| Outer Diameter | 31mm |
| Height | 8mm |
| Center Hole | 9mm |
| Material | PETG or PLA |

### Cross Section
```
    ←────── 31mm ──────→
    ┌─────────────────────┐
    │                     │  8mm
    │    ●───────────●    │
    │    ←── 9mm ───→     │
    └─────────────────────┘
```

## Axle Specifications (W11573594)

| Parameter | Value |
|-----------|-------|
| Total Height | 20mm |
| Shoulder Diameter | 10mm |
| Shoulder Height | 2mm |
| Shaft Diameter | 8mm |
| Shaft Height | 8mm |
| Legs | 3 at 120° |
| Leg Length | 10mm |
| Leg Width | 3mm |
| Leg Thickness | 1.5mm |
| Material | TPU |

### Cross Section
```
         ◢═══◣
        ╱     ╲         ← Wedge clips
       │       │
       │       │        ← 3 legs (10mm)
       │       │
    ═══╧═══════╧═══     ← Shoulder (10mm × 2mm)
       │       │
       │       │        ← Shaft (8mm × 8mm)
       │       │
       └───────┘
```

### Leg Detail
- 3 legs spaced 120° apart
- Center rib reinforcement on each leg
- Fillet at base for stress relief
- Solid wedge catch at tip

## Assembly Diagram
```
        ◢═══◣
       │     │          ← Clips snap above wheel
    ┌──┼─────┼──┐
    │  │     │  │       ← WHEEL
    └──┼─────┼──┘
    ═══╧═════╧═══       ← Shoulder stops here
       │     │
       └─────┘          ← Into fridge mount
```

## Material Requirements

| Part | Material | Reason |
|------|----------|--------|
| Wheel | PETG/PLA | Rigid, wear-resistant |
| Axle | TPU | Flexible legs for snap-fit |

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| r17 | 2026-02-02 | Final - 3 legs with rib reinforcement, solid wedge, TPU material |
| r01-r16 | 2026-02-01 | Development iterations |
