# CLA Signature Series → Logic Pro Channel Strip Presets

## Roadmap & Build Spec v3.0 — Frequency-Domain Edition

---

## Architecture

Logic's **Smart Controls** are the macro system. Each channel strip preset gets 8 Smart Control knobs mapped across the insert chain. All processing runs as inserts (no bus sends) so the preset is fully self-contained and portable.

### Design Philosophy

Instead of instrument-based presets, these 5 presets are organized by **frequency domain**. Apply them to any source that has content in that band — regardless of whether it's a vocal, guitar, synth, or drum.

Every knob controls exactly one parameter — no dual-mapped knobs, no hidden interactions. The two key creative controls:
- **DYNAMICS** blends between expanded (Enveloper transient boost) and compressed (Compressor) using Compressor Mix
- **COLOR** dials in harmonic saturation via Exciter Mix (or Pedalboard Mix on SUB)

### Universal Macro Layout (all 5 presets)

| Knob | Label    | Target                                                           |
|------|----------|------------------------------------------------------------------|
| 1    | DRIVE    | Compressor Input Gain (drives GR harder)                         |
| 2    | BASS     | Channel EQ Low Shelf Gain                                        |
| 3    | TREBLE   | Channel EQ High Shelf Gain                                       |
| 4    | DYNAMICS | Compressor Mix (0% = expanded, 100% = compressed)                |
| 5    | COLOR    | Exciter Mix or Pedalboard Mix (harmonic saturation amount)        |
| 6    | WIDTH    | Direction Mixer Spread (Narrow <> Wide, mono-safe)               |
| 7    | SPACE    | Reverb plugin Mix (0-max%)                                       |
| 8    | OUTPUT   | Gain plugin Output (trim after chain)                            |

### Smart Control Mapping Notes

- Smart Controls are configured in **Layout > Edit Mode** in Logic's Smart Controls pane
- Each knob maps to exactly **one** plugin parameter via **Parameter Mapping**
- Set **Min/Max range** per mapping to constrain sweep
- Knob 4 (DYNAMICS) maps to Compressor **Mix** — at 0% the signal passes through the Enveloper only (expanded/transient-enhanced), at 100% the Compressor is fully blended in (compressed)
- Knob 5 (COLOR) maps to Exciter **Mix** (or Pedalboard **Mix** on SUB) for controllable harmonic saturation
- Knob 6 (WIDTH) maps to Direction Mixer **Spread** — uses mid-side processing for clean mono collapse
- Knob 8 (OUTPUT) uses a **Gain** plugin at the end of the chain for final trim

### DYNAMICS Knob (Expanded <> Compressed)

| Position   | Compressor Mix | Character                                         |
|------------|----------------|----------------------------------------------------|
| Full left  | 0%             | **EXPANDED** — Enveloper transient boost only, no compression |
| Center     | 50%            | Balanced — blend of transient shape and compression |
| Full right | 100%           | **COMPRESSED** — full compressor engagement         |

The Enveloper is always active in the chain before the Compressor. At 0% Compressor Mix, you hear the Enveloper's transient-enhanced signal. As you increase DYNAMICS, the Compressor's output blends in, progressively taming transients and adding sustain.

### COLOR Knob (Harmonic Saturation)

| Position   | Mix Value | Character                                    |
|------------|-----------|----------------------------------------------|
| Full left  | 0%        | **CLEAN** — no harmonic coloring             |
| Center     | ~20-25%   | Moderate — subtle warmth and presence         |
| Full right | 40-60%    | **SATURATED** — rich harmonic enhancement    |

Max range varies per preset to keep saturation musically useful within each frequency band.

### WIDTH Knob (Narrow <> Wide)

| Position   | Spread Value | Character                                    |
|------------|-------------|----------------------------------------------|
| Full left  | 0.0-0.5    | **NARROW** — collapsed toward mono center    |
| Center     | 1.0         | Unity stereo — no change to original image   |
| Full right | 1.5-2.0    | **WIDE** — expanded stereo, still mono-safe  |

Direction Mixer uses mid-side processing, ensuring no phase cancellation on mono fold-down.

---

## Preset 1: MPD-CLA-SUB (20-80 Hz)

**Target:** Sub-bass content — kick fundamentals, bass synths, 808s, sub drops

### Insert Chain

