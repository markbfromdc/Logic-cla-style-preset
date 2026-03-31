# CLA Signature Series → Logic Pro Channel Strip Presets

## Roadmap & Build Spec — Frequency-Domain Edition

---

## Architecture

Logic's **Smart Controls** are the macro system. Each channel strip preset gets 8 Smart Control knobs mapped across the insert chain. All processing runs as inserts (no bus sends) so the preset is fully self-contained and portable.

### Design Philosophy

Instead of instrument-based presets, these 5 presets are organized by **frequency domain**. Apply them to any source that has content in that band — regardless of whether it's a vocal, guitar, synth, or drum.

The dynamics section is fully shapeable via two dedicated knobs:
- **DYNAMICS** morphs compression character between Punch and Sustain
- **WIDTH** controls stereo image using Direction Mixer (mono-safe, no phase issues)

### Universal Macro Layout (all 5 presets)

| Knob | Label    | Target                                                           |
|------|----------|------------------------------------------------------------------|
| 1    | DRIVE    | Compressor Input Gain (drives GR harder)                         |
| 2    | BASS     | Channel EQ Low Shelf Gain                                        |
| 3    | TREBLE   | Channel EQ High Shelf Gain                                       |
| 4    | COMPRESS | Compressor Mix (parallel blend 0–100%)                           |
| 5    | DYNAMICS | Compressor Attack + Release morph (Punch ↔ Sustain)              |
| 6    | WIDTH    | Direction Mixer Spread (Narrow ↔ Wide, mono-safe)                |
| 7    | SPACE    | Reverb plugin Mix (0–max%)                                       |
| 8    | OUTPUT   | Gain plugin Output (trim after chain)                            |

### Smart Control Mapping Notes

- Smart Controls are configured in **Layout > Edit Mode** in Logic's Smart Controls pane
- Each knob maps to one or more plugin parameters via **Parameter Mapping**
- Set **Min/Max range** per mapping to constrain sweep
- Knob 4 (COMPRESS) uses Logic Compressor's built-in **Mix** knob for parallel blend
- Knob 5 (DYNAMICS) maps to **two parameters** simultaneously: Compressor Attack AND Release
- Knob 6 (WIDTH) maps to Direction Mixer **Spread** — uses mid-side processing for clean mono collapse
- Knob 8 (OUTPUT) uses a **Gain** plugin at the end of the chain for final trim

### DYNAMICS Knob (Punch ↔ Sustain)

| Position   | Attack        | Release       | Character                          |
|------------|---------------|---------------|------------------------------------|
| Full left  | Fastest       | Fastest       | **PUNCH** — transient snap, aggressive bite |
| Center     | Default       | Default       | Balanced — preset's home position  |
| Full right | Slowest       | Slowest       | **SUSTAIN** — smooth leveling, gentle hold |

### WIDTH Knob (Narrow ↔ Wide)

| Position   | Spread Value | Character                                    |
|------------|-------------|----------------------------------------------|
| Full left  | 0.0–0.5     | **NARROW** — collapsed toward mono center    |
| Center     | 1.0         | Unity stereo — no change to original image   |
| Full right | 1.5–2.0     | **WIDE** — expanded stereo, still mono-safe  |

Direction Mixer uses mid-side processing, ensuring no phase cancellation on mono fold-down.

---

## Preset 1: MPD-CLA-SUB (20–80 Hz)

**Target:** Sub-bass content — kick fundamentals, bass synths, 808s, sub drops

### Insert Chain

| Slot | Plugin             | Purpose                               |
|------|--------------------|---------------------------------------|
| 1    | Channel EQ         | Sub focus + cleanup above             |
| 2    | Compressor (Opto)  | Smooth sub dynamics                   |
| 3    | Pedalboard (Dist)  | Harmonic saturation for speaker translation |
| 4    | ChromaVerb (Room)  | Minimal low-end space                 |
| 5    | Direction Mixer    | Mono-safe stereo width                |
| 6    | Gain               | Output trim                           |

### Fixed Settings

