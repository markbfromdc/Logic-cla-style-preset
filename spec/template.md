# Session Template Specification

**Version:** 3.0
**Last Updated:** 2026-04-05
**Applies to:** MPD-CLA Logic Pro Session Template

---

## Overview

The MPD-CLA template provides a pre-routed Logic Pro session with 8 busses and 4 FX sends, each loaded with dedicated channel strip presets. All presets are controlled via 8 Smart Control knobs mapped to a Behringer BCF2000.

---

## Routing Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                        AUDIO TRACKS                             │
│  (Load frequency-domain mixing presets: SUB/LO-MID/HI-MID/...) │
└───────┬──────┬──────┬──────┬──────┬──────┬──────────────────────┘
        │      │      │      │      │      │
        │      │      │      │      │      │    ┌──────────────┐
        ▼      ▼      ▼      ▼      ▼      ▼    │  4 FX SENDS  │
   ┌────────┬──────┬────────┬──────┬────────┬────┤              │
   │ DRUMS  │ BASS │GUITARS │ KEYS │VOCALS  │ FX │ 1.SHORT VERB │
   │ Bus 1  │Bus 2 │ Bus 3  │Bus 4 │ Bus 5  │Bus6│ 2.LONG VERB  │
   └───┬────┴──┬───┴───┬────┴──┬───┴───┬────┴─┬──┤ 3.SLAP DLY   │
       │       │       │       │       │      │  │ 4.LONG DLY   │
       └───────┴───────┴───────┴───────┴──────┘  └──────┬───────┘
                           │                             │
                           ▼                             │
                    ┌─────────────┐                      │
                    │   MIX BUS   │◄─────────────────────┘
                    │   Bus 7     │
                    └──────┬──────┘
                           │
                           ▼
                    ┌─────────────┐
                    │ MASTER BUS  │
                    │   Bus 8     │
                    └──────┬──────┘
                           │
                           ▼
                       OUTPUT 1-2
