# MPD-MASTER-BUS — Stereo Bus Master

**Target:** Final master bus — stereo bus processing, loudness, and limiting

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Linear Phase EQ | Phase-coherent master EQ |
| 2 | Compressor (VCA) | Gentle bus glue |
| 3 | Adaptive Limiter | Loudness push |
| 4 | Direction Mixer | Mono-safe stereo width |
| 5 | Limiter | Safety ceiling |
| 6 | Gain | Output trim |

---

## Plugin Settings

### Linear Phase EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| Low Shelf Frequency | 80 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±4 dB |
| High Shelf Frequency | 10 kHz | |
| High Shelf Gain | 0 dB | Macro: ±4 dB |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | Transparent for mastering |
| Ratio | 2:1 | Gentle glue |
| Attack | 10 ms | Fixed |
| Release | 100 ms | Fixed |
| Knee | 1.0 | Soft knee |
| Mix | 0% | Macro: 0–50% (GLUE knob) |
| Input Gain | 0 dB | Macro: 0 to +8 dB |

### Adaptive Limiter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Gain | 0 dB | Macro: 0 to +10 dB (LOUD knob) |
| Output Ceiling | -1 dBTP | Fixed |
| Lookahead | On | |
| Mode | OptimFull | |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.8 → 1.3 |
| | | Narrow range — mastering width must be subtle |

### Limiter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Output Level | -1 dBTP | Macro: -3 to 0 dB (CEILING knob) |
| Release | 20 ms | Fixed |
| Lookahead | On | |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | INPUT | Compressor > Input Gain | 0 dB | +8 dB | 0 dB |
| 2 | LOW | Linear Phase EQ > Low Shelf Gain (80 Hz) | -4 dB | +4 dB | 0 dB |
| 3 | HIGH | Linear Phase EQ > High Shelf Gain (10 kHz) | -4 dB | +4 dB | 0 dB |
| 4 | GLUE | Compressor > Mix | 0% | 50% | 0% |
| 5 | LOUD | Adaptive Limiter > Gain | 0 dB | +10 dB | 0 dB |
| 6 | WIDTH | Direction Mixer > Spread | 0.8 | 1.3 | 1.0 |
| 7 | CEILING | Limiter > Output Level | -3 dB | 0 dB | -1 dBTP |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Signal flow:** Adaptive Limiter pushes loudness (LOUD), Limiter provides hard safety ceiling (CEILING). Direction Mixer placed after Adaptive Limiter so limiting is applied before width changes. WIDTH range intentionally narrow (0.8–1.3) — mastering-stage width adjustments should be subtle.
