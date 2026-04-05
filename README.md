# MPD-CLA: Logic Pro Channel Strip Presets

CLA Signature Series-inspired channel strip presets for Logic Pro, built entirely with stock Logic plugins. 25 presets across mixing, bus, FX send, and mastering categories — all controlled by BCF2000 8 encoders.

## Overview

25 self-contained channel strip presets organized into four categories, each with 8 Smart Control macro knobs mapped to a Behringer BCF2000 controller. Single-parameter-per-knob design: every encoder controls exactly one function.

| Category | Count | Purpose |
|----------|-------|---------|
| Mixing | 5 | Individual track processing by frequency band |
| Bus | 7 | Subgroup bus processing |
| FX Send | 4 | Auxiliary effect sends |
| Mastering | 8 | Master bus and multiband processing |

## Universal Macro Layout

All 25 presets share the same 8-knob Smart Control layout:

| Knob | Label | Controls |
|------|-------|----------|
| 1 | DRIVE | Compressor Input Gain — drives compression harder |
| 2 | BASS | EQ Low Shelf ±6dB |
| 3 | TREBLE | EQ High Shelf ±6dB |
| 4 | DYNAMICS | Compressor Mix 0–100% (expanded ↔ compressed) |
| 5 | COLOR | Exciter/Pedalboard Mix |
| 6 | WIDTH | Direction Mixer Spread (Narrow ↔ Wide, mono-safe) |
| 7 | SPACE | Reverb Mix |
| 8 | OUTPUT | Gain trim (final output level) |

### DYNAMICS

Single parameter controlling the compressor's parallel blend. 0% = expanded (Enveloper transient boost, no compression). 100% = fully compressed. One knob, one function — no dual-mapping.

### WIDTH

Uses Logic's Direction Mixer with mid-side processing. Guarantees clean mono fold-down with no phase cancellation. Full left = narrow/mono. Full right = wide stereo.

## Mixing Presets

| Preset | Frequency Range | Compressor | Key Character |
|--------|----------------|------------|---------------|
| **MPD-CLA-SUB** | 20–80 Hz | Opto 4:1 | Pedalboard saturation for speaker translation |
| **MPD-CLA-LO-MID** | 80–500 Hz | Opto 3:1 | Exciter warmth + tape thickening |
| **MPD-CLA-HI-MID** | 500 Hz–2 kHz | FET 4:1 | DeEsser + Exciter midrange presence |
| **MPD-CLA-HIGH** | 2–8 kHz | VCA 3:1 | DeEsser + Exciter edge + Hall verb |
| **MPD-CLA-AIR** | 8–20 kHz | VCA 2:1 | Exciter shimmer + Plate verb tail |

## Bus Presets

| Preset | Target Bus | Key Character |
|--------|-----------|---------------|
| **MPD-CLA-BUS-DRUMS** | Drums | Transient punch + room glue |
| **MPD-CLA-BUS-BASS** | Bass | Low-end tightening + warmth |
| **MPD-CLA-BUS-GUITARS** | Guitars | Mid-forward presence + width |
| **MPD-CLA-BUS-KEYS** | Keys | Gentle compression + stereo spread |
| **MPD-CLA-BUS-VOCALS** | Vocals | De-essing + parallel compression |
| **MPD-CLA-BUS-FX** | FX | Effect bus shaping + level control |
| **MPD-CLA-BUS-MIX** | Mix | Mix bus glue + final polish |

## FX Send Presets

| Preset | Effect Type | Key Character |
|--------|------------|---------------|
| **MPD-CLA-FX-SHORT-VERB** | Short Reverb | Tight room / ambience |
| **MPD-CLA-FX-LONG-VERB** | Long Reverb | Hall / plate tail |
| **MPD-CLA-FX-SLAP-DLY** | Slap Delay | Short slapback echo |
| **MPD-CLA-FX-LONG-DLY** | Long Delay | Tempo-synced delay throws |

## Mastering Presets

| Preset | Target | Key Character |
|--------|--------|---------------|
| **MPD-CLA-MASTER-BUS** | Full mix bus | Stereo bus glue + limiting |
| **MPD-CLA-MASTER-SUB** | Sub band | Sub-bass control + saturation |
| **MPD-CLA-MASTER-LO-MID** | Low-mid band | Low-mid clarity + warmth |
| **MPD-CLA-MASTER-HI-MID** | High-mid band | Presence + de-harshening |
| **MPD-CLA-MASTER-HIGH** | High band | Top-end air + de-essing |
| **MPD-CLA-MASTER-AIR** | Air band | Ultra-high shimmer + limiting |
| **MPD-CLA-MASTER-STREAM** | Streaming master | Loudness-normalized output |
| **MPD-CLA-MASTER-MULTI** | Multiband master | Full multiband processing chain |

## File Structure

Presets install to Logic's standard locations:

```
~/Music/Audio Music Apps/
├── Channel Strip Settings/MPD-CLA/    ← .cst files
└── Patches/MPD-CLA/                   ← .patch files (includes Smart Controls)
```

Repository layout:

```
presets/
├── mixing/          ← Frequency-band mixing presets
├── bus/             ← Bus subgroup presets
├── fx/              ← FX send presets
└── mastering/       ← Mastering chain presets
spec/
├── architecture.md
├── bcf2000.md       ← BCF2000 encoder mapping + SysEx config
├── template.md      ← Preset template structure
└── ...
```

**Important:** Always save as both Channel Strip Setting AND Patch. Smart Control mappings only persist in the Patch format.

## BCF2000 Controller

All 25 presets are mapped to 8 encoders on the Behringer BCF2000. See [spec/bcf2000.md](spec/bcf2000.md) for encoder assignments, SysEx configuration, and MIDI CC mapping.

## Preset Template

New presets follow a standardized template structure. See [spec/template.md](spec/template.md) for the base plugin chain, default parameter values, and Smart Control mapping conventions.

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
| [spec/smart-controls.md](spec/smart-controls.md) | Parameter mapping, single-knob DYNAMICS, WIDTH behavior |
| [spec/plugin-settings-rationale.md](spec/plugin-settings-rationale.md) | Audio engineering decisions for every plugin setting |
| [spec/testing-protocols.md](spec/testing-protocols.md) | Unit tests, integration tests, mono compatibility, performance benchmarks |
| [spec/compatibility.md](spec/compatibility.md) | Logic Pro version requirements, installation, troubleshooting |
| [spec/version-history.md](spec/version-history.md) | Change log and version traceability |
| [spec/test-data.md](spec/test-data.md) | MUSDB stems dataset reference, stem-to-preset mapping |
| [spec/template.md](spec/template.md) | Preset template structure, base plugin chain, default values |
| [spec/bcf2000.md](spec/bcf2000.md) | BCF2000 encoder mapping, SysEx config, MIDI CC assignments |

## Test Data

Primary test material: [`danjacobellis/MUSDB_stems_stable_audio_fp16`](https://huggingface.co/datasets/danjacobellis/MUSDB_stems_stable_audio_fp16) — 150 full-length tracks with isolated stems (drums, bass, vocals, other) from the MUSDB18 music source separation corpus. Each stem maps directly to frequency-domain presets for systematic testing. See [spec/test-data.md](spec/test-data.md) for details.

## Requirements

- Logic Pro 10.7+ (for ChromaVerb, DeEsser 2, Direction Mixer)
- All stock Logic plugins — no third-party dependencies
