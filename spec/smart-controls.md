# Smart Control Parameter Mapping Specification

**Version:** 2.0
**Last Updated:** 2026-03-31
**Applies to:** All MPD-CLA presets

---

## How Smart Control Mapping Works in Logic Pro

Each Smart Control knob represents a normalized value from **0.0 to 1.0** internally. When a mapping is created, Logic linearly interpolates between the Min and Max values based on knob position:

```
Parameter Value = Min + (Knob Position × (Max - Min))
```

**Example:** DRIVE on MPD-CLA-HI-MID maps to Compressor > Input Gain with Min = 0 dB, Max = +18 dB.

```
Knob at 0.0 (full left):   0 + (0.0 × 18) =  0 dB
Knob at 0.25:              0 + (0.25 × 18) =  4.5 dB
Knob at 0.5 (center):      0 + (0.5 × 18) =  9 dB
Knob at 0.75:              0 + (0.75 × 18) = 13.5 dB
Knob at 1.0 (full right):  0 + (1.0 × 18) = 18 dB
```

Logic uses **linear interpolation** for all parameter types (dB, percentage, milliseconds). There is no curve or logarithmic scaling applied by the Smart Control system itself — any perceived curve comes from the plugin parameter's own response.

---

## Single-Parameter Knobs (1–4, 7–8)

### Knob 1: DRIVE

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| SUB | Compressor > Input Gain | 0 dB | +12 dB | 0.0 (left) |
| LO-MID | Compressor > Input Gain | 0 dB | +15 dB | 0.0 (left) |
| HI-MID | Compressor > Input Gain | 0 dB | +18 dB | 0.0 (left) |
| HIGH | Compressor > Input Gain | 0 dB | +15 dB | 0.0 (left) |
| AIR | Compressor > Input Gain | 0 dB | +10 dB | 0.0 (left) |

**Note:** Default is full left (0 dB = no added gain). Max varies by preset — AIR has the lowest max (+10 dB) to prevent over-driving delicate high-frequency content.

### Knob 2: BASS

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| All | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0.5 (center) |

**Note:** Center position = 0 dB (no boost or cut). The shelf frequency varies per preset but the control range is always ±6 dB.

| Preset | Shelf Frequency |
|--------|----------------|
| SUB | 40 Hz |
| LO-MID | 100 Hz |
| HI-MID | 500 Hz |
| HIGH | 2 kHz |
| AIR | 8 kHz |

### Knob 3: TREBLE

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| All | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0.5 (center) |

**Note:** Center position = 0 dB. Shelf frequency varies per preset.

| Preset | Shelf Frequency |
|--------|----------------|
| SUB | 100 Hz |
| LO-MID | 500 Hz |
| HI-MID | 2 kHz |
| HIGH | 8 kHz |
| AIR | 14 kHz |

### Knob 4: COMPRESS

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| All | Compressor > Mix | 0% | 100% | 0.0 (left) |

**Note:** Default is full left (0% mix = dry signal only, compression bypassed). This is the parallel compression blend control — the core of the CLA approach.

### Knob 7: SPACE

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| SUB | ChromaVerb > Mix | 0% | 20% | 0.0 (left) |
| LO-MID | ChromaVerb > Mix | 0% | 30% | 0.0 (left) |
| HI-MID | ChromaVerb > Mix | 0% | 40% | 0.0 (left) |
| HIGH | ChromaVerb > Mix | 0% | 45% | 0.0 (left) |
| AIR | ChromaVerb > Mix | 0% | 50% | 0.0 (left) |

**Note:** Max reverb mix increases with frequency band. Sub content needs minimal reverb (max 20%) to avoid mud. Air content can tolerate more reverb (max 50%) as shimmer tails are desirable.

### Knob 8: OUTPUT

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| All | Gain > Gain | -12 dB | +6 dB | 0.67 (≈ 0 dB) |

**Note:** Default position is NOT center. Since the range is -12 to +6 (18 dB range), 0 dB falls at position (0 - (-12)) / (6 - (-12)) = 12/18 = 0.67. This means the knob sits at roughly the 2 o'clock position by default.