**Channel EQ**
- HPF: Off (preserve all sub content)
- Low Shelf: 40 Hz, 0 dB (macro range: ±6 dB)
- Mid cut: 200 Hz, -2 dB, Q 1.5 (fixed — clear mud above sub range)
- High Shelf: 100 Hz, 0 dB (macro range: ±6 dB)
- LPF: 250 Hz, 12 dB/oct (fixed — focus on sub content)

**Compressor**
- Circuit: Opto (smooth, no transient snap needed for subs)
- Ratio: 4:1
- Attack: 30 ms default (DYNAMICS range: 1 ms → 80 ms)
- Release: 200 ms default (DYNAMICS range: 40 ms → 500 ms)
- Knee: 1.0
- Mix: 0% default (macro range: 0–100%)
- Input Gain: 0 dB default (macro range: 0 to +12 dB)

**Pedalboard**
- Pedal: Hi-Drive at very low gain
- Drive: 10% (fixed)
- Tone: 30% (very dark — just adding sub harmonics)
- Mix: 20% (fixed)

**ChromaVerb**
- Algorithm: Room
- Decay: 0.3 s (very short — sub reverb must be tight)
- Pre-delay: 5 ms
- High Cut: 200 Hz
- Low Cut: 20 Hz
- Mix: 0% default (macro range: 0–20%)

**Direction Mixer**
- Spread: 1.0 default (macro range: 0.0 → 1.5)

### Smart Control Ranges

| Knob     | Parameter Path(s)                                      | Min        | Max        |
|----------|--------------------------------------------------------|------------|------------|
| DRIVE    | Compressor > Input Gain                                | 0 dB       | +12 dB     |
| BASS     | Channel EQ > Low Shelf Gain                            | -6 dB      | +6 dB      |
| TREBLE   | Channel EQ > High Shelf Gain                           | -6 dB      | +6 dB      |
| COMPRESS | Compressor > Mix                                       | 0%         | 100%       |
| DYNAMICS | Compressor > Attack (1–80 ms) + Release (40–500 ms)    | Punch      | Sustain    |
| WIDTH    | Direction Mixer > Spread                               | 0.0 (mono) | 1.5 (wide) |
| SPACE    | ChromaVerb > Mix                                       | 0%         | 20%        |
| OUTPUT   | Gain > Gain                                            | -12 dB     | +6 dB      |

---

## Preset 2: MPD-CLA-LO-MID (80–500 Hz)

**Target:** Low-mid content — bass harmonics, guitar/piano body, vocal warmth, snare body, toms

### Insert Chain

| Slot | Plugin             | Purpose                          |
|------|--------------------|----------------------------------|
| 1    | Channel EQ         | Low-mid focus + cleanup          |
| 2    | Compressor (Opto)  | Smooth body dynamics             |
| 3    | Exciter            | Harmonic warmth                  |
| 4    | Tape Delay         | Subtle thickening                |
| 5    | ChromaVerb (Room)  | Small room warmth                |
| 6    | Direction Mixer    | Mono-safe stereo width           |
| 7    | Gain               | Output trim                      |

### Fixed Settings

**Channel EQ**
- HPF: 60 Hz, 18 dB/oct (clean sub rumble below range)
- Low Shelf: 100 Hz, 0 dB (macro range: ±6 dB)
- Mid boost: 250 Hz, +1 dB, Q 1.0 (fixed — body center)
- Mid cut: 600 Hz, -1.5 dB, Q 1.5 (fixed — honk removal)
- High Shelf: 500 Hz, 0 dB (macro range: ±6 dB)
- LPF: 2 kHz, 6 dB/oct (fixed — gentle rolloff above range)

**Compressor**
- Circuit: Opto
- Ratio: 3:1
- Attack: 15 ms default (DYNAMICS range: 0.5 ms → 60 ms)
- Release: 150 ms default (DYNAMICS range: 30 ms → 400 ms)
- Knee: 0.8
- Mix: 0% default (macro range: 0–100%)
- Input Gain: 0 dB default (macro range: 0 to +15 dB)

**Exciter**
- Frequency 1: 150 Hz, Amount 4%
- Frequency 2: 400 Hz, Amount 6%
- Mix: 20% (fixed)

