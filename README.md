# MPD-CLA: Logic Pro Channel Strip Presets

CLA Signature Series-inspired channel strip presets for Logic Pro, built entirely with stock Logic plugins. Organized by **frequency domain** — apply to any source with content in that band.

## Overview

Five self-contained channel strip presets, each with 8 Smart Control macro knobs. The dynamics section is fully shapeable: **DYNAMICS** morphs between punch and sustain, while **WIDTH** controls mono-safe stereo image via Direction Mixer.

## Presets

| Preset | Frequency Range | Compressor | Key Character |
|--------|----------------|------------|---------------|
| **MPD-CLA-SUB** | 20–80 Hz | Opto 4:1 | Pedalboard saturation for speaker translation |
| **MPD-CLA-LO-MID** | 80–500 Hz | Opto 3:1 | Exciter warmth + tape thickening |
| **MPD-CLA-HI-MID** | 500 Hz–2 kHz | FET 4:1 | DeEsser + Exciter midrange presence |
| **MPD-CLA-HIGH** | 2–8 kHz | VCA 3:1 | DeEsser + Exciter edge + Hall verb |
| **MPD-CLA-AIR** | 8–20 kHz | VCA 2:1 | Exciter shimmer + Plate verb tail |

## Universal Macro Layout

All 5 presets share the same 8-knob Smart Control layout:

| Knob | Label | Controls |
|------|-------|----------|
| 1 | DRIVE | Compressor Input Gain — drives compression harder |
| 2 | BASS | Channel EQ Low Shelf Gain |
| 3 | TREBLE | Channel EQ High Shelf Gain |
| 4 | COMPRESS | Compressor Mix (parallel blend 0–100%) |
| 5 | DYNAMICS | Compressor Attack + Release morph (Punch ↔ Sustain) |
| 6 | WIDTH | Direction Mixer Spread (Narrow ↔ Wide, mono-safe) |
| 7 | SPACE | Reverb plugin Mix |
| 8 | OUTPUT | Gain plugin Output (final trim) |

### Dynamics & Width

- **DYNAMICS** maps to two compressor parameters simultaneously (Attack + Release). Full left = Punch (fast attack/release, transient snap). Full right = Sustain (slow attack/release, smooth leveling).
- **WIDTH** uses Logic's Direction Mixer with mid-side processing. Guarantees clean mono fold-down with no phase cancellation. Full left = narrow/mono. Full right = wide stereo.

## File Structure

Presets install to Logic's standard locations:

```
~/Music/Audio Music Apps/
├── Channel Strip Settings/MPD-CLA/    ← .cst files
└── Patches/MPD-CLA/                   ← .patch files (includes Smart Controls)
```

**Important:** Always save as both Channel Strip Setting AND Patch. Smart Control mappings only persist in the Patch format.

## Documentation

| File | Description |
|------|-------------|
| [CLA-Logic-Channel-Strip-Roadmap.md](CLA-Logic-Channel-Strip-Roadmap.md) | Full build spec with all plugin settings |
| [presets/](presets/) | Individual preset specification sheets |
| [BUILD-GUIDE.md](BUILD-GUIDE.md) | Step-by-step Logic Pro build instructions |
| [TESTING-CHECKLIST.md](TESTING-CHECKLIST.md) | QA checklist for each preset |
| [spec/](spec/) | Technical specifications (see below) |

### Technical Specifications

| Spec | Description |
|------|-------------|
| [spec/architecture.md](spec/architecture.md) | System architecture, frequency-band design, plugin selection rationale |
| [spec/signal-flow.md](spec/signal-flow.md) | Signal flow diagrams, gain staging, level budgets per preset |
| [spec/smart-controls.md](spec/smart-controls.md) | Parameter mapping math, dual-parameter DYNAMICS, WIDTH behavior |
| [spec/plugin-settings-rationale.md](spec/plugin-settings-rationale.md) | Audio engineering decisions for every plugin setting |
| [spec/testing-protocols.md](spec/testing-protocols.md) | Unit tests, integration tests, mono compatibility, performance benchmarks |
| [spec/compatibility.md](spec/compatibility.md) | Logic Pro version requirements, installation, troubleshooting |
| [spec/version-history.md](spec/version-history.md) | Change log and version traceability |

## Build Order

1. **MPD-CLA-HI-MID** — Most complex chain, mid is most critical to get right
2. **MPD-CLA-HIGH** — Validates VCA + DeEsser approach
3. **MPD-CLA-AIR** — Tests shimmer/Exciter-heavy approach
4. **MPD-CLA-LO-MID** — Tests Opto + warmth in low range
5. **MPD-CLA-SUB** — Simplest chain, validates sub-only processing

## Requirements

- Logic Pro 10.7+ (for ChromaVerb, DeEsser 2, Direction Mixer)
- All stock Logic plugins — no third-party dependencies
