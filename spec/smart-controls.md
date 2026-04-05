# Smart Control Parameter Mapping Specification

**Version:** 3.0
**Last Updated:** 2026-04-05
**Applies to:** All MPD-CLA presets (channel, bus, FX send, mastering)

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

## Knob 1: DRIVE

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| SUB | Compressor > Input Gain | 0 dB | +12 dB | 0.0 (left) |
| LO-MID | Compressor > Input Gain | 0 dB | +15 dB | 0.0 (left) |
| HI-MID | Compressor > Input Gain | 0 dB | +18 dB | 0.0 (left) |
| HIGH | Compressor > Input Gain | 0 dB | +15 dB | 0.0 (left) |
| AIR | Compressor > Input Gain | 0 dB | +10 dB | 0.0 (left) |

**Note:** Default is full left (0 dB = no added gain). Max varies by preset — AIR has the lowest max (+10 dB) to prevent over-driving delicate high-frequency content.

## Knob 2: BASS

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| All | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0.5 (center) |

**Note:** Center position = 0 dB (no boost or cut). The shelf frequency varies per preset but the control range is always +/-6 dB.

| Preset | Shelf Frequency |
|--------|----------------|
| SUB | 40 Hz |
| LO-MID | 100 Hz |
| HI-MID | 500 Hz |
| HIGH | 2 kHz |
| AIR | 8 kHz |

## Knob 3: TREBLE

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

## Knob 4: DYNAMICS

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| All | Compressor > Mix | 0% | 100% | 0.0 (left) |

**Semantic range:**

- **0% (full left) = Expanded** — Enveloper transient boost is at maximum effect; compressor mix is fully dry, preserving natural dynamics and punch.
- **100% (full right) = Compressed** — Compressor mix is fully wet; the signal is at maximum parallel compression.

**Note:** The underlying parameter is the same as the former COMPRESS knob (Compressor > Mix, 0-100%), but the semantic label now reflects the full dynamics spectrum from expanded to compressed.

## Knob 5: COLOR

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| SUB | Pedalboard > Mix | 0% | 40% | 0.5 (20%) |
| LO-MID | Exciter > Mix | 0% | 40% | 0.5 (20%) |
| HI-MID | Exciter > Mix | 0% | 50% | 0.5 (25%) |
| HIGH | Exciter > Mix | 0% | 50% | 0.5 (25%) |
| AIR | Exciter > Mix | 0% | 60% | 0.5 (30%) |

**Note:** COLOR adds harmonic saturation and character. SUB uses Pedalboard for sub-harmonic generation, while the upper bands use Exciter for harmonic enhancement. Max range increases with frequency — higher bands tolerate more coloration. Default is center (moderate color applied).

## Knob 6: WIDTH

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

## Knob 7: SPACE

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| SUB | ChromaVerb > Mix | 0% | 20% | 0.0 (left) |
| LO-MID | ChromaVerb > Mix | 0% | 30% | 0.0 (left) |
| HI-MID | ChromaVerb > Mix | 0% | 40% | 0.0 (left) |
| HIGH | ChromaVerb > Mix | 0% | 45% | 0.0 (left) |
| AIR | ChromaVerb > Mix | 0% | 50% | 0.0 (left) |

**Note:** Max reverb mix increases with frequency band. Sub content needs minimal reverb (max 20%) to avoid mud. Air content can tolerate more reverb (max 50%) as shimmer tails are desirable.

## Knob 8: OUTPUT

| Preset | Plugin > Parameter | Min | Max | Default Position |
|--------|--------------------|-----|-----|-----------------|
| All | Gain > Gain | -12 dB | +6 dB | 0.67 (approx 0 dB) |

**Note:** Default position is NOT center. Since the range is -12 to +6 (18 dB range), 0 dB falls at position (0 - (-12)) / (6 - (-12)) = 12/18 = 0.67. This means the knob sits at roughly the 2 o'clock position by default.

---

## Bus Preset Knob Layout

Bus presets follow the same 8-knob layout as channel presets with adjustments for group processing context. Knob functions remain consistent (DRIVE, BASS, TREBLE, DYNAMICS, COLOR, WIDTH, SPACE, OUTPUT) but parameter ranges are scaled for bus-level signals. See individual bus preset files in [presets/bus/](../presets/bus/) for specific ranges and plugin mappings.

## FX Send Preset Knob Layout

FX send presets use a simplified knob layout focused on effect character and mix. Not all 8 knobs are active — unused knobs are unmapped. The primary controls are SPACE (reverb/delay mix and character), COLOR (effect saturation), and OUTPUT (return level). See individual FX send preset files in [presets/fx-send/](../presets/fx-send/) for specific mappings.

## Mastering Preset Knob Layout

Mastering presets use all 8 knobs with tighter parameter ranges appropriate for mastering context. DRIVE ranges are reduced (max +6 dB), DYNAMICS defaults to center rather than full left, and WIDTH is constrained to avoid over-widening the master bus. See the mastering preset file in [presets/mastering/](../presets/mastering/) for specific ranges and plugin mappings.

---

## Parameter Interaction Matrix

Some knob combinations interact in non-obvious ways:

| Knob A | Knob B | Interaction |
|--------|--------|-------------|
| DYNAMICS (0%) | DRIVE | No effect — dry signal bypasses compressor |
| DRIVE (max) | DYNAMICS (100%) | Maximum compression — check for digital overs |
| SPACE (max) | WIDTH (max) | Reverb tail is widened — most spatial extreme |
| BASS (max) | DRIVE (max) | Boosted low shelf feeds more energy into compressor — can cause pumping on sub/lo-mid presets |
| TREBLE (max) | SPACE (max) | Boosted highs feed into reverb — can create excessive shimmer on HIGH/AIR presets |
| COLOR (max) | DYNAMICS (100%) | Saturation into heavy compression — watch for cumulative distortion |

### Edge Cases to Verify

| Scenario | Expected Behavior |
|----------|-------------------|
| All knobs at minimum | Near-silent output (OUTPUT at -12 dB, all effects off) |
| All knobs at maximum | Heavily processed, loud — but should NOT digitally clip |
| WIDTH at minimum + SPACE at max | Mono reverb — reverb tail should still sound good in mono |
| DRIVE max + DYNAMICS 100% | Most aggressive compression possible — should be usable, not destroyed |
| COLOR max + DYNAMICS 0% | Maximum saturation with expanded dynamics — should sound punchy, not distorted |

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
- All parameter mappings
- Knob labels
- Min/Max ranges

**Critical:** Always save both. The .cst is useful for loading just the plugin chain. The .patch is required for the full Smart Control experience.

---

## Traceability

| This Spec Section | Source Document |
|--------------------|----------------|
| Knob ranges per preset | [presets/](../presets/) — Smart Control Mapping tables |
| DYNAMICS semantic range | [CLA-Logic-Channel-Strip-Roadmap.md](../CLA-Logic-Channel-Strip-Roadmap.md) — Smart Control Ranges tables |
| COLOR knob mapping | [presets/](../presets/) — COLOR section in individual preset specs |
| Direction Mixer behavior | [BUILD-GUIDE.md](../BUILD-GUIDE.md) — Knob 6: WIDTH section |
| Edge case testing | [TESTING-CHECKLIST.md](../TESTING-CHECKLIST.md) — Dynamics Section Tests |
| Bus/FX/Mastering layouts | Individual preset files in [presets/](../presets/) subdirectories |
