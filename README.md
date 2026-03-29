# MPD-CLA: Logic Pro Channel Strip Presets

CLA Signature Series-inspired channel strip presets for Logic Pro, built entirely with stock Logic plugins.

## Overview

Five self-contained channel strip presets, each with 8 Smart Control macro knobs that mirror the CLA plugin workflow: **Sensitivity, Bass, Treble, Compress, Reverb, Delay, Pitch, Output**.

All processing runs as inserts (no bus sends), making each preset fully portable across sessions.

## Presets

| Preset | Target | Compressor | Key Character |
|--------|--------|------------|---------------|
| **MPD-CLA-VOX** | Lead/background vocals | FET 4:1 | DeEsser + Exciter + Plate verb |
| **MPD-CLA-BASS** | Electric/synth bass | Opto 3:1 | Pedalboard saturation for speaker translation |
| **MPD-CLA-DRUM** | Drum bus/percussion | FET 8:1 | Smash + Enveloper transient recovery |
| **MPD-CLA-GTR** | Electric guitar | VCA 3:1 | Exciter + Hall verb + dotted 1/8 delay |
| **MPD-CLA-UNPLG** | Acoustic instruments | Opto 2.5:1 | Space Designer IR + gentle Exciter air |

## Universal Macro Layout

All 5 presets share the same 8-knob Smart Control layout:

| Knob | Label | Controls |
|------|-------|----------|
| 1 | SENSITIVITY | Compressor Input Gain — drives compression harder |
| 2 | BASS | Channel EQ Low Shelf Gain |
| 3 | TREBLE | Channel EQ High Shelf Gain |
| 4 | COMPRESS | Compressor Mix (parallel blend 0–100%) |
| 5 | REVERB | Reverb plugin Mix |
| 6 | DELAY | Delay plugin Mix |
| 7 | PITCH | Pitch/Chorus/Ensemble plugin Mix |
| 8 | OUTPUT | Gain plugin Output (final trim) |

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

## Build Order

1. **MPD-CLA-VOX** — Most complex chain, sets template for all others
2. **MPD-CLA-DRUM** — Validates FET smash + transient recovery approach
3. **MPD-CLA-BASS** — Tests Opto + saturation strategy
4. **MPD-CLA-GTR** — Tests VCA + delay/verb balance
5. **MPD-CLA-UNPLG** — Lightest touch, validates gentle Opto approach

## Requirements

- Logic Pro 10.7+ (for ChromaVerb, DeEsser 2, Ensemble)
- All stock Logic plugins — no third-party dependencies