**Tape Delay**
- Time: 80 ms
- Feedback: 8%
- High Cut: 1 kHz
- Low Cut: 80 Hz
- Mix: 10% (fixed — always slightly thickening)

**ChromaVerb**
- Algorithm: Room
- Decay: 0.5 s
- Pre-delay: 10 ms
- High Cut: 2 kHz
- Low Cut: 80 Hz
- Mix: 0% default (macro range: 0–30%)

**Direction Mixer**
- Spread: 1.0 default (macro range: 0.5 → 1.5)

### Smart Control Ranges

| Knob     | Parameter Path(s)                                      | Min          | Max          |
|----------|--------------------------------------------------------|--------------|--------------|
| DRIVE    | Compressor > Input Gain                                | 0 dB         | +15 dB       |
| BASS     | Channel EQ > Low Shelf Gain                            | -6 dB        | +6 dB        |
| TREBLE   | Channel EQ > High Shelf Gain                           | -6 dB        | +6 dB        |
| COMPRESS | Compressor > Mix                                       | 0%           | 100%         |
| DYNAMICS | Compressor > Attack (0.5–60 ms) + Release (30–400 ms)  | Punch        | Sustain      |
| WIDTH    | Direction Mixer > Spread                               | 0.5 (narrow) | 1.5 (wide)   |
| SPACE    | ChromaVerb > Mix                                       | 0%           | 30%          |
| OUTPUT   | Gain > Gain                                            | -12 dB       | +6 dB        |

---

## Preset 3: MPD-CLA-HI-MID (500 Hz–2 kHz)

**Target:** High-mid content — vocal presence, snare crack, guitar attack, piano midrange, horn body

### Insert Chain

| Slot | Plugin             | Purpose                          |
|------|--------------------|----------------------------------|
| 1    | Channel EQ         | Hi-mid focus + cleanup           |
| 2    | DeEsser 2          | Harshness control at 1–2 kHz     |
| 3    | Compressor (FET)   | Aggressive mid dynamics          |
| 4    | Exciter            | Midrange presence                |
| 5    | Tape Delay         | Slap thickening                  |
| 6    | ChromaVerb (Plate) | Mid-focused plate                |
| 7    | Direction Mixer    | Mono-safe stereo width           |
| 8    | Gain               | Output trim                      |

### Fixed Settings

**Channel EQ**
- HPF: 400 Hz, 12 dB/oct
- Low Shelf: 500 Hz, 0 dB (macro range: ±6 dB)
- Mid cut: 800 Hz, -1 dB, Q 2.0 (fixed — nasal reduction)
- Presence: 1.5 kHz, +1.5 dB, Q 1.0 (fixed — midrange center)
- High Shelf: 2 kHz, 0 dB (macro range: ±6 dB)
- LPF: 5 kHz, 6 dB/oct (fixed — rolloff above range)

**DeEsser 2**
- Frequency: 1.8 kHz
- Sensitivity: -25 dB
- Mode: Relative
- Always on, not macro'd

**Compressor**
- Circuit: FET (aggressive character suits midrange punch)
- Ratio: 4:1
- Attack: 5 ms default (DYNAMICS range: 0.2 ms → 40 ms)
- Release: 80 ms default (DYNAMICS range: 20 ms → 300 ms)
- Knee: 0.5
- Mix: 0% default (macro range: 0–100%)
- Input Gain: 0 dB default (macro range: 0 to +18 dB)

**Exciter**
- Frequency 1: 800 Hz, Amount 5%
- Frequency 2: 1.5 kHz, Amount 7%
- Harmonics: Odd + Even
- Mix: 25% (fixed)

**Tape Delay**
- Time: 100 ms (slap)
- Feedback: 12%
- High Cut: 3 kHz
- Low Cut: 400 Hz
- Flutter: 10%
- Mix: 12% (fixed)

**ChromaVerb**
- Algorithm: Plate
- Decay: 1.2 s
- Pre-delay: 30 ms
- High Cut: 4 kHz
- Low Cut: 400 Hz
- Width: 100%
- Mix: 0% default (macro range: 0–40%)

