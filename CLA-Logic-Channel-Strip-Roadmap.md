# CLA Signature Series → Logic Pro Channel Strip Presets

## Roadmap & Build Spec

---

## Architecture

Logic's **Smart Controls** are the macro system. Each channel strip preset gets 8 Smart Control knobs mapped across the insert chain. All processing runs as inserts (no bus sends) so the preset is fully self-contained and portable.

### Universal Macro Layout (all 5 presets)

| Knob | Label        | Target                                      |
|------|------------- |---------------------------------------------|
| 1    | SENSITIVITY  | Compressor Input Gain (drives GR harder)    |
| 2    | BASS         | Channel EQ Low Shelf Gain                   |
| 3    | TREBLE       | Channel EQ High Shelf Gain                  |
| 4    | COMPRESS     | Compressor Mix (parallel blend 0–100%)      |
| 5    | REVERB       | Reverb plugin Mix (0–100%)                  |
| 6    | DELAY        | Delay plugin Mix (0–100%)                   |
| 7    | PITCH        | Pitch/Chorus plugin Mix (0–100%)            |
| 8    | OUTPUT       | Gain plugin Output (trim after chain)       |

### Smart Control Mapping Notes

- Smart Controls are configured in **Layout > Edit Mode** in Logic's Smart Controls pane
- Each knob maps to one or more plugin parameters via **Parameter Mapping**
- Set **Min/Max range** per mapping to constrain sweep (e.g., Bass shelf ±6dB not ±24dB)
- Knob 4 (COMPRESS) uses Logic Compressor's built-in **Mix** knob — this is the key to replicating the CLA "amount" feel vs. threshold/ratio control
- Knob 8 (OUTPUT) uses a **Gain** plugin at the end of the chain for final trim

---

## Preset 1: MPD-CLA-VOX

**Target:** Lead and background vocals

### Insert Chain (top to bottom)

| Slot | Plugin              | Purpose                        |
|------|---------------------|--------------------------------|
| 1    | Channel EQ          | Tone shaping                   |
| 2    | DeEsser 2           | Sibilance control              |
| 3    | Compressor (FET)    | Primary dynamics               |
| 4    | Exciter             | Harmonic presence              |
| 5    | Tape Delay          | Slap/short delay               |
| 6    | ChromaVerb (Plate)  | Vocal plate reverb             |
| 7    | Chorus              | Pitch doubler/widener          |
| 8    | Gain                | Output trim                    |

### Fixed Settings

**Channel EQ**
- HPF: 80 Hz, 12 dB/oct
- Low Shelf: 200 Hz, 0 dB (macro range: ±6 dB)
- Mid cut: 300 Hz, -2 dB, Q 1.5 (fixed — mud removal)
- High Shelf: 5 kHz, 0 dB (macro range: ±6 dB)
- Air boost: 12 kHz, +2 dB, Q 0.7 (fixed)

**DeEsser 2**
- Frequency: 6.5 kHz
- Sensitivity: -30 dB
- Mode: Relative
- Always on, not macro'd

**Compressor**
- Circuit: FET
- Ratio: 4:1
- Attack: 5 ms
- Release: 80 ms
- Knee: 0.5
- Mix: 0% default (macro range: 0–100%)
- Input Gain: 0 dB default (macro range: 0 to +18 dB)

**Exciter**
- Frequency 1: 3 kHz, Amount 5%
- Frequency 2: 8 kHz, Amount 8%
- Harmonics: Odd + Even
- Mix: 30% (fixed — always adding a bit)

**Tape Delay**
- Time: 110 ms (slap)
- Feedback: 15%
- High Cut: 6 kHz
- Low Cut: 200 Hz
- Flutter: 10%
- Mix: 0% default (macro range: 0–50%)

**ChromaVerb**
- Algorithm: Plate
- Decay: 1.5 s
- Pre-delay: 40 ms
- High Cut: 8 kHz
- Low Cut: 200 Hz
- Width: 100%
- Mix: 0% default (macro range: 0–50%)