| Slot | Plugin             | Purpose                               |
|------|--------------------|---------------------------------------|
| 1    | Channel EQ         | Sub focus + cleanup above             |
| 2    | Enveloper          | Transient shaping for sub punch       |
| 3    | Compressor (Opto)  | Smooth sub dynamics                   |
| 4    | Pedalboard (Dist)  | Harmonic saturation for speaker translation |
| 5    | ChromaVerb (Room)  | Minimal low-end space                 |
| 6    | Direction Mixer    | Mono-safe stereo width                |
| 7    | Gain               | Output trim                           |

### Fixed Settings

**Channel EQ**
- HPF: Off (preserve all sub content)
- Low Shelf: 40 Hz, 0 dB (macro range: +/-6 dB)
- Mid cut: 200 Hz, -2 dB, Q 1.5 (fixed — clear mud above sub range)
- High Shelf: 100 Hz, 0 dB (macro range: +/-6 dB)
- LPF: 250 Hz, 12 dB/oct (fixed — focus on sub content)

**Enveloper**
- Attack Gain: +6 dB
- Attack Time: 20 ms
- Release Gain: 0 dB
- Output: -3 dB
- Always on, not macro'd

**Compressor**
- Circuit: Opto (smooth, no transient snap needed for subs)
- Ratio: 4:1
- Attack: 30 ms (fixed)
- Release: 200 ms (fixed)
- Knee: 1.0
- Mix: 0% default (macro range: 0-100%)
- Input Gain: 0 dB default (macro range: 0 to +12 dB)

**Pedalboard**
- Pedal: Hi-Drive at very low gain
- Drive: 10% (fixed)
- Tone: 30% (very dark — just adding sub harmonics)
- Mix: 0% default (macro range: 0-40%)

**ChromaVerb**
- Algorithm: Room
- Decay: 0.3 s (very short — sub reverb must be tight)
- Pre-delay: 5 ms
- High Cut: 200 Hz
- Low Cut: 20 Hz
- Mix: 0% default (macro range: 0-20%)

**Direction Mixer**
- Spread: 1.0 default (macro range: 0.0 -> 1.5)

### Smart Control Ranges

| Knob     | Parameter Path                    | Min        | Max        |
|----------|-----------------------------------|------------|------------|
| DRIVE    | Compressor > Input Gain           | 0 dB       | +12 dB     |
| BASS     | Channel EQ > Low Shelf Gain       | -6 dB      | +6 dB      |
| TREBLE   | Channel EQ > High Shelf Gain      | -6 dB      | +6 dB      |
| DYNAMICS | Compressor > Mix                  | 0%         | 100%       |
| COLOR    | Pedalboard > Mix                  | 0%         | 40%        |
| WIDTH    | Direction Mixer > Spread          | 0.0 (mono) | 1.5 (wide) |
| SPACE    | ChromaVerb > Mix                  | 0%         | 20%        |
| OUTPUT   | Gain > Gain                       | -12 dB     | +6 dB      |

---

## Preset 2: MPD-CLA-LO-MID (80-500 Hz)

**Target:** Low-mid content — bass harmonics, guitar/piano body, vocal warmth, snare body, toms

### Insert Chain

| Slot | Plugin             | Purpose                          |
|------|--------------------|----------------------------------|
| 1    | Channel EQ         | Low-mid focus + cleanup          |
| 2    | Enveloper          | Transient definition for body    |
| 3    | Compressor (Opto)  | Smooth body dynamics             |
| 4    | Exciter            | Harmonic warmth                  |
| 5    | Tape Delay         | Subtle thickening                |
| 6    | ChromaVerb (Room)  | Small room warmth                |
| 7    | Direction Mixer    | Mono-safe stereo width           |
| 8    | Gain               | Output trim                      |

### Fixed Settings

**Channel EQ**
- HPF: 60 Hz, 18 dB/oct (clean sub rumble below range)
- Low Shelf: 100 Hz, 0 dB (macro range: +/-6 dB)
- Mid boost: 250 Hz, +1 dB, Q 1.0 (fixed — body center)
- Mid cut: 600 Hz, -1.5 dB, Q 1.5 (fixed — honk removal)
- High Shelf: 500 Hz, 0 dB (macro range: +/-6 dB)
- LPF: 2 kHz, 6 dB/oct (fixed — gentle rolloff above range)

**Enveloper**
- Attack Gain: +6 dB
- Attack Time: 20 ms
- Release Gain: 0 dB
- Output: -3 dB
- Always on, not macro'd