**Direction Mixer**
- Spread: 1.0 default (macro range: 0.5 → 2.0)

### Smart Control Ranges

| Knob     | Parameter Path(s)                                      | Min          | Max          |
|----------|--------------------------------------------------------|--------------|--------------|
| DRIVE    | Compressor > Input Gain                                | 0 dB         | +18 dB       |
| BASS     | Channel EQ > Low Shelf Gain                            | -6 dB        | +6 dB        |
| TREBLE   | Channel EQ > High Shelf Gain                           | -6 dB        | +6 dB        |
| COMPRESS | Compressor > Mix                                       | 0%           | 100%         |
| DYNAMICS | Compressor > Attack (0.2–40 ms) + Release (20–300 ms)  | Punch        | Sustain      |
| WIDTH    | Direction Mixer > Spread                               | 0.5 (narrow) | 2.0 (wide)   |
| SPACE    | ChromaVerb > Mix                                       | 0%           | 40%          |
| OUTPUT   | Gain > Gain                                            | -12 dB       | +6 dB        |

---

## Preset 4: MPD-CLA-HIGH (2–8 kHz)

**Target:** High-frequency content — vocal clarity, pick attack, cymbal body, string bite, synth edge

### Insert Chain

| Slot | Plugin             | Purpose                          |
|------|--------------------|----------------------------------|
| 1    | Channel EQ         | High focus + cleanup             |
| 2    | DeEsser 2          | Sibilance/harshness control      |
| 3    | Compressor (VCA)   | Precise high-freq dynamics       |
| 4    | Exciter            | Harmonic edge                    |
| 5    | Tape Delay         | Rhythmic clarity delay           |
| 6    | ChromaVerb (Hall)  | Spatial depth                    |
| 7    | Direction Mixer    | Mono-safe stereo width           |
| 8    | Gain               | Output trim                      |

### Fixed Settings

**Channel EQ**
- HPF: 1.5 kHz, 12 dB/oct
- Low Shelf: 2 kHz, 0 dB (macro range: ±6 dB)
- Mid cut: 3.5 kHz, -1 dB, Q 2.0 (fixed — harsh resonance taming)
- Presence: 5 kHz, +1 dB, Q 0.8 (fixed — clarity center)
- High Shelf: 8 kHz, 0 dB (macro range: ±6 dB)
- LPF: 12 kHz, 6 dB/oct (fixed — prevent air bleed)

**DeEsser 2**
- Frequency: 5.5 kHz
- Sensitivity: -28 dB
- Mode: Relative
- Always on

**Compressor**
- Circuit: VCA (precise, transparent for high-frequency detail)
- Ratio: 3:1
- Attack: 2 ms default (DYNAMICS range: 0.1 ms → 30 ms)
- Release: 60 ms default (DYNAMICS range: 15 ms → 250 ms)
- Knee: 0.5
- Mix: 0% default (macro range: 0–100%)
- Input Gain: 0 dB default (macro range: 0 to +15 dB)

**Exciter**
- Frequency 1: 3 kHz, Amount 6%
- Frequency 2: 6 kHz, Amount 8%
- Harmonics: Odd + Even
- Mix: 25% (fixed)

**Tape Delay**
- Time: Dotted 1/8 (sync to host)
- Feedback: 20%
- High Cut: 8 kHz
- Low Cut: 2 kHz
- Flutter: 12%
- Mix: 10% (fixed)

**ChromaVerb**
- Algorithm: Hall
- Decay: 1.5 s
- Pre-delay: 40 ms
- High Cut: 10 kHz
- Low Cut: 2 kHz
- Width: 100%
- Mix: 0% default (macro range: 0–45%)

**Direction Mixer**
- Spread: 1.0 default (macro range: 0.5 → 2.0)

### Smart Control Ranges

