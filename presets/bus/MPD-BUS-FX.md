# MPD-BUS-FX — FX Bus Channel Strip

**Target:** Summed FX/SFX bus — risers, impacts, foley, sound design, effects returns

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | FX bus tone shaping |
| 2 | Compressor (VCA) | FX bus leveling |
| 3 | Exciter | Harmonic enhancement |
| 4 | ChromaVerb (Hall) | FX depth |
| 5 | Direction Mixer | Mono-safe stereo width |
| 6 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 60 Hz | Clean sub rumble |
| HPF Slope | 18 dB/oct | |
| Low Shelf Frequency | 200 Hz | |
| Low Shelf Gain | 0 dB | Macro: -8 to +4 dB (skewed toward cut) |
| High Shelf Frequency | 6 kHz | |
| High Shelf Gain | 0 dB | Macro: -4 to +8 dB (skewed toward boost) |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | Transparent for varied FX content |
| Ratio | 3:1 | |
| Attack | 5 ms | Fixed |
| Release | 80 ms | Fixed |
| Knee | 0.5 | |
| Mix | 0% | Macro: 0–100% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +15 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 1 kHz | |
| Amount 1 | 5% | |
| Frequency 2 | 5 kHz | |
| Amount 2 | 8% | |
| Harmonics | Odd + Even | |
| Mix | 15% | Macro: 0–60% (COLOR knob) |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Hall | |
| Decay | 2.0 s | Longer for FX depth |
| Pre-delay | 30 ms | |
| High Cut | 12 kHz | |
| Low Cut | 100 Hz | |
| Width | 100% | |
| Mix | 0% | Macro: 0–60% |

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
| 2 | BASS | Channel EQ > Low Shelf Gain | -8 dB | +4 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -4 dB | +8 dB | 0 dB |
| 4 | DYNAMICS | Compressor > Mix | 0% | 100% | 0% |
| 5 | COLOR | Exciter > Mix | 0% | 60% | 15% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 60% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** No Enveloper — FX sources are too varied for fixed transient shaping. BASS range skewed toward cut (-8/+4 dB) for low-end cleanup. TREBLE range skewed toward boost (-4/+8 dB) for added clarity. Higher COLOR and SPACE maximums allow more dramatic processing.