**Compressor**
- Circuit: Opto
- Ratio: 3:1
- Attack: 15 ms (fixed)
- Release: 150 ms (fixed)
- Knee: 0.8
- Mix: 0% default (macro range: 0-100%)
- Input Gain: 0 dB default (macro range: 0 to +15 dB)

**Exciter**
- Frequency 1: 150 Hz, Amount 4%
- Frequency 2: 400 Hz, Amount 6%
- Mix: 0% default (macro range: 0-40%)

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
- Mix: 0% default (macro range: 0-30%)

**Direction Mixer**
- Spread: 1.0 default (macro range: 0.5 -> 1.5)

### Smart Control Ranges

| Knob     | Parameter Path                    | Min          | Max          |
|----------|-----------------------------------|--------------|--------------|
| DRIVE    | Compressor > Input Gain           | 0 dB         | +15 dB       |
| BASS     | Channel EQ > Low Shelf Gain       | -6 dB        | +6 dB        |
| TREBLE   | Channel EQ > High Shelf Gain      | -6 dB        | +6 dB        |
| DYNAMICS | Compressor > Mix                  | 0%           | 100%         |
| COLOR    | Exciter > Mix                     | 0%           | 40%          |
| WIDTH    | Direction Mixer > Spread          | 0.5 (narrow) | 1.5 (wide)   |
| SPACE    | ChromaVerb > Mix                  | 0%           | 30%          |
| OUTPUT   | Gain > Gain                       | -12 dB       | +6 dB        |

---

## Preset 3: MPD-CLA-HI-MID (500 Hz-2 kHz)

**Target:** High-mid content — vocal presence, snare crack, guitar attack, piano midrange, horn body

### Insert Chain

| Slot | Plugin             | Purpose                          |
|------|--------------------|----------------------------------|
| 1    | Channel EQ         | Hi-mid focus + cleanup           |
| 2    | DeEsser 2          | Harshness control at 1-2 kHz     |
| 3    | Enveloper          | Transient attack for midrange punch |
| 4    | Compressor (FET)   | Aggressive mid dynamics          |
| 5    | Exciter            | Midrange presence                |
| 6    | Tape Delay         | Slap thickening                  |
| 7    | ChromaVerb (Plate) | Mid-focused plate                |
| 8    | Direction Mixer    | Mono-safe stereo width           |
| 9    | Gain               | Output trim                      |

### Fixed Settings

**Channel EQ**
- HPF: 400 Hz, 12 dB/oct
- Low Shelf: 500 Hz, 0 dB (macro range: +/-6 dB)
- Mid cut: 800 Hz, -1 dB, Q 2.0 (fixed — nasal reduction)
- Presence: 1.5 kHz, +1.5 dB, Q 1.0 (fixed — midrange center)
- High Shelf: 2 kHz, 0 dB (macro range: +/-6 dB)
- LPF: 5 kHz, 6 dB/oct (fixed — rolloff above range)

**DeEsser 2**
- Frequency: 1.8 kHz
- Sensitivity: -25 dB
- Mode: Relative
- Always on, not macro'd

**Enveloper**
- Attack Gain: +6 dB
- Attack Time: 20 ms
- Release Gain: 0 dB
- Output: -3 dB
- Always on, not macro'd

**Compressor**
- Circuit: FET (aggressive character suits midrange punch)
- Ratio: 4:1
- Attack: 5 ms (fixed)
- Release: 80 ms (fixed)
- Knee: 0.5
- Mix: 0% default (macro range: 0-100%)
- Input Gain: 0 dB default (macro range: 0 to +18 dB)

**Exciter**
- Frequency 1: 800 Hz, Amount 5%
- Frequency 2: 1.5 kHz, Amount 7%
- Harmonics: Odd + Even
- Mix: 0% default (macro range: 0-50%)

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
- Mix: 0% default (macro range: 0-40%)

**Direction Mixer**
- Spread: 1.0 default (macro range: 0.5 -> 2.0)

### Smart Control Ranges

| Knob     | Parameter Path                    | Min          | Max          |
|----------|-----------------------------------|--------------|--------------|
| DRIVE    | Compressor > Input Gain           | 0 dB         | +18 dB       |
| BASS     | Channel EQ > Low Shelf Gain       | -6 dB        | +6 dB        |
| TREBLE   | Channel EQ > High Shelf Gain      | -6 dB        | +6 dB        |
| DYNAMICS | Compressor > Mix                  | 0%           | 100%         |
| COLOR    | Exciter > Mix                     | 0%           | 50%          |
| WIDTH    | Direction Mixer > Spread          | 0.5 (narrow) | 2.0 (wide)   |
| SPACE    | ChromaVerb > Mix                  | 0%           | 40%          |
| OUTPUT   | Gain > Gain                       | -12 dB       | +6 dB        |

