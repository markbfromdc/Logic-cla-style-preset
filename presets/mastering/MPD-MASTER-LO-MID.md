# MPD-MASTER-LO-MID — Per-Band Mastering: Low-Mid (80–500 Hz)

**Target:** Mastering-stage low-mid processing — transparent dynamics and tonal control

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Linear Phase EQ | Phase-coherent low-mid EQ |
| 2 | Enveloper | Fixed transient shaping |
| 3 | Compressor (VCA) | Transparent low-mid dynamics |
| 4 | Exciter | Subtle harmonic warmth |
| 5 | Direction Mixer | Mono-safe stereo width |
| 6 | Gain | Output trim |

---

## Plugin Settings

### Linear Phase EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 60 Hz | |
| HPF Slope | 18 dB/oct | |
| Low Shelf Frequency | 100 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±4 dB |
| Parametric Frequency | 250 Hz | Fixed — body focus center |
| Parametric Gain | 0 dB | Macro: ±3 dB (FOCUS knob) |
| Parametric Q | 0.7 | |
| High Shelf Frequency | 500 Hz | |
| High Shelf Gain | 0 dB | Macro: ±4 dB |
| LPF Frequency | 2 kHz | Fixed |
| LPF Slope | 6 dB/oct | |

### Enveloper

| Parameter | Value | Notes |
|-----------|-------|-------|
| Attack Gain | +6 dB | Fixed |
| Attack Time | 20 ms | |
| Release Gain | 0 dB | |
| Output Level | -3 dB | |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | Transparent for mastering |
| Ratio | 2.5:1 | |
| Attack | 15 ms | Fixed |
| Release | 150 ms | Fixed |
| Knee | 0.8 | |
| Mix | 0% | Macro: 0–60% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +8 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 150 Hz | |
| Amount 1 | 3% | Subtler than mixing preset |
| Frequency 2 | 400 Hz | |
| Amount 2 | 4% | |
| Mix | 15% | Macro: 0–30% (COLOR knob) |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.5 (narrow) → 1.3 (slightly wide) |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +8 dB | 0 dB |
| 2 | BASS | Linear Phase EQ > Low Shelf Gain | -4 dB | +4 dB | 0 dB |
| 3 | TREBLE | Linear Phase EQ > High Shelf Gain | -4 dB | +4 dB | 0 dB |
| 4 | DYNAMICS | Compressor > Mix | 0% | 60% | 0% |
| 5 | COLOR | Exciter > Mix | 0% | 30% | 15% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 1.3 (wide) | 1.0 |
| 7 | FOCUS | Linear Phase EQ > Parametric Gain (250 Hz) | -3 dB | +3 dB | 0 dB |
| 8 | OUTPUT | Gain > Gain | -8 dB | +4 dB | 0 dB |

**Mastering differences from mixing preset:** Linear Phase EQ, VCA compressor, reduced ranges, FOCUS at 250 Hz replaces SPACE.