**Chorus**
- Rate: 0.5 Hz
- Depth: 15%
- Mix: 0% default (macro range: 0–40%)

### Smart Control Ranges

| Knob        | Parameter Path                    | Min    | Max    |
|-------------|-----------------------------------|--------|--------|
| SENSITIVITY | Compressor > Input Gain           | 0 dB   | +18 dB |
| BASS        | Channel EQ > Low Shelf Gain       | -6 dB  | +6 dB  |
| TREBLE      | Channel EQ > High Shelf Gain      | -6 dB  | +6 dB  |
| COMPRESS    | Compressor > Mix                  | 0%     | 100%   |
| REVERB      | ChromaVerb > Mix                  | 0%     | 50%    |
| DELAY       | Tape Delay > Mix                  | 0%     | 50%    |
| PITCH       | Chorus > Mix                      | 0%     | 40%    |
| OUTPUT      | Gain > Gain                       | -12 dB | +6 dB  |

---

## Preset 2: MPD-CLA-BASS

**Target:** Electric bass, synth bass

### Insert Chain

| Slot | Plugin              | Purpose                        |
|------|---------------------|--------------------------------|
| 1    | Channel EQ          | Tone shaping                   |
| 2    | Compressor (Opto)   | Smooth dynamics                |
| 3    | Pedalboard (Dist)   | Harmonic saturation            |
| 4    | Tape Delay          | Subtle thickening              |
| 5    | ChromaVerb (Room)   | Minimal room                   |
| 6    | Chorus              | Width/doubler                  |
| 7    | Gain                | Output trim                    |

### Fixed Settings

**Channel EQ**
- HPF: 30 Hz, 24 dB/oct (sub cleanup)
- Low Shelf: 80 Hz, 0 dB (macro range: ±6 dB)
- Mid cut: 350 Hz, -2 dB, Q 2.0 (fixed — box removal)
- Presence: 1.2 kHz, +1.5 dB, Q 1.0 (fixed — finger/pick attack)
- High Shelf: 4 kHz, 0 dB (macro range: ±6 dB)

**Compressor**
- Circuit: Opto
- Ratio: 3:1
- Attack: 20 ms (let transient through)
- Release: Auto
- Knee: 1.0 (soft)
- Mix: 0% default (macro range: 0–100%)
- Input Gain: 0 dB default (macro range: 0 to +15 dB)

**Pedalboard**
- Single pedal: Hi-Drive or Candy Fuzz at very low gain
- Drive: 15% (fixed)
- Tone: 40% (dark — adding upper harmonics without fizz)
- Mix: 25% (fixed)
- This is the CLA Bass "secret sauce" — small-speaker translation

**Tape Delay**
- Time: 60 ms
- Feedback: 5%
- High Cut: 3 kHz
- Low Cut: 300 Hz
- Mix: 0% default (macro range: 0–30%)

**ChromaVerb**
- Algorithm: Room
- Decay: 0.4 s
- Pre-delay: 10 ms
- High Cut: 4 kHz
- Low Cut: 300 Hz
- Mix: 0% default (macro range: 0–25%)

**Chorus**
- Rate: 0.3 Hz
- Depth: 10%
- Mix: 0% default (macro range: 0–30%)

### Smart Control Ranges

| Knob        | Parameter Path                    | Min    | Max    |
|-------------|-----------------------------------|--------|--------|
| SENSITIVITY | Compressor > Input Gain           | 0 dB   | +15 dB |
| BASS        | Channel EQ > Low Shelf Gain       | -6 dB  | +6 dB  |
| TREBLE      | Channel EQ > High Shelf Gain      | -6 dB  | +6 dB  |
| COMPRESS    | Compressor > Mix                  | 0%     | 100%   |
| REVERB      | ChromaVerb > Mix                  | 0%     | 25%    |
| DELAY       | Tape Delay > Mix                  | 0%     | 30%    |
| PITCH       | Chorus > Mix                      | 0%     | 30%    |
| OUTPUT      | Gain > Gain                       | -12 dB | +6 dB  |

---

