# MPD-MASTER-AIR — Per-Band Mastering: Air (8–20 kHz)

**Target:** Mastering-stage air/shimmer processing — transparent dynamics and tonal control

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Linear Phase EQ | Phase-coherent air EQ |
| 2 | Enveloper | Fixed transient shaping |
| 3 | Compressor (VCA) | Transparent air dynamics |
| 4 | Exciter | Subtle shimmer enhancement |
| 5 | Direction Mixer | Mono-safe stereo width |
| 6 | Gain | Output trim |

---

## Plugin Settings

### Linear Phase EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 6 kHz | |
| HPF Slope | 12 dB/oct | |
| Low Shelf Frequency | 8 kHz | |
| Low Shelf Gain | 0 dB | Macro: ±4 dB |
| Parametric Frequency | 12 kHz | Fixed — air focus center |
| Parametric Gain | 0 dB | Macro: ±3 dB (FOCUS knob) |
| Parametric Q | 0.7 | |
| High Shelf Frequency | 14 kHz | |
| High Shelf Gain | 0 dB | Macro: ±4 dB |
| LPF | Off | Preserve all ultra-high content |

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
| Ratio | 2:1 | |
| Attack | 1 ms | Fixed |
| Release | 40 ms | Fixed |
| Knee | 0.8 | |
| Mix | 0% | Macro: 0–60% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +8 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 8 kHz | |
| Amount 1 | 3% | Subtler than mixing preset |
| Frequency 2 | 14 kHz | |
| Amount 2 | 5% | |
| Harmonics | Odd + Even | |
| Mix | 15% | Macro: 0–30% (COLOR knob) |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.5 (narrow) → 1.5 (wide) |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +8 dB | 0 dB |
| 2 | BASS | Linear Phase EQ > Low Shelf Gain | -4 dB | +4 dB | 0 dB |
| 3 | TREBLE | Linear Phase EQ > High Shelf Gain | -4 dB | +4 dB | 0 dB |
| 4 | DYNAMICS | Compressor > Mix | 0% | 60% | 0% |
| 5 | COLOR | Exciter > Mix | 0% | 30% | 15% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 1.5 (wide) | 1.0 |
| 7 | FOCUS | Linear Phase EQ > Parametric Gain (12 kHz) | -3 dB | +3 dB | 0 dB |
| 8 | OUTPUT | Gain > Gain | -8 dB | +4 dB | 0 dB |

**Mastering differences from mixing preset:** Linear Phase EQ, VCA compressor (same circuit but reduced ranges), FOCUS at 12 kHz replaces SPACE, no DeEsser.