---

## Dual-Parameter Knob: DYNAMICS (Knob 5)

The DYNAMICS knob has **two mappings** on a single knob. Both parameters respond to the same knob position simultaneously.

### Mapping 1: Compressor > Attack

| Preset | Min (Knob Left = Punch) | Max (Knob Right = Sustain) |
|--------|------------------------|---------------------------|
| SUB | 1 ms | 80 ms |
| LO-MID | 0.5 ms | 60 ms |
| HI-MID | 0.2 ms | 40 ms |
| HIGH | 0.1 ms | 30 ms |
| AIR | 0.1 ms | 20 ms |

### Mapping 2: Compressor > Release

| Preset | Min (Knob Left = Punch) | Max (Knob Right = Sustain) |
|--------|------------------------|---------------------------|
| SUB | 40 ms | 500 ms |
| LO-MID | 30 ms | 400 ms |
| HI-MID | 20 ms | 300 ms |
| HIGH | 15 ms | 250 ms |
| AIR | 10 ms | 200 ms |

### Default (Center) Positions

When the DYNAMICS knob is at center (0.5), both parameters land at their midpoint:

| Preset | Attack at Center | Release at Center | Matches Preset Default? |
|--------|-----------------|-------------------|------------------------|
| SUB | 40.5 ms | 270 ms | Close to 30 ms / 200 ms (slight offset) |
| LO-MID | 30.25 ms | 215 ms | Close to 15 ms / 150 ms (offset) |
| HI-MID | 20.1 ms | 160 ms | Close to 5 ms / 80 ms (offset) |
| HIGH | 15.05 ms | 132.5 ms | Close to 2 ms / 60 ms (offset) |
| AIR | 10.05 ms | 105 ms | Close to 1 ms / 40 ms (offset) |

**Implementation note:** The preset's "default" attack/release values (listed in the preset specs) represent the plugin's initial setting. When the DYNAMICS knob is at center, the interpolated values will differ from these defaults because center = midpoint of min/max range, which won't always equal the preset's home values. This is acceptable — the center position represents a balanced starting point, not an exact match to the fixed defaults.

### DYNAMICS Scaling Pattern

Attack and release ranges get **faster** (smaller values) as frequency increases:

```
SUB:     Attack 1–80 ms,   Release 40–500 ms    (slowest range)
LO-MID:  Attack 0.5–60 ms, Release 30–400 ms
HI-MID:  Attack 0.2–40 ms, Release 20–300 ms
HIGH:    Attack 0.1–30 ms, Release 15–250 ms
AIR:     Attack 0.1–20 ms, Release 10–200 ms    (fastest range)
```

**Rationale:** Higher-frequency content has shorter wavelengths and faster transients. Compression needs to react faster to control this content effectively. The DYNAMICS knob's range is tuned so that "Punch" and "Sustain" feel appropriate for each frequency domain.

### How to Create Dual Mapping in Logic Pro

1. Open Smart Controls (B key) → Edit Mode
2. Click the DYNAMICS knob
3. In Parameter Mapping, click **Add Mapping**
4. Navigate to Compressor > Attack
5. Set Min (punch value) and Max (sustain value) from the tables above
6. Click **Add Mapping** again (second mapping on same knob)
7. Navigate to Compressor > Release
8. Set Min (punch value) and Max (sustain value)
9. Both mappings now appear under the single DYNAMICS knob

---

## Single-Parameter Knob: WIDTH (Knob 6)

### Direction Mixer Spread Mapping

| Preset | Min (Knob Left = Narrow) | Max (Knob Right = Wide) | Default Position |
|--------|-------------------------|------------------------|-----------------|
| SUB | 0.0 (mono) | 1.5 | 0.67 (Spread = 1.0) |
| LO-MID | 0.5 | 1.5 | 0.5 (Spread = 1.0) |
| HI-MID | 0.5 | 2.0 | 0.33 (Spread = 1.0) |
| HIGH | 0.5 | 2.0 | 0.33 (Spread = 1.0) |
| AIR | 0.5 | 2.0 | 0.33 (Spread = 1.0) |