## Preset 3: MPD-CLA-DRUM

**Target:** Drum bus, individual drums, percussion

### Insert Chain

| Slot | Plugin              | Purpose                        |
|------|---------------------|--------------------------------|
| 1    | Channel EQ          | Tone shaping                   |
| 2    | Compressor (FET)    | Aggressive smash               |
| 3    | Enveloper           | Transient recovery             |
| 4    | Tape Delay          | Rhythmic slap                  |
| 5    | ChromaVerb (Room)   | Drum room                      |
| 6    | Ensemble            | Width/pitch                    |
| 7    | Gain                | Output trim                    |

### Fixed Settings

**Channel EQ**
- HPF: 40 Hz, 18 dB/oct
- Low Shelf: 60 Hz, 0 dB (macro range: ±6 dB) — sub weight
- Mid scoop: 400 Hz, -3 dB, Q 1.5 (fixed — box/cardboard cut)
- Snap: 4.5 kHz, +2 dB, Q 1.2 (fixed — transient bite)
- High Shelf: 8 kHz, 0 dB (macro range: ±6 dB)

**Compressor**
- Circuit: FET
- Ratio: 8:1
- Attack: 0.5 ms (fast — smash mode)
- Release: 50 ms (fast pump)
- Knee: 0
- Mix: 0% default (macro range: 0–100%)
- Input Gain: 0 dB default (macro range: 0 to +20 dB)

**Enveloper**
- Attack Gain: +8 dB (fixed — transient recovery after smash)
- Release Gain: -3 dB (fixed — tighten tails)
- Lookahead: On

**Tape Delay**
- Time: 90 ms
- Feedback: 10%
- High Cut: 5 kHz
- Low Cut: 250 Hz
- Mix: 0% default (macro range: 0–35%)

**ChromaVerb**
- Algorithm: Room
- Decay: 0.6 s
- Pre-delay: 15 ms
- High Cut: 6 kHz
- Low Cut: 250 Hz
- Width: 100%
- Mix: 0% default (macro range: 0–40%)

**Ensemble**
- Rate: 0.8 Hz
- Depth: 12%
- Voices: 4
- Mix: 0% default (macro range: 0–30%)

### Smart Control Ranges

| Knob        | Parameter Path                    | Min    | Max    |
|-------------|-----------------------------------|--------|--------|
| SENSITIVITY | Compressor > Input Gain           | 0 dB   | +20 dB |
| BASS        | Channel EQ > Low Shelf Gain       | -6 dB  | +6 dB  |
| TREBLE      | Channel EQ > High Shelf Gain      | -6 dB  | +6 dB  |
| COMPRESS    | Compressor > Mix                  | 0%     | 100%   |
| REVERB      | ChromaVerb > Mix                  | 0%     | 40%    |
| DELAY       | Tape Delay > Mix                  | 0%     | 35%    |
| PITCH       | Ensemble > Mix                    | 0%     | 30%    |
| OUTPUT      | Gain > Gain                       | -12 dB | +6 dB  |

---

## Preset 4: MPD-CLA-GTR

**Target:** Electric guitar (clean, crunch, lead)

### Insert Chain

| Slot | Plugin              | Purpose                        |
|------|---------------------|--------------------------------|
| 1    | Channel EQ          | Tone shaping                   |
| 2    | Compressor (VCA)    | Controlled dynamics            |
| 3    | Exciter             | Harmonic presence              |
| 4    | Tape Delay          | Rhythmic delay                 |
| 5    | ChromaVerb (Hall)   | Spatial depth                  |
| 6    | Chorus              | Width/modulation               |
| 7    | Gain                | Output trim                    |

### Fixed Settings

**Channel EQ**
- HPF: 100 Hz, 12 dB/oct
- Low Shelf: 200 Hz, 0 dB (macro range: ±6 dB)
- Mid cut: 400 Hz, -1.5 dB, Q 1.5 (fixed — boxy cleanup)
- Presence: 3 kHz, +1 dB, Q 1.0 (fixed)
- High Shelf: 6 kHz, 0 dB (macro range: ±6 dB)
- LPF: 12 kHz, 6 dB/oct (fixed — fizz taming)