| Knob     | Parameter Path(s)                                      | Min          | Max          |
|----------|--------------------------------------------------------|--------------|--------------|
| DRIVE    | Compressor > Input Gain                                | 0 dB         | +15 dB       |
| BASS     | Channel EQ > Low Shelf Gain                            | -6 dB        | +6 dB        |
| TREBLE   | Channel EQ > High Shelf Gain                           | -6 dB        | +6 dB        |
| COMPRESS | Compressor > Mix                                       | 0%           | 100%         |
| DYNAMICS | Compressor > Attack (0.1–30 ms) + Release (15–250 ms)  | Punch        | Sustain      |
| WIDTH    | Direction Mixer > Spread                               | 0.5 (narrow) | 2.0 (wide)   |
| SPACE    | ChromaVerb > Mix                                       | 0%           | 45%          |
| OUTPUT   | Gain > Gain                                            | -12 dB       | +6 dB        |

---

## Preset 5: MPD-CLA-AIR (8–20 kHz)

**Target:** Air/ultra-high content — vocal breath, cymbal shimmer, acoustic sparkle, synth air, string harmonics

### Insert Chain

| Slot | Plugin             | Purpose                          |
|------|--------------------|----------------------------------|
| 1    | Channel EQ         | Air focus + cleanup              |
| 2    | DeEsser 2          | Ultra-high harshness control     |
| 3    | Compressor (VCA)   | Delicate air dynamics            |
| 4    | Exciter            | Shimmer/sparkle enhancement      |
| 5    | ChromaVerb (Plate) | Airy plate shimmer               |
| 6    | Direction Mixer    | Mono-safe stereo width           |
| 7    | Gain               | Output trim                      |

### Fixed Settings

**Channel EQ**
- HPF: 6 kHz, 12 dB/oct
- Low Shelf: 8 kHz, 0 dB (macro range: ±6 dB)
- Presence: 10 kHz, +1.5 dB, Q 0.7 (fixed — air center)
- High Shelf: 14 kHz, 0 dB (macro range: ±6 dB)
- No LPF (preserve all ultra-high content)

**DeEsser 2**
- Frequency: 10 kHz
- Sensitivity: -25 dB
- Mode: Relative
- Always on

**Compressor**
- Circuit: VCA (transparent, preserves delicate air detail)
- Ratio: 2:1
- Attack: 1 ms default (DYNAMICS range: 0.1 ms → 20 ms)
- Release: 40 ms default (DYNAMICS range: 10 ms → 200 ms)
- Knee: 0.8
- Mix: 0% default (macro range: 0–100%)
- Input Gain: 0 dB default (macro range: 0 to +10 dB)

**Exciter**
- Frequency 1: 8 kHz, Amount 5%
- Frequency 2: 14 kHz, Amount 8%
- Harmonics: Odd + Even
- Mix: 30% (fixed — shimmer is the point)

**ChromaVerb**
- Algorithm: Plate
- Decay: 2.0 s (long shimmer tail)
- Pre-delay: 50 ms
- High Cut: 18 kHz
- Low Cut: 6 kHz
- Width: 100%
- Mix: 0% default (macro range: 0–50%)

**Direction Mixer**
- Spread: 1.0 default (macro range: 0.5 → 2.0)

### Smart Control Ranges

| Knob     | Parameter Path(s)                                      | Min          | Max          |
|----------|--------------------------------------------------------|--------------|--------------|
| DRIVE    | Compressor > Input Gain                                | 0 dB         | +10 dB       |
| BASS     | Channel EQ > Low Shelf Gain                            | -6 dB        | +6 dB        |
| TREBLE   | Channel EQ > High Shelf Gain                           | -6 dB        | +6 dB        |
| COMPRESS | Compressor > Mix                                       | 0%           | 100%         |
| DYNAMICS | Compressor > Attack (0.1–20 ms) + Release (10–200 ms)  | Punch        | Sustain      |
| WIDTH    | Direction Mixer > Spread                               | 0.5 (narrow) | 2.0 (wide)   |
| SPACE    | ChromaVerb > Mix                                       | 0%           | 50%          |
| OUTPUT   | Gain > Gain                                            | -12 dB       | +6 dB        |

---

## Build Procedure (per preset)

### Phase 1: Chain Assembly

1. Create new Audio track
2. Load plugins in order per the insert chain table
3. Dial in all **fixed settings** exactly as specified
4. Set all macro-controlled parameters to their **default** (0 dB / 0%)
5. Verify signal flow — bypass each plugin one at a time, confirm no gain staging issues