**Note:** Default position varies per preset because the min/max range differs. The default always targets Spread = 1.0 (unity stereo).

### Direction Mixer Spread Values Explained

```
Spread = 0.0:  Mono (L+R summed to center)
Spread = 0.5:  Narrowed stereo (50% of original width)
Spread = 1.0:  Unity stereo (no change from original)
Spread = 1.5:  Widened stereo (50% wider than original)
Spread = 2.0:  Maximum widening (sides boosted, mid reduced)
```

### Mono Safety Guarantee

Direction Mixer uses **mid-side (M/S) processing**:

```
Mid signal  = (L + R) / 2    (center content)
Side signal = (L - R) / 2    (stereo content)

Spread < 1.0:  Boosts Mid, reduces Side → narrows image
Spread = 1.0:  Mid and Side at unity → no change
Spread > 1.0:  Reduces Mid, boosts Side → widens image
```

When a widened signal is summed to mono (L + R), only the Mid component survives. The Side component cancels perfectly (by definition: L-R + R-L = 0). This means:

- **No phase cancellation on mono fold-down** — only side content is lost, center content is preserved
- **No comb filtering** — unlike delay-based or frequency-dependent widening techniques
- **Correlation stays positive** — even at maximum width (Spread 2.0), the signal never goes anti-phase

This is why Direction Mixer was chosen over Stereo Spread (which uses frequency-dependent phase shifts) or chorus-based widening (which adds modulated delays).

---

## Parameter Interaction Matrix

Some knob combinations interact in non-obvious ways:

| Knob A | Knob B | Interaction |
|--------|--------|-------------|
| COMPRESS (0%) | DRIVE | No effect — dry signal bypasses compressor |
| COMPRESS (0%) | DYNAMICS | No effect — compression is not in the signal path |
| DRIVE (max) | COMPRESS (100%) | Maximum compression — check for digital overs |
| SPACE (max) | WIDTH (max) | Reverb tail is widened — most spatial extreme |
| BASS (max) | DRIVE (max) | Boosted low shelf feeds more energy into compressor — can cause pumping on sub/lo-mid presets |
| TREBLE (max) | SPACE (max) | Boosted highs feed into reverb — can create excessive shimmer on HIGH/AIR presets |

### Edge Cases to Verify

| Scenario | Expected Behavior |
|----------|-------------------|
| All knobs at minimum | Near-silent output (OUTPUT at -12 dB, all effects off) |
| All knobs at maximum | Heavily processed, loud — but should NOT digitally clip |
| COMPRESS 0% + DYNAMICS any position | Identical sound regardless of DYNAMICS position |
| WIDTH at minimum + SPACE at max | Mono reverb — reverb tail should still sound good in mono |
| DRIVE max + COMPRESS 100% + DYNAMICS full left | Most aggressive compression possible — should be usable, not destroyed |

---

## Save Behavior

### Channel Strip Setting (.cst)

Saves:
- Plugin chain (insert order)
- All plugin parameter values
- Does NOT save Smart Control mappings

### Patch (.patch)

Saves:
- Everything in .cst
- Smart Control knob layout
- All parameter mappings (including dual-parameter DYNAMICS mapping)
- Knob labels
- Min/Max ranges

**Critical:** Always save both. The .cst is useful for loading just the plugin chain. The .patch is required for the full Smart Control experience.

---

## Traceability

| This Spec Section | Source Document |
|--------------------|----------------|
| Knob ranges per preset | [presets/](../presets/) — Smart Control Mapping tables |
| DYNAMICS ranges | [CLA-Logic-Channel-Strip-Roadmap.md](../CLA-Logic-Channel-Strip-Roadmap.md) — Smart Control Ranges tables |
| Dual-parameter setup | [BUILD-GUIDE.md](../BUILD-GUIDE.md) — Knob 5: DYNAMICS section |
| Direction Mixer behavior | [BUILD-GUIDE.md](../BUILD-GUIDE.md) — Knob 6: WIDTH section |
| Edge case testing | [TESTING-CHECKLIST.md](../TESTING-CHECKLIST.md) — Dynamics Section Tests |