**Compressor**
- Circuit: VCA
- Ratio: 3:1
- Attack: 10 ms (preserve pick attack)
- Release: 120 ms
- Knee: 0.5
- Mix: 0% default (macro range: 0–100%)
- Input Gain: 0 dB default (macro range: 0 to +15 dB)

**Exciter**
- Frequency 1: 2.5 kHz, Amount 8%
- Frequency 2: 6 kHz, Amount 5%
- Mix: 20% (fixed)

**Tape Delay**
- Time: Dotted 1/8 (sync to host)
- Feedback: 25%
- High Cut: 5 kHz
- Low Cut: 250 Hz
- Flutter: 15%
- Mix: 0% default (macro range: 0–45%)

**ChromaVerb**
- Algorithm: Hall
- Decay: 1.8 s
- Pre-delay: 50 ms
- High Cut: 7 kHz
- Low Cut: 250 Hz
- Mix: 0% default (macro range: 0–45%)

**Chorus**
- Rate: 0.7 Hz
- Depth: 20%
- Mix: 0% default (macro range: 0–50%)

### Smart Control Ranges

| Knob        | Parameter Path                    | Min    | Max    |
|-------------|-----------------------------------|--------|--------|
| SENSITIVITY | Compressor > Input Gain           | 0 dB   | +15 dB |
| BASS        | Channel EQ > Low Shelf Gain       | -6 dB  | +6 dB  |
| TREBLE      | Channel EQ > High Shelf Gain      | -6 dB  | +6 dB  |
| COMPRESS    | Compressor > Mix                  | 0%     | 100%   |
| REVERB      | ChromaVerb > Mix                  | 0%     | 45%    |
| DELAY       | Tape Delay > Mix                  | 0%     | 45%    |
| PITCH       | Chorus > Mix                      | 0%     | 50%    |
| OUTPUT      | Gain > Gain                       | -12 dB | +6 dB  |

---

## Preset 5: MPD-CLA-UNPLG

**Target:** Acoustic guitar, piano, strings, acoustic instruments

### Insert Chain

| Slot | Plugin                 | Purpose                     |
|------|------------------------|-----------------------------|
| 1    | Channel EQ             | Tone shaping                |
| 2    | Compressor (Opto)      | Gentle dynamics             |
| 3    | Exciter                | Air/sparkle                 |
| 4    | Tape Delay             | Subtle ambience             |
| 5    | Space Designer         | Natural room IR             |
| 6    | Chorus                 | Stereo widening             |
| 7    | Gain                   | Output trim                 |

### Fixed Settings

**Channel EQ**
- HPF: 60 Hz, 12 dB/oct
- Low Shelf: 150 Hz, 0 dB (macro range: ±6 dB)
- Mid: 2.5 kHz, -1 dB, Q 2.0 (fixed — harshness taming)
- High Shelf: 8 kHz, 0 dB (macro range: ±6 dB)

**Compressor**
- Circuit: Opto
- Ratio: 2.5:1
- Attack: 25 ms (preserve natural transient fully)
- Release: Auto
- Knee: 1.0 (very soft)
- Mix: 0% default (macro range: 0–100%)
- Input Gain: 0 dB default (macro range: 0 to +12 dB)

**Exciter**
- Frequency 1: 5 kHz, Amount 4%
- Frequency 2: 12 kHz, Amount 6%
- Mix: 25% (fixed)

**Tape Delay**
- Time: 140 ms
- Feedback: 10%
- High Cut: 4 kHz
- Low Cut: 200 Hz
- Flutter: 8%
- Mix: 0% default (macro range: 0–35%)

**Space Designer**
- IR: Medium Room or Studio (from factory library)
- Reverb Time: 1.0 s
- Pre-delay: 25 ms
- High Cut: 8 kHz
- Low Cut: 150 Hz
- Mix: 0% default (macro range: 0–45%)