```

---

## 8 Busses

| Bus # | Name | Preset | Purpose |
|-------|------|--------|---------|
| 1 | DRUMS | MPD-BUS-DRUMS | Drum kit subgroup — kick, snare, toms, overheads, room |
| 2 | BASS | MPD-BUS-BASS | Bass subgroup — electric, synth, upright, sub |
| 3 | GUITARS | MPD-BUS-GUITARS | Guitar subgroup — electric, acoustic, nylon |
| 4 | KEYS | MPD-BUS-KEYS | Keys subgroup — piano, organ, synths, pads, EP |
| 5 | VOCALS | MPD-BUS-VOCALS | Vocal subgroup — lead, BG, harmonies, ad-libs |
| 6 | FX | MPD-BUS-FX | Effects subgroup — risers, impacts, SFX, foley |
| 7 | MIX | MPD-BUS-MIX | Mix bus — all instrument busses sum here |
| 8 | MASTER | MPD-MASTER-BUS | Master bus — final processing and limiting |

### Bus Routing Rules

- All audio tracks route to one of busses 1–6 based on instrument type
- Busses 1–6 all route to Bus 7 (MIX)
- Bus 7 (MIX) routes to Bus 8 (MASTER)
- Bus 8 (MASTER) routes to Output 1-2 (stereo out)
- FX send returns also route to Bus 7 (MIX)

---

## 4 FX Sends

| Send # | Name | Preset | Purpose |
|--------|------|--------|---------|
| 1 | SHORT VERB | MPD-FX-SHORT-VERB | Room/plate reverb, 0.2–1.5 s decay |
| 2 | LONG VERB | MPD-FX-LONG-VERB | Hall reverb, 1.5–6.0 s decay |
| 3 | SLAP DELAY | MPD-FX-SLAP-DLY | Slap-back delay, 40–150 ms |
| 4 | LONG DELAY | MPD-FX-LONG-DLY | Tempo-synced rhythmic delay |

### FX Send Routing Rules

- FX sends are available on all audio tracks and busses 1–6
- FX send returns route to Bus 7 (MIX)
- All FX send presets run at 100% wet (send/return paradigm)
- Send level on each track controls the amount of signal going to the FX

### Default Send Levels

All sends default to -∞ (off). Recommended starting points:

| Source | SHORT VERB | LONG VERB | SLAP DLY | LONG DLY |
|--------|-----------|-----------|----------|----------|
| Drums | -12 dB | Off | -18 dB | Off |
| Bass | Off | Off | Off | Off |
| Guitars | -10 dB | -14 dB | Off | -16 dB |
| Keys | -12 dB | -10 dB | Off | Off |
| Vocals | -8 dB | -12 dB | -14 dB | -12 dB |
| FX | Off | Off | Off | Off |

---

## Track Organization

### Recommended Track Layout

```
Track 1-4    : Drums (Kick, Snare, Toms, OH)  → Bus 1 (DRUMS)
Track 5-6    : Bass (DI, Amp)                  → Bus 2 (BASS)
Track 7-10   : Guitars (Elec L/R, Acoustic)    → Bus 3 (GUITARS)
Track 11-14  : Keys (Piano, Synth, Pad)        → Bus 4 (KEYS)
Track 15-18  : Vocals (Lead, BG, Harmonies)    → Bus 5 (VOCALS)
Track 19-20  : FX (Risers, Impacts)            → Bus 6 (FX)
```

### Track Preset Assignment

Individual tracks load **frequency-domain mixing presets** based on their content:

| Track Content | Primary Preset | When to Use |
|--------------|----------------|-------------|
| Kick drum | MPD-CLA-SUB | Fundamental below 80 Hz |
| Snare drum | MPD-CLA-HI-MID | Crack and body 500 Hz–2 kHz |
| Bass guitar | MPD-CLA-LO-MID | Harmonics and body 80–500 Hz |
| Lead vocal | MPD-CLA-HI-MID | Presence and clarity |
| Acoustic guitar | MPD-CLA-HIGH | Pick attack and clarity 2–8 kHz |
| Cymbal/overhead | MPD-CLA-AIR | Shimmer 8–20 kHz |

---

## Template Setup in Logic Pro

### Creating the Template

1. **Create a new empty project**
2. **Create 8 Aux channel strips** for busses:
   - Bus 1: DRUMS, Bus 2: BASS, Bus 3: GUITARS, Bus 4: KEYS, Bus 5: VOCALS, Bus 6: FX
   - Bus 7: MIX (set as output for busses 1–6)
   - Bus 8: MASTER (set as output for Bus 7, output to Stereo Out)
3. **Create 4 Aux channel strips** for FX sends:
   - Send 1: SHORT VERB, Send 2: LONG VERB, Send 3: SLAP DELAY, Send 4: LONG DELAY
   - Set output of all 4 to Bus 7 (MIX)
4. **Load presets** on each bus and FX send via Library (Patch format)
5. **Save as Template:** File > Save as Template

### Saving the Template

Logic Pro templates are saved to:
```
~/Music/Audio Music Apps/Project Templates/MPD-CLA Template.logicx
```

---

## Preset File Locations

```
~/Music/Audio Music Apps/
├── Channel Strip Settings/MPD-CLA/
│   ├── MPD-CLA-SUB.cst          ← Mixing presets
│   ├── MPD-CLA-LO-MID.cst
│   ├── MPD-CLA-HI-MID.cst
│   ├── MPD-CLA-HIGH.cst
│   ├── MPD-CLA-AIR.cst
│   ├── MPD-BUS-DRUMS.cst        ← Bus presets
│   ├── MPD-BUS-BASS.cst
│   ├── MPD-BUS-GUITARS.cst
│   ├── MPD-BUS-KEYS.cst
│   ├── MPD-BUS-VOCALS.cst
│   ├── MPD-BUS-FX.cst
│   ├── MPD-BUS-MIX.cst
│   ├── MPD-FX-SHORT-VERB.cst    ← FX send presets
│   ├── MPD-FX-LONG-VERB.cst
│   ├── MPD-FX-SLAP-DLY.cst
│   ├── MPD-FX-LONG-DLY.cst
│   ├── MPD-MASTER-BUS.cst       ← Mastering presets
│   ├── MPD-MASTER-SUB.cst
│   ├── MPD-MASTER-LO-MID.cst
│   ├── MPD-MASTER-HI-MID.cst
│   ├── MPD-MASTER-HIGH.cst
│   ├── MPD-MASTER-AIR.cst
│   ├── MPD-MASTER-STREAM.cst
│   └── MPD-MASTER-MULTI.cst
└── Patches/MPD-CLA/
    └── (same filenames with .patch extension)
```

---

## Traceability

| This Spec Section | Source Document |
|--------------------|----------------|
| Bus presets | [presets/bus/](../presets/bus/) |
| FX send presets | [presets/fx/](../presets/fx/) |
| Mastering presets | [presets/mastering/](../presets/mastering/) |
| Mixing presets | [presets/](../presets/) |
| BCF2000 mapping | [spec/bcf2000.md](bcf2000.md) |
| Build instructions | [BUILD-GUIDE.md](../BUILD-GUIDE.md) |
