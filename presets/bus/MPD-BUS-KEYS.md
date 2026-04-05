# MPD-BUS-KEYS — Keys Bus Channel Strip

**Target:** Summed keys bus — piano, organ, synths, pads, electric piano

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Keys bus tone shaping |
| 2 | Enveloper | Transient shaping |
| 3 | Compressor (Opto) | Smooth keys leveling |
| 4 | Exciter | Harmonic warmth |
| 5 | ChromaVerb (Hall) | Keys depth |
| 6 | Direction Mixer | Mono-safe stereo width |
| 7 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 80 Hz | Fixed — clean below keys range |
| HPF Slope | 12 dB/oct | |
| Low Shelf Frequency | 150 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Cut Frequency | 500 Hz | Fixed — reduce muddiness |
| Mid Cut Gain | -1 dB | |
| Mid Cut Q | 1.5 | |
| High Shelf Frequency | 5 kHz | |
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
| Circuit | Opto | Smooth, musical for sustained keys |
| Ratio | 3:1 | |
| Attack | 10 ms | Fixed |
| Release | 120 ms | Fixed |
| Knee | 0.8 | |
| Mix | 0% | Macro: 0–100% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +12 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 500 Hz | Body warmth |
| Amount 1 | 3% | |
| Frequency 2 | 3 kHz | Clarity |
| Amount 2 | 5% | |
| Harmonics | Odd + Even | |
| Mix | 15% | Macro: 0–50% (COLOR knob) |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Hall | Depth for keys |
| Decay | 1.5 s | |
| Pre-delay | 30 ms | |
| High Cut | 10 kHz | |
| Low Cut | 150 Hz | |
| Width | 100% | |
| Mix | 0% | Macro: 0–50% |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.5 (narrow) → 2.0 (wide) |
| | | Mid-side processing — mono-safe |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +12 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | DYNAMICS | Compressor > Mix | 0% | 100% | 0% |
| 5 | COLOR | Exciter > Mix | 0% | 50% | 15% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 50% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**DYNAMICS behavior:** At 0%, dry signal with Enveloper transient boost (expansion feel). At 100%, full Opto leveling.
