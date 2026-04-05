# System Architecture Specification

**Version:** 3.0
**Last Updated:** 2026-04-05
**Applies to:** All MPD-CLA presets (mixing, bus, FX send, mastering — 25 total)

---

## Design Philosophy

### Frequency-Domain Organization

Traditional CLA-style plugins organize by **instrument** (vocals, bass, drums, guitar, unplugged). This project reorganizes by **frequency domain** — each preset is optimized for a specific band of the audible spectrum, regardless of source instrument.

**Why frequency-domain?**

1. **Source-agnostic:** A synth pad at 200 Hz and a guitar body at 200 Hz need the same EQ focus, compression character, and room treatment. The instrument doesn't matter — the frequency content does.
2. **Stacking:** Multiple presets can be used across a mix without redundancy. A vocal gets HI-MID for body and AIR for breath, rather than one instrument preset trying to do both.
3. **Transparency:** Users understand exactly what the preset does — it shapes a frequency range, not a mysterious "vocal sound."
4. **Reusability:** Five mixing presets cover every source in a mix, extended by bus, FX send, and mastering presets for full signal-chain coverage.

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

Every mixing preset follows the same signal flow pattern:

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
│  Enveloper   │  ← Transient shaping (expansion feel before compression)
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  Compressor  │  ← DRIVE / DYNAMICS knobs
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

### Enveloper Rationale

The Enveloper is placed **after** the DeEsser and **before** the Compressor to provide transient shaping that creates an expansion feel prior to compression. Key settings:

- **Attack Gain:** +6 dB — boosts transient peaks so the compressor has more dynamic material to work with
- **Purpose:** By emphasizing transients before they hit the compressor, the chain achieves a punchier, more open sound even at higher compression settings. This replaces the need for a dual-parameter DYNAMICS mapping — the Enveloper handles the "expansion" end of the spectrum mechanically rather than through knob trickery.

### Plugin Selection Matrix