---

## Preset 4: MPD-CLA-HIGH (2-8 kHz)

**Target:** High-frequency content — vocal clarity, pick attack, cymbal body, string bite, synth edge

### Insert Chain

| Slot | Plugin             | Purpose                          |
|------|--------------------|----------------------------------|
| 1    | Channel EQ         | High focus + cleanup             |
| 2    | DeEsser 2          | Sibilance/harshness control      |
| 3    | Enveloper          | Transient detail for highs       |
| 4    | Compressor (VCA)   | Precise high-freq dynamics       |
| 5    | Exciter            | Harmonic edge                    |
| 6    | Tape Delay         | Rhythmic clarity delay           |
| 7    | ChromaVerb (Hall)  | Spatial depth                    |
| 8    | Direction Mixer    | Mono-safe stereo width           |
| 9    | Gain               | Output trim                      |

### Fixed Settings

**Channel EQ**
- HPF: 1.5 kHz, 12 dB/oct
- Low Shelf: 2 kHz, 0 dB (macro range: +/-6 dB)
- Mid cut: 3.5 kHz, -1 dB, Q 2.0 (fixed — harsh resonance taming)
- Presence: 5 kHz, +1 dB, Q 0.8 (fixed — clarity center)
- High Shelf: 8 kHz, 0 dB (macro range: +/-6 dB)
- LPF: 12 kHz, 6 dB/oct (fixed — prevent air bleed)

**DeEsser 2**
- Frequency: 5.5 kHz
- Sensitivity: -28 dB
- Mode: Relative
- Always on, not macro'd

**Enveloper**
- Attack Gain: +6 dB
- Attack Time: 20 ms
- Release Gain: 0 dB
- Output: -3 dB
- Always on, not macro'd

**Compressor**
- Circuit: VCA (precise, transparent for high-frequency detail)
- Ratio: 3:1
- Attack: 2 ms (fixed)
- Release: 60 ms (fixed)
- Knee: 0.5
- Mix: 0% default (macro range: 0-100%)
- Input Gain: 0 dB default (macro range: 0 to +15 dB)

**Exciter**
- Frequency 1: 3 kHz, Amount 6%
- Frequency 2: 6 kHz, Amount 8%
- Harmonics: Odd + Even
- Mix: 0% default (macro range: 0-50%)

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
- Mix: 0% default (macro range: 0-45%)

**Direction Mixer**
- Spread: 1.0 default (macro range: 0.5 -> 2.0)

### Smart Control Ranges

| Knob     | Parameter Path                    | Min          | Max          |
|----------|-----------------------------------|--------------|--------------|
| DRIVE    | Compressor > Input Gain           | 0 dB         | +15 dB       |
| BASS     | Channel EQ > Low Shelf Gain       | -6 dB        | +6 dB        |
| TREBLE   | Channel EQ > High Shelf Gain      | -6 dB        | +6 dB        |
| DYNAMICS | Compressor > Mix                  | 0%           | 100%         |
| COLOR    | Exciter > Mix                     | 0%           | 50%          |
| WIDTH    | Direction Mixer > Spread          | 0.5 (narrow) | 2.0 (wide)   |
| SPACE    | ChromaVerb > Mix                  | 0%           | 45%          |
| OUTPUT   | Gain > Gain                       | -12 dB       | +6 dB        |

---

## Preset 5: MPD-CLA-AIR (8-20 kHz)

**Target:** Air/ultra-high content — vocal breath, cymbal shimmer, acoustic sparkle, synth air, string harmonics

### Insert Chain

| Slot | Plugin             | Purpose                          |
|------|--------------------|----------------------------------|
| 1    | Channel EQ         | Air focus + cleanup              |
| 2    | DeEsser 2          | Ultra-high harshness control     |
| 3    | Enveloper          | Transient sparkle for air band   |
| 4    | Compressor (VCA)   | Delicate air dynamics            |
| 5    | Exciter            | Shimmer/sparkle enhancement      |
| 6    | ChromaVerb (Plate) | Airy plate shimmer               |
| 7    | Direction Mixer    | Mono-safe stereo width           |
| 8    | Gain               | Output trim                      |

### Fixed Settings

