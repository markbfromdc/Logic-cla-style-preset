# MPD-BUS-VOCALS — Vocal Bus Channel Strip

**Target:** Summed vocal bus — lead vocals, background vocals, harmonies, ad-libs

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Vocal bus tone shaping |
| 2 | DeEsser 2 | Bus-level sibilance control |
| 3 | Enveloper | Transient shaping |
| 4 | Compressor (FET) | Vocal bus glue |
| 5 | Exciter | Vocal presence |
| 6 | ChromaVerb (Plate) | Vocal space |
| 7 | Direction Mixer | Mono-safe stereo width |
| 8 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 100 Hz | Fixed — clean below vocal range |
| HPF Slope | 18 dB/oct | |
| Low Shelf Frequency | 200 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Cut Frequency | 500 Hz | Fixed — reduce muddiness |
| Mid Cut Gain | -1 dB | |
| Mid Cut Q | 1.5 | |
| Presence Frequency | 3 kHz | Fixed — vocal clarity |
| Presence Gain | +1 dB | |
| Presence Q | 0.8 | |
| High Shelf Frequency | 8 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |

### DeEsser 2

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency | 5 kHz | Bus-level sibilance |
| Sensitivity | -26 dB | |
| Mode | Relative | |
| | | Always on, not macro'd |

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
| Circuit | FET | Vocal character and presence |
| Ratio | 4:1 | |
| Attack | 3 ms | Fixed |
| Release | 60 ms | Fixed |
| Knee | 0.5 | |
| Mix | 0% | Macro: 0–100% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +18 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 2 kHz | Vocal body |
| Amount 1 | 5% | |
| Frequency 2 | 6 kHz | Air/presence |
| Amount 2 | 7% | |
| Harmonics | Odd + Even | |
| Mix | 20% | Macro: 0–50% (COLOR knob) |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Plate | Classic vocal reverb |
| Decay | 1.2 s | |
| Pre-delay | 40 ms | |
| High Cut | 10 kHz | |
| Low Cut | 300 Hz | |
| Width | 100% | |
| Mix | 0% | Macro: 0–45% |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.5 (narrow) → 1.5 (wide) |
| | | Range limited — vocals should stay focused |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +18 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | DYNAMICS | Compressor > Mix | 0% | 100% | 0% |
| 5 | COLOR | Exciter > Mix | 0% | 50% | 20% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 1.5 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 45% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**DYNAMICS behavior:** At 0%, dry signal with Enveloper transient boost (expansion feel). At 100%, full FET vocal compression. WIDTH intentionally limited to 1.5 max — vocals should stay centered and focused.