**Chorus**
- Rate: 0.4 Hz
- Depth: 10%
- Mix: 0% default (macro range: 0–35%)

### Smart Control Ranges

| Knob        | Parameter Path                    | Min    | Max    |
|-------------|-----------------------------------|--------|--------|
| SENSITIVITY | Compressor > Input Gain           | 0 dB   | +12 dB |
| BASS        | Channel EQ > Low Shelf Gain       | -6 dB  | +6 dB  |
| TREBLE      | Channel EQ > High Shelf Gain      | -6 dB  | +6 dB  |
| COMPRESS    | Compressor > Mix                  | 0%     | 100%   |
| REVERB      | Space Designer > Mix              | 0%     | 45%    |
| DELAY       | Tape Delay > Mix                  | 0%     | 35%    |
| PITCH       | Chorus > Mix                      | 0%     | 35%    |
| OUTPUT      | Gain > Gain                       | -12 dB | +6 dB  |

---

## Build Procedure (per preset)

### Phase 1: Chain Assembly

1. Create new Software Instrument or Audio track
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
5. Exit Edit Mode

### Phase 3: Save as Channel Strip Preset

1. Click the **Setting** button at the top of the channel strip (where it says "Default" or current preset name)
2. Select **Save Channel Strip Setting As...**
3. Navigate to or create folder: `MPD-CLA/`
4. Name: `MPD-CLA-VOX`, `MPD-CLA-BASS`, etc.
5. Logic saves to: `~/Music/Audio Music Apps/Channel Strip Settings/`

### Phase 4: Smart Control Layout Save

Smart Controls are saved with the **Patch**, not the Channel Strip Setting. To preserve Smart Control layouts:

1. After mapping all knobs, save as a **Patch** (not just Channel Strip):
   - Library pane > Save Patch
   - Name: `MPD-CLA-VOX` etc.
   - Location: `~/Music/Audio Music Apps/Patches/`
2. Patches store: Channel Strip + Smart Controls + sends + output routing

**This is critical** — if you only save as Channel Strip Setting, the Smart Control mappings won't persist. Always save the full Patch.

---

## File Structure

```
~/Music/Audio Music Apps/
├── Channel Strip Settings/
│   └── MPD-CLA/
│       ├── MPD-CLA-VOX.cst
│       ├── MPD-CLA-BASS.cst
│       ├── MPD-CLA-DRUM.cst
│       ├── MPD-CLA-GTR.cst
│       └── MPD-CLA-UNPLG.cst
└── Patches/
    └── MPD-CLA/
        ├── MPD-CLA-VOX.patch
        ├── MPD-CLA-BASS.patch
        ├── MPD-CLA-DRUM.patch
        ├── MPD-CLA-GTR.patch
        └── MPD-CLA-UNPLG.patch
```

---

## Build Order (recommended)

| Phase | Preset    | Why First                                          |
|-------|-----------|----------------------------------------------------|
| 1     | MPD-CLA-VOX  | Most complex chain, sets template for all others |
| 2     | MPD-CLA-DRUM | Second most used, validates FET smash approach   |
| 3     | MPD-CLA-BASS | Tests Opto + saturation strategy                 |
| 4     | MPD-CLA-GTR  | Tests VCA + delay/verb balance                   |
| 5     | MPD-CLA-UNPLG| Lightest touch, validates gentle Opto approach   |

**Estimated build time:** ~30 min per preset (first one takes longer, rest are variations on the template).

---

## Testing Checklist

For each preset, run through:

- [ ] All 8 knobs sweep full range without clipping
- [ ] Sensitivity at max doesn't cause digital overs (check output meter)
- [ ] Compress at 100% sounds usable (not destroyed)
- [ ] Reverb and Delay at max don't wash out the source
- [ ] Pitch at max sounds like subtle doubling, not chorusy artifacts
- [ ] Output knob can compensate for loudness added by processing
- [ ] A/B bypass: processed version should be louder-matched to dry
- [ ] Test with at least 3 different source recordings per preset
- [ ] Save both .cst AND .patch after final tweaks
