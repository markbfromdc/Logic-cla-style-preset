# MPD-MASTER-SUB — Per-Band Mastering: Sub (20–80 Hz)

**Target:** Mastering-stage sub-bass processing — transparent dynamics and tonal control

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Linear Phase EQ | Phase-coherent sub EQ |
| 2 | Enveloper | Fixed transient shaping |
| 3 | Compressor (VCA) | Transparent sub dynamics |
| 4 | Pedalboard (Dist) | Subtle harmonic saturation |
| 5 | Direction Mixer | Mono-safe stereo width |
| 6 | Gain | Output trim |

---

## Plugin Settings

### Linear Phase EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF | Off | Preserve all sub content |
| Low Shelf Frequency | 40 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±4 dB |
| Parametric Frequency | 50 Hz | Fixed — sub focus center |
| Parametric Gain | 0 dB | Macro: ±3 dB (FOCUS knob) |
| Parametric Q | 0.7 | |
| High Shelf Frequency | 100 Hz | |
| High Shelf Gain | 0 dB | Macro: ±4 dB |
| LPF Frequency | 250 Hz | Fixed |
| LPF Slope | 12 dB/oct | |

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
| Ratio | 3:1 | |
| Attack | 30 ms | Fixed |
| Release | 200 ms | Fixed |
| Knee | 0.8 | |
| Mix | 0% | Macro: 0–60% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +8 dB |

### Pedalboard

| Parameter | Value | Notes |
|-----------|-------|-------|
| Pedal | Hi-Drive | |
| Drive | 8% | Fixed — subtler than mixing preset |
| Tone | 30% | |
| Mix | 10% | Macro: 0–30% (COLOR knob) |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.0 (mono) → 1.2 (slightly wide) |
| | | Narrow range for mastering |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +8 dB | 0 dB |
| 2 | BASS | Linear Phase EQ > Low Shelf Gain | -4 dB | +4 dB | 0 dB |
| 3 | TREBLE | Linear Phase EQ > High Shelf Gain | -4 dB | +4 dB | 0 dB |
| 4 | DYNAMICS | Compressor > Mix | 0% | 60% | 0% |
| 5 | COLOR | Pedalboard > Mix | 0% | 30% | 10% |
| 6 | WIDTH | Direction Mixer > Spread | 0.0 (mono) | 1.2 (wide) | 1.0 |
| 7 | FOCUS | Linear Phase EQ > Parametric Gain (50 Hz) | -3 dB | +3 dB | 0 dB |
| 8 | OUTPUT | Gain > Gain | -8 dB | +4 dB | 0 dB |

**Mastering differences from mixing preset:** Linear Phase EQ (phase-coherent), VCA compressor (transparent), reduced ranges on all knobs, FOCUS knob replaces SPACE (no reverb at mastering stage).