**Channel EQ**
- HPF: 6 kHz, 12 dB/oct
- Low Shelf: 8 kHz, 0 dB (macro range: +/-6 dB)
- Presence: 10 kHz, +1.5 dB, Q 0.7 (fixed — air center)
- High Shelf: 14 kHz, 0 dB (macro range: +/-6 dB)
- No LPF (preserve all ultra-high content)

**DeEsser 2**
- Frequency: 10 kHz
- Sensitivity: -25 dB
- Mode: Relative
- Always on, not macro'd

**Enveloper**
- Attack Gain: +6 dB
- Attack Time: 20 ms
- Release Gain: 0 dB
- Output: -3 dB
- Always on, not macro'd

**Compressor**
- Circuit: VCA (transparent, preserves delicate air detail)
- Ratio: 2:1
- Attack: 1 ms (fixed)
- Release: 40 ms (fixed)
- Knee: 0.8
- Mix: 0% default (macro range: 0-100%)
- Input Gain: 0 dB default (macro range: 0 to +10 dB)

**Exciter**
- Frequency 1: 8 kHz, Amount 5%
- Frequency 2: 14 kHz, Amount 8%
- Harmonics: Odd + Even
- Mix: 0% default (macro range: 0-60%)

**ChromaVerb**
- Algorithm: Plate
- Decay: 2.0 s (long shimmer tail)
- Pre-delay: 50 ms
- High Cut: 18 kHz
- Low Cut: 6 kHz
- Width: 100%
- Mix: 0% default (macro range: 0-50%)

**Direction Mixer**
- Spread: 1.0 default (macro range: 0.5 -> 2.0)

### Smart Control Ranges

| Knob     | Parameter Path                    | Min          | Max          |
|----------|-----------------------------------|--------------|--------------|
| DRIVE    | Compressor > Input Gain           | 0 dB         | +10 dB       |
| BASS     | Channel EQ > Low Shelf Gain       | -6 dB        | +6 dB        |
| TREBLE   | Channel EQ > High Shelf Gain      | -6 dB        | +6 dB        |
| DYNAMICS | Compressor > Mix                  | 0%           | 100%         |
| COLOR    | Exciter > Mix                     | 0%           | 60%          |
| WIDTH    | Direction Mixer > Spread          | 0.5 (narrow) | 2.0 (wide)   |
| SPACE    | ChromaVerb > Mix                  | 0%           | 50%          |
| OUTPUT   | Gain > Gain                       | -12 dB       | +6 dB        |

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
5. Knob labels in order: **DRIVE, BASS, TREBLE, DYNAMICS, COLOR, WIDTH, SPACE, OUTPUT**
6. Every knob maps to exactly one parameter — no multi-parameter mappings needed
7. Exit Edit Mode

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
        ├── presets/
        │   ├── bus/
        │   ├── fx/
        │   └── mastering/
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
| 1     | MPD-CLA-HI-MID  | Most complex chain (9 inserts), mid is most critical     |
| 2     | MPD-CLA-HIGH    | Similar chain, validates VCA + DeEsser approach          |
| 3     | MPD-CLA-AIR     | Tests shimmer/Exciter-heavy approach                     |
| 4     | MPD-CLA-LO-MID  | Tests Opto + warmth in low range                         |
| 5     | MPD-CLA-SUB     | Simplest chain, validates sub-only processing            |

---

## Testing Checklist

For each preset, run through:

- [ ] All 8 knobs sweep full range without clipping
- [ ] DRIVE at max doesn't cause digital overs (check output meter)
- [ ] DYNAMICS at 0% = expanded/dry (Enveloper transient boost audible, no compression)
- [ ] DYNAMICS at 100% = fully compressed (smooth sustained character)
- [ ] DYNAMICS sweep is smooth and musically useful across full range
- [ ] COLOR at 0% = clean signal, no harmonic saturation
- [ ] COLOR at max = rich saturation without harshness (sweep full range)
- [ ] WIDTH full left (Narrow) = mono-compatible center image
- [ ] WIDTH full right (Wide) = expanded stereo, no phase issues
- [ ] WIDTH mono fold-down test: sum to mono at max width, verify no cancellation
- [ ] SPACE at max doesn't wash out the source
- [ ] OUTPUT knob can compensate for loudness added by processing
- [ ] A/B bypass: processed version should be loudness-matched to dry
- [ ] Enveloper is audible in isolation (bypass Compressor, confirm transient boost)
- [ ] Test with at least 3 different source recordings per preset
- [ ] Save both .cst AND .patch after final tweaks
