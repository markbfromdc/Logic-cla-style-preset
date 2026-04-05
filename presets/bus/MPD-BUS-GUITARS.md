# MPD-BUS-GUITARS — Guitar Bus Channel Strip

**Target:** Summed guitar bus — electric clean, electric driven, acoustic, nylon

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Guitar bus tone shaping |
| 2 | Enveloper | Transient shaping |
| 3 | Compressor (VCA) | Transparent guitar glue |
| 4 | Exciter | Harmonic presence |
| 5 | ChromaVerb (Plate) | Guitar space |
| 6 | Direction Mixer | Mono-safe stereo width |
| 7 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 80 Hz | Clean low-end below guitar range |
| HPF Slope | 18 dB/oct | |
| Low Shelf Frequency | 200 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Cut Frequency | 400 Hz | Fixed — reduce boxiness |
| Mid Cut Gain | -1.5 dB | |
| Mid Cut Q | 1.5 | |
| Presence Frequency | 3 kHz | Fixed — pick attack clarity |
| Presence Gain | +1 dB | |
| Presence Q | 1.0 | |
| High Shelf Frequency | 4 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |

### Enveloper

| Parameter | Value | Notes |
|-----------|-------|-------|
| Attack Gain | +6 dB | Fixed — transient emphasis |
| Attack Time | 20 ms | |
| Release Gain | 0 dB | |
| Output Level | -3 dB | |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | Transparent for guitar variety |
| Ratio | 3:1 | |
| Attack | 5 ms | Fixed |
| Release | 80 ms | Fixed |
| Knee | 0.5 | |
| Mix | 0% | Macro: 0–100% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +15 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 1 kHz | Body presence |
| Amount 1 | 4% | |
| Frequency 2 | 4 kHz | Pick attack |
| Amount 2 | 6% | |
| Harmonics | Odd + Even | |
| Mix | 15% | Macro: 0–50% (COLOR knob) |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Plate | |
| Decay | 1.0 s | |
| Pre-delay | 25 ms | |
| High Cut | 8 kHz | |
| Low Cut | 200 Hz | |
| Width | 100% | |
| Mix | 0% | Macro: 0–40% |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.5 (narrow) → 2.0 (wide) |
| | | Mid-side processing — mono-safe |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +15 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | DYNAMICS | Compressor > Mix | 0% | 100% | 0% |
| 5 | COLOR | Exciter > Mix | 0% | 50% | 15% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 40% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**DYNAMICS behavior:** At 0%, dry signal with Enveloper transient boost (expansion feel). At 100%, full VCA glue compression.