### Phase 2: Smart Control Mapping

1. Open **Smart Controls** pane (B key)
2. Click **Inspector button** (i) to show parameter mapping
3. Switch to **Edit Mode** (click the Edit icon)
4. For each of the 8 knobs:
   - Click the knob in the layout
   - In the Parameter Mapping area, click **Add Mapping**
   - Navigate to the target plugin and parameter
   - Set **Min** and **Max** values per the ranges table
   - Label the knob (double-click the label text)
5. **For DYNAMICS knob (dual-parameter mapping):**
   - Click the DYNAMICS knob
   - Add first mapping: Compressor > Attack (set Min/Max per preset)
   - Click **Add Mapping** again to add second mapping
   - Add second mapping: Compressor > Release (set Min/Max per preset)
   - Both parameters now sweep together from a single knob
6. Exit Edit Mode

### Phase 3: Save as Channel Strip Preset

1. Click the **Setting** button at the top of the channel strip
2. Select **Save Channel Strip Setting As...**
3. Navigate to or create folder: `MPD-CLA/`
4. Name: `MPD-CLA-SUB`, `MPD-CLA-LO-MID`, etc.
5. Logic saves to: `~/Music/Audio Music Apps/Channel Strip Settings/`

### Phase 4: Smart Control Layout Save

Smart Controls are saved with the **Patch**, not the Channel Strip Setting:

1. After mapping all knobs, save as a **Patch**:
   - Library pane > Save Patch
   - Name: `MPD-CLA-SUB` etc.
   - Location: `~/Music/Audio Music Apps/Patches/`
2. Patches store: Channel Strip + Smart Controls + sends + output routing

**This is critical** — if you only save as Channel Strip Setting, the Smart Control mappings won't persist. Always save the full Patch.

---

## File Structure

```
~/Music/Audio Music Apps/
├── Channel Strip Settings/
│   └── MPD-CLA/
│       ├── MPD-CLA-SUB.cst
│       ├── MPD-CLA-LO-MID.cst
│       ├── MPD-CLA-HI-MID.cst
│       ├── MPD-CLA-HIGH.cst
│       └── MPD-CLA-AIR.cst
└── Patches/
    └── MPD-CLA/
        ├── MPD-CLA-SUB.patch
        ├── MPD-CLA-LO-MID.patch
        ├── MPD-CLA-HI-MID.patch
        ├── MPD-CLA-HIGH.patch
        └── MPD-CLA-AIR.patch
```

---

## Build Order (recommended)

| Phase | Preset          | Why First                                                |
|-------|-----------------|----------------------------------------------------------|
| 1     | MPD-CLA-HI-MID  | Most complex chain (8 inserts), mid is most critical     |
| 2     | MPD-CLA-HIGH    | Similar chain, validates VCA + DeEsser approach          |
| 3     | MPD-CLA-AIR     | Tests shimmer/Exciter-heavy approach                     |
| 4     | MPD-CLA-LO-MID  | Tests Opto + warmth in low range                         |
| 5     | MPD-CLA-SUB     | Simplest chain, validates sub-only processing            |

---

## Testing Checklist

For each preset, run through:

- [ ] All 8 knobs sweep full range without clipping
- [ ] DRIVE at max doesn't cause digital overs (check output meter)
- [ ] COMPRESS at 100% sounds usable (not destroyed)
- [ ] DYNAMICS full left (Punch) = audible transient snap
- [ ] DYNAMICS full right (Sustain) = smooth leveling, no snap
- [ ] WIDTH full left (Narrow) = mono-compatible center image
- [ ] WIDTH full right (Wide) = expanded stereo, no phase issues
- [ ] WIDTH mono fold-down test: sum to mono at max width, verify no cancellation
- [ ] SPACE at max doesn't wash out the source
- [ ] OUTPUT knob can compensate for loudness added by processing
- [ ] A/B bypass: processed version should be loudness-matched to dry
- [ ] Test with at least 3 different source recordings per preset
- [ ] Save both .cst AND .patch after final tweaks