| Component | SUB | LO-MID | HI-MID | HIGH | AIR | Rationale |
|-----------|-----|--------|--------|------|-----|-----------|
| EQ | Channel EQ | Channel EQ | Channel EQ | Channel EQ | Channel EQ | Universal — Logic's most flexible parametric EQ |
| DeEsser | -- | -- | DeEsser 2 | DeEsser 2 | DeEsser 2 | Only needed where harsh resonances/sibilance exist (>500 Hz) |
| Enveloper | Enveloper | Enveloper | Enveloper | Enveloper | Enveloper | All mixing presets — transient shaping for expansion feel |
| Compressor | Opto 4:1 | Opto 3:1 | FET 4:1 | VCA 3:1 | VCA 2:1 | See [Compressor Circuit Selection](#compressor-circuit-selection) |
| Harmonics | Pedalboard | Exciter | Exciter | Exciter | Exciter | Pedalboard adds sub harmonics; Exciter adds upper presence |
| Delay | -- | Tape Delay | Tape Delay | Tape Delay | -- | Thickening in mid ranges; unnecessary in sub/air extremes |
| Reverb | ChromaVerb Room | ChromaVerb Room | ChromaVerb Plate | ChromaVerb Hall | ChromaVerb Plate | See [Reverb Algorithm Selection](#reverb-algorithm-selection) |
| Width | Direction Mixer | Direction Mixer | Direction Mixer | Direction Mixer | Direction Mixer | Universal — mid-side processing, mono-safe |
| Output | Gain | Gain | Gain | Gain | Gain | Universal — final level trim |

**Bus presets** use the same plugin matrix as mixing presets with the following exceptions:

| Bus Type | Enveloper | Notes |
|----------|-----------|-------|
| Drum Bus | Yes | Transient emphasis before glue compression |
| Vocal Bus | Yes | Preserves articulation through bus compression |
| Instrument Bus | Yes | Maintains dynamics across summed sources |
| Mix Bus | Yes | Gentle transient restoration at mix stage |
| FX Bus | **No** | FX returns should not reshape transients |

### Compressor Circuit Selection

| Circuit | Presets | Character | Why |
|---------|---------|-----------|-----|
| **Opto** | SUB, LO-MID | Smooth, program-dependent release, gentle | Low frequencies need leveling without transient disruption. Opto's natural program-dependent behavior avoids pumping on sustained bass content. |
| **FET** | HI-MID | Aggressive, colored, fast-capable | Midrange benefits from assertive compression character. FET circuit adds harmonic color that enhances presence. |
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

All presets share an identical control surface:

```
    ┌─────────────────────────────────────────┐
    │         SMART CONTROLS LAYOUT           │
    │                                         │
    │  ┌───┐  ┌───┐  ┌───┐  ┌───┐           │
    │  │ 1 │  │ 2 │  │ 3 │  │ 4 │           │
    │  │DRV│  │BAS│  │TRB│  │DYN│           │
    │  └───┘  └───┘  └───┘  └───┘           │
    │                                         │
    │  ┌───┐  ┌───┐  ┌───┐  ┌───┐           │
    │  │ 5 │  │ 6 │  │ 7 │  │ 8 │           │
    │  │CLR│  │WDT│  │SPC│  │OUT│           │
    │  └───┘  └───┘  └───┘  └───┘           │
    │                                         │
    └─────────────────────────────────────────┘
```

**Knob assignments:**

| Knob | Label | Full Name | Target |
|------|-------|-----------|--------|
| 1 | DRV | DRIVE | Compressor > Input Gain |
| 2 | BAS | BASS | Channel EQ > Low Shelf |
| 3 | TRB | TREBLE | Channel EQ > High Shelf |
| 4 | DYN | DYNAMICS | Compressor > Mix |
| 5 | CLR | COLOR | Exciter > Mix (or Pedalboard > Mix for SUB) |
| 6 | WDT | WIDTH | Direction Mixer > Spread |
| 7 | SPC | SPACE | Reverb > Mix |
| 8 | OUT | OUTPUT | Gain > Level |

### Control Groups

**Tone (Knobs 2-3):**
- BASS and TREBLE are always +/-6 dB shelf adjustments
- These are relative to each preset's frequency focus — BASS for SUB is 40 Hz, BASS for AIR is 8 kHz

**Dynamics (Knobs 1, 4):**
- DRIVE feeds signal into the compressor (input gain)
- DYNAMICS controls Compressor > Mix as a single parameter: 0% = expanded (fully dry, no compression), 100% = compressed (fully wet, maximum compression effect)
- The Enveloper's fixed +6 dB attack gain ensures transients remain prominent even at high DYNAMICS settings

**Character (Knob 5):**
- COLOR controls Exciter > Mix for all presets except SUB, which uses Pedalboard > Mix
- Blends harmonic saturation into the signal

**Spatial (Knobs 6-7):**
- WIDTH controls stereo image (Direction Mixer)
- SPACE controls reverb amount

**Output (Knob 8):**
- Final level trim to compensate for all processing

### Interaction Matrix

| Interaction | Behavior |
|-------------|----------|
| DRIVE + DYNAMICS | DRIVE pushes more signal into the compressor; DYNAMICS controls how much compressed signal is blended back. High DRIVE + low DYNAMICS = driven tone with preserved transients. |
| DYNAMICS (0%) | No compression blended in — signal passes through compressor chain but only dry signal is heard. Enveloper transient shaping still active on the dry path. |
| DYNAMICS (100%) | Full parallel compression — compressor output fully blended with input. Maximum density and sustain. |
| BASS + TREBLE | Additive — both can be boosted simultaneously. EQ is pre-compressor, so tonal changes affect compression behavior. |
| COLOR + DRIVE | COLOR adds harmonics post-compression; DRIVE adds harmonics via gain staging into compression. Both contribute to saturation but at different points in the chain. |
| WIDTH + SPACE | Independent — WIDTH affects direct signal stereo image; SPACE adds reverb. Both contribute to perceived width but through different mechanisms. |

---

## Bus Preset Architecture

Bus presets extend the mixing preset topology for group/summing applications. Each frequency band has a corresponding bus variant (e.g., MPD-CLA-BUS-SUB, MPD-CLA-BUS-LO-MID, etc.).

Key differences from mixing presets:
- **Gentler compression ratios** — bus compression glues rather than shapes individual transients
- **Shorter reverb tails** — summed sources already carry spatial information
- **Enveloper present on all bus types except FX Bus** — preserves transient clarity through group compression

Refer to individual preset files in `presets/bus/` for per-band settings.

---

## FX Send Architecture

FX send presets provide dedicated effect returns (e.g., MPD-CLA-FX-VERB, MPD-CLA-FX-DLY). These use a simplified insert chain:

- No Enveloper (FX returns should not reshape transients)
- No compressor in most configurations (effect signal is already shaped)
- Reverb or Delay as primary processor, with EQ for tonal shaping of the wet signal

Refer to individual preset files in `presets/fx/` for complete configurations.

---

## Mastering Architecture

Mastering presets (e.g., MPD-CLA-MASTER) operate on the full frequency spectrum rather than individual bands. The insert chain follows the same general topology but with:

- **Full-range Channel EQ** — no band-specific HPF/LPF focus
- **Broadband Enveloper** — subtle transient restoration (+3 dB attack gain, gentler than mixing presets)
- **Gentle compression** — low ratios (1.5:1 to 2:1), slow attack, program-dependent release
- **Linear-phase considerations** — plugin order chosen to minimize phase artifacts at the mastering stage

Refer to individual preset files in `presets/mastering/` for complete configurations.

---

## Technology Stack

| Component | Requirement | Notes |
|-----------|-------------|-------|
| DAW | Logic Pro 10.7+ | Required for ChromaVerb, DeEsser 2, Direction Mixer, Enveloper |
| Plugins | Stock Logic only | No third-party dependencies |
| OS | macOS 11+ | Logic Pro 10.7 minimum OS requirement |
| Hardware Controller | BCF2000 (optional) | 8 motorized faders map 1:1 to Smart Control knobs |
| Save Format | .cst + .patch | Both required; .patch preserves Smart Controls |
| Installation | `~/Music/Audio Music Apps/` | Standard Logic preset directory |

---

## Traceability

| This Spec Section | Source Document |
|--------------------|----------------|
| Frequency band allocation | [CLA-Logic-Channel-Strip-Roadmap.md](../CLA-Logic-Channel-Strip-Roadmap.md) — Preset headers |
| Insert chain topology | [presets/](../presets/) — Insert Chain tables |
| Smart Control layout | [CLA-Logic-Channel-Strip-Roadmap.md](../CLA-Logic-Channel-Strip-Roadmap.md) — Universal Macro Layout |
| Bus preset details | [presets/bus/](../presets/bus/) — Bus preset files |
| FX send preset details | [presets/fx/](../presets/fx/) — FX send preset files |
| Mastering preset details | [presets/mastering/](../presets/mastering/) — Mastering preset files |
| Build procedure | [BUILD-GUIDE.md](../BUILD-GUIDE.md) |
| Testing requirements | [TESTING-CHECKLIST.md](../TESTING-CHECKLIST.md) |
