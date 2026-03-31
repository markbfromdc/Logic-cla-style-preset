# System Architecture Specification

**Version:** 2.0
**Last Updated:** 2026-03-31
**Applies to:** MPD-CLA-SUB, MPD-CLA-LO-MID, MPD-CLA-HI-MID, MPD-CLA-HIGH, MPD-CLA-AIR

---

## Design Philosophy

### Frequency-Domain Organization

Traditional CLA-style plugins organize by **instrument** (vocals, bass, drums, guitar, unplugged). This project reorganizes by **frequency domain** — each preset is optimized for a specific band of the audible spectrum, regardless of source instrument.

**Why frequency-domain?**

1. **Source-agnostic:** A synth pad at 200 Hz and a guitar body at 200 Hz need the same EQ focus, compression character, and room treatment. The instrument doesn't matter — the frequency content does.
2. **Stacking:** Multiple presets can be used across a mix without redundancy. A vocal gets HI-MID for body and AIR for breath, rather than one instrument preset trying to do both.
3. **Transparency:** Users understand exactly what the preset does — it shapes a frequency range, not a mysterious "vocal sound."
4. **Reusability:** Five presets cover every source in a mix, vs. needing specialized presets for every instrument variant.

### Frequency Band Allocation

```
20 Hz          80 Hz         500 Hz        2 kHz         8 kHz       20 kHz
  |──── SUB ────|── LO-MID ──|── HI-MID ──|──── HIGH ───|──── AIR ────|
  |  kick fund. | body/warmth | presence   | clarity     | shimmer    |
  |  808s, subs | bass harm.  | vocal body | pick attack | breath     |
  |  sub drops  | toms, piano | snare crack| consonants  | cymbal air |
```

Bands overlap slightly at boundaries. This is intentional — real-world audio content doesn't have hard frequency cutoffs. Each preset's HPF/LPF creates a gradual focus zone, not a brick wall.

---

## Component Architecture

### Insert Chain Topology

Every preset follows the same signal flow pattern:

```
Input Signal
    │
    ▼
┌──────────────┐
│  Channel EQ  │  ← BASS / TREBLE knobs (shelves), fixed HPF/LPF/mids
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  [DeEsser 2] │  ← Present in HI-MID, HIGH, AIR only (harshness control)
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  Compressor  │  ← DRIVE / COMPRESS / DYNAMICS knobs
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  Harmonics   │  ← Exciter or Pedalboard (fixed settings, always on)
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  [Tape Delay]│  ← Present in LO-MID, HI-MID, HIGH only (fixed mix)
└──────┬───────┘
       │
       ▼
┌──────────────┐
│   Reverb     │  ← SPACE knob (ChromaVerb or Space Designer)
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ Dir. Mixer   │  ← WIDTH knob (mono-safe stereo control)
└──────┬───────┘
       │
       ▼
┌──────────────┐
│     Gain     │  ← OUTPUT knob (final trim)
└──────┬───────┘
       │
       ▼
Output Signal
```

### Plugin Selection Matrix

