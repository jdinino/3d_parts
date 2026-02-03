# Adding New Parts

Use this as your template and checklist when adding parts to this repository.

---

## Folder Structure

Create: `{category}/{brand}-{product}-{part}/`

Example: `appliances/whirlpool-refrigerator-pan-roller/`

---

## Required Files

| File | Description |
|------|-------------|
| `README.md` | Part documentation (see template below) |
| `{name}-FSD.md` | Specifications document |
| `{name}.stl` | 3D printable model(s) |
| `{name}.scad` | OpenSCAD source(s) |
| `render.html` | Interactive 3D viewer |

Use OEM part numbers for filenames when available (e.g., `W11578839.stl`).

---

## README.md Template

Copy and adapt this structure exactly:

```markdown
# {Brand} {Product} {Part Name}

<p align="center">
  <b>If this part saved you money, consider buying me a thank you!</b><br><br>
  <a href="https://paypal.me/tipscup"><img src="https://img.shields.io/badge/PayPal-Tip_Jar-00457C?style=for-the-badge&logo=paypal&logoColor=white" alt="PayPal Tip Jar"></a>
</p>

---

{One sentence description.}

<h2 align="center"><a href="https://github.com/jdinino/3d-parts/releases/download/{release-tag}/{file}.stl">Download the {Part}</a></h2>
<h3 align="center"><a href="{file}.stl">View 3D Model</a> | <a href="https://jdinino.github.io/3d-parts/{category}/{folder}/render.html">Interactive Viewer</a></h3>

<p align="center">
  <img src="https://img.shields.io/badge/Material-{MATERIAL}-brightgreen" alt="Material">
  <img src="https://img.shields.io/badge/Revision-{rXX}-blue" alt="Revision">
</p>

## Compatible Part Numbers

| Part Number | Type |
|-------------|------|
| **{PRIMARY}** | Current OEM |
| {ALTERNATE} | Alternate |

## Compatible {Product} Models

### {Brand1}
- Model numbers here

### {Brand2}
- Model numbers here

## Specifications

| Parameter | Value |
|-----------|-------|
| **{Dimension}** | {value} mm |

## Print Settings

### {Material Name}

| Setting | Value |
|---------|-------|
| Layer Height | {X} mm |
| Wall Count | {X} |
| Infill | 100% |
| Print Speed | {X} mm/s |
| Nozzle Temp | {X}°C |
| Bed Temp | {X}°C |
| Cooling | {X}% |
| Orientation | {description} |
| Supports | None required |

### Material Notes

| Material | Status | Notes |
|----------|--------|-------|
| {MATERIAL} | **Recommended** | {reason} |
| {OTHER} | Not recommended | {reason} |

## Files

| File | Description |
|------|-------------|
| `{name}.stl` | 3D printable model |
| `{name}.scad` | OpenSCAD parametric source |
| `{name}-FSD.md` | Functional Specification Document |
| `render.html` | Interactive 3D preview |

## Installation

1. Step one
2. Step two
3. Step three

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| **{rXX}** | **{YYYY}** | **{Current version notes}** |

## License

[CC BY 4.0](../../LICENSE)

## Contributing

Issues and improvements welcome. Please include:
- {Product} model number
- Photo of fitment
- Any dimensional adjustments needed

## Keywords

`{part1}` `{part2}` `{brand}` `{product}` `{keywords}` `3d print` `replacement part`

---

<p align="center">
  <img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fjdinino%2F3d-parts%2Ftree%2Fmain%2F{category}%2F{folder}&label=Views&countColor=%23263759" alt="Views" />
</p>
```

---

## FSD.md Template

```markdown
# {Part Name} Full Specifications Document

## Overview

{One sentence description of what this part does and where it's used.}

## {Part} Specifications

| Parameter | Value |
|-----------|-------|
| {Dimension1} | {value}mm |
| {Dimension2} | {value}mm |
| Material | {MATERIAL} |

### Cross Section
{ASCII diagram showing part geometry - see existing FSD files for examples}

## Material Requirements

| Material | Status | Reason |
|----------|--------|--------|
| {MATERIAL} | **Recommended** | {Why recommended} |
| {OTHER} | Not recommended | {Why not} |

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| {rXX} | {YYYY} | {Current version notes} |
| {rXX-1} | {YYYY} | {Previous changes} |
```

---

## render.html

Copy from an existing part (e.g., `whirlpool-refrigerator-pan-roller/render.html`) and modify:
- Title
- Part numbers
- Specifications values
- 3D geometry (Three.js scene)
- Brand compatibility list

---

## Update Category Index

Add row to `{category}/README.md`:

```markdown
| [Part Name](folder-name/) | Brand1, Brand2 | PartNum1, PartNum2 | Material | Tested |
```

---

## Create GitHub Release

Create a release for STL downloads (ensures proper file download instead of browser displaying text):

```bash
gh release create {release-tag} "{category}/{folder}/{file}.stl" --title "{Part Name} {rXX}" --notes "{Release notes}"
```

Example:
```bash
gh release create r10 "appliances/whirlpool-dishwasher-rinse-aid-gasket/gasket-r10.stl" --title "Rinse Aid Gasket r10" --notes "Groove width reduced from 3mm to 2mm"
```

Download URL format: `https://github.com/jdinino/3d-parts/releases/download/{release-tag}/{file}.stl`

---

## Checklist

Before committing, verify:

- [ ] Folder: `{category}/{brand}-{product}-{part}/`
- [ ] README.md matches template structure exactly
- [ ] FSD.md with specifications
- [ ] STL file(s)
- [ ] SCAD file(s)
- [ ] render.html
- [ ] Category README.md updated
- [ ] All filenames in README match actual files
- [ ] GitHub Release created with STL file(s)
- [ ] Download URLs point to GitHub Release assets
- [ ] Interactive Viewer URL uses GitHub Pages path
- [ ] Visitor badge URL is properly encoded
- [ ] License links to `../../LICENSE`

---

## Reference

Working example: `appliances/whirlpool-refrigerator-pan-roller/`
