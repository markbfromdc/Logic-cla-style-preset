# MPD-CLA-AIR — Air Channel Strip (8–20 kHz)

**Target:** Air/ultra-high content — vocal breath, cymbal shimmer, acoustic sparkle, synth air, string harmonics

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Air focus + cleanup |
| 2 | DeEsser 2 | Ultra-high harshness control |
| 3 | Enveloper | Fixed transient shaping (expansion feel at low DYNAMICS) |
| 4 | Compressor (VCA) | Delicate air dynamics |
| 5 | Exciter | Shimmer/sparkle enhancement |
| 6 | ChromaVerb (Plate) | Airy plate shimmer |
| 7 | Direction Mixer | Mono-safe stereo width |
| 8 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 6 kHz | |
| HPF Slope | 12 dB/oct | |
| Low Shelf Frequency | 8 kHz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Presence Frequency | 10 kHz | Fixed — air center |
| Presence Gain | +1.5 dB | |
| Presence Q | 0.7 | |
| High Shelf Frequency | 14 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |
| LPF | Off | Preserve all ultra-high content |

### DeEsser 2

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency | 10 kHz | |
| Sensitivity | -25 dB | |
| Mode | Relative | |
| | | Always on — tames digital harshness |

### Enveloper

| Parameter | Value | Notes |
|-----------|-------|-------|
| Attack Gain | +6 dB | Fixed — transient emphasis for expansion feel |
| Attack Time | 20 ms | |
| Release Gain | 0 dB | No sustain manipulation |
| Output Level | -3 dB | Compensate for transient peak gain |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | Transparent, preserves delicate air detail |
| Ratio | 2:1 | |
| Attack | 1 ms | Fixed |
| Release | 40 ms | Fixed |
| Knee | 0.8 | |
| Mix | 0% | Macro: 0–100% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +10 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 8 kHz | |
| Amount 1 | 5% | |
| Frequency 2 | 14 kHz | |
| Amount 2 | 8% | |
| Harmonics | Odd + Even | |
| Mix | 30% | Macro: 0–60% (COLOR knob) |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Plate | |
| Decay | 2.0 s | Long shimmer tail |
| Pre-delay | 50 ms | |
| High Cut | 18 kHz | Let air through the reverb |
| Low Cut | 6 kHz | |
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
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +10 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | DYNAMICS | Compressor > Mix | 0% | 100% | 0% |
| 5 | COLOR | Exciter > Mix | 0% | 60% | 30% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 50% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**DYNAMICS behavior:** At 0%, the dry signal passes through with Enveloper transient boost only (expansion-like feel). At 100%, the fully compressed signal dominates. DRIVE controls how hard the signal hits the compressor threshold.