| Component | SUB | LO-MID | HI-MID | HIGH | AIR | Rationale |
|-----------|-----|--------|--------|------|-----|-----------|
| EQ | Channel EQ | Channel EQ | Channel EQ | Channel EQ | Channel EQ | Universal — Logic's most flexible parametric EQ |
| DeEsser | -- | -- | DeEsser 2 | DeEsser 2 | DeEsser 2 | Only needed where harsh resonances/sibilance exist (>500 Hz) |
| Compressor | Opto 4:1 | Opto 3:1 | FET 4:1 | VCA 3:1 | VCA 2:1 | See [Compressor Circuit Selection](#compressor-circuit-selection) |
| Harmonics | Pedalboard | Exciter | Exciter | Exciter | Exciter | Pedalboard adds sub harmonics; Exciter adds upper presence |
| Delay | -- | Tape Delay | Tape Delay | Tape Delay | -- | Thickening in mid ranges; unnecessary in sub/air extremes |
| Reverb | ChromaVerb Room | ChromaVerb Room | ChromaVerb Plate | ChromaVerb Hall | ChromaVerb Plate | See [Reverb Algorithm Selection](#reverb-algorithm-selection) |
| Width | Direction Mixer | Direction Mixer | Direction Mixer | Direction Mixer | Direction Mixer | Universal — mid-side processing, mono-safe |
| Output | Gain | Gain | Gain | Gain | Gain | Universal — final level trim |

### Compressor Circuit Selection

| Circuit | Presets | Character | Why |
|---------|---------|-----------|-----|
| **Opto** | SUB, LO-MID | Smooth, program-dependent release, gentle | Low frequencies need leveling without transient disruption. Opto's natural program-dependent behavior avoids pumping on sustained bass content. |
| **FET** | HI-MID | Aggressive, colored, fast-capable | Midrange benefits from assertive compression character. FET circuit adds harmonic color that enhances presence. The DYNAMICS knob morphs this from snappy punch to smooth sustain. |
| **VCA** | HIGH, AIR | Precise, transparent, fast-capable | High frequencies need transparent dynamics control. VCA's clean character preserves delicate detail without adding unwanted coloration that would be obvious at high frequencies. |

### Reverb Algorithm Selection

| Algorithm | Presets | Decay | Why |
|-----------|---------|-------|-----|
| **Room** | SUB (0.3s), LO-MID (0.5s) | Short | Low-frequency reverb must be tight. Long tails cause mud. Room algorithm naturally decays fast with minimal low-end buildup. |
| **Plate** | HI-MID (1.2s), AIR (2.0s) | Medium-Long | Plate algorithms excel at midrange density (HI-MID) and high-frequency shimmer (AIR). The metallic character adds presence without boxiness. |
| **Hall** | HIGH (1.5s) | Medium | Hall provides spatial depth in the clarity range (2-8 kHz) without the density of a plate. Creates "space around the sound" rather than "sound in a room." |

---

## Smart Control Architecture

### 8-Knob Universal Layout

All 5 presets share an identical control surface:

```
    ┌─────────────────────────────────────────┐
    │         SMART CONTROLS LAYOUT           │
    │                                         │
    │  ┌───┐  ┌───┐  ┌───┐  ┌───┐           │
    │  │ 1 │  │ 2 │  │ 3 │  │ 4 │           │
    │  │DRV│  │BAS│  │TRB│  │CMP│           │
    │  └───┘  └───┘  └───┘  └───┘           │
    │                                         │
    │  ┌───┐  ┌───┐  ┌───┐  ┌───┐           │
    │  │ 5 │  │ 6 │  │ 7 │  │ 8 │           │
    │  │DYN│  │WDT│  │SPC│  │OUT│           │
    │  └───┘  └───┘  └───┘  └───┘           │
    │                                         │
    └─────────────────────────────────────────┘
```

### Control Groups

**Tone Section (Knobs 2–3):**
- BASS and TREBLE are always ±6 dB shelf adjustments
- These are relative to each preset's frequency focus — BASS for SUB is 40 Hz, BASS for AIR is 8 kHz

**Dynamics Section (Knobs 1, 4, 5):**
- DRIVE feeds signal into the compressor (input gain)
- COMPRESS controls wet/dry blend (parallel compression)
- DYNAMICS shapes the compression character (punch vs sustain)
- These three knobs interact — COMPRESS at 0% nullifies the other two

**Spatial Section (Knobs 6–7):**
- WIDTH controls stereo image (Direction Mixer)
- SPACE controls reverb amount

**Output (Knob 8):**
- Final level trim to compensate for all processing

### Dual-Parameter Mapping (DYNAMICS Knob)

The DYNAMICS knob is the only control that maps to two plugin parameters simultaneously. Logic's Smart Controls support multiple mappings per knob via the Parameter Mapping panel. Both Attack and Release are mapped to the same knob with coordinated Min/Max values:

```
Knob Position:    LEFT ──────────── CENTER ──────────── RIGHT
Attack:           Fastest ────────── Default ────────── Slowest
Release:          Fastest ────────── Default ────────── Slowest
Character:        PUNCH                                 SUSTAIN
```

This creates a single-knob "compression character" control that's more intuitive than separate attack/release knobs.

---

## Technology Stack

| Component | Requirement | Notes |
|-----------|-------------|-------|
| DAW | Logic Pro 10.7+ | Required for ChromaVerb, DeEsser 2, Direction Mixer |
| Plugins | Stock Logic only | No third-party dependencies |
| OS | macOS 11+ | Logic Pro 10.7 minimum OS requirement |
| Save Format | .cst + .patch | Both required; .patch preserves Smart Controls |
| Installation | `~/Music/Audio Music Apps/` | Standard Logic preset directory |

---

## Traceability

| This Spec Section | Source Document |
|--------------------|----------------|
| Frequency band allocation | [CLA-Logic-Channel-Strip-Roadmap.md](../CLA-Logic-Channel-Strip-Roadmap.md) — Preset headers |
| Insert chain topology | [presets/](../presets/) — Insert Chain tables |
| Smart Control layout | [CLA-Logic-Channel-Strip-Roadmap.md](../CLA-Logic-Channel-Strip-Roadmap.md) — Universal Macro Layout |
| Build procedure | [BUILD-GUIDE.md](../BUILD-GUIDE.md) |
| Testing requirements | [TESTING-CHECKLIST.md](../TESTING-CHECKLIST.md) |
