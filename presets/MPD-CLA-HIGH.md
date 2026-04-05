# MPD-CLA-HIGH — High Channel Strip (2–8 kHz)

**Target:** High-frequency content — vocal clarity, pick attack, cymbal body, string bite, synth edge

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | High focus + cleanup |
| 2 | DeEsser 2 | Sibilance/harshness control |
| 3 | Enveloper | Fixed transient shaping (expansion feel at low DYNAMICS) |
| 4 | Compressor (VCA) | Precise high-freq dynamics |
| 5 | Exciter | Harmonic edge |
| 6 | Tape Delay | Rhythmic clarity delay |
| 7 | ChromaVerb (Hall) | Spatial depth |
| 8 | Direction Mixer | Mono-safe stereo width |
| 9 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 1.5 kHz | |
| HPF Slope | 12 dB/oct | |
| Low Shelf Frequency | 2 kHz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Cut Frequency | 3.5 kHz | Fixed — harsh resonance taming |
| Mid Cut Gain | -1 dB | |
| Mid Cut Q | 2.0 | |
| Presence Frequency | 5 kHz | Fixed — clarity center |
| Presence Gain | +1 dB | |
| Presence Q | 0.8 | |
| High Shelf Frequency | 8 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |
| LPF Frequency | 12 kHz | Fixed — prevent air bleed |
| LPF Slope | 6 dB/oct | |

### DeEsser 2

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency | 5.5 kHz | |
| Sensitivity | -28 dB | |
| Mode | Relative | |
| | | Always on, not macro'd |

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
| Circuit | VCA | Precise, transparent for high-freq detail |
| Ratio | 3:1 | |
| Attack | 2 ms | Fixed |
| Release | 60 ms | Fixed |
| Knee | 0.5 | |
| Mix | 0% | Macro: 0–100% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +15 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 3 kHz | |
| Amount 1 | 6% | |
| Frequency 2 | 6 kHz | |
| Amount 2 | 8% | |
| Harmonics | Odd + Even | |
| Mix | 25% | Macro: 0–50% (COLOR knob) |

### Tape Delay

| Parameter | Value | Notes |
|-----------|-------|-------|
| Time | Dotted 1/8 | Sync to host |
| Feedback | 20% | |
| High Cut | 8 kHz | |
| Low Cut | 2 kHz | |
| Flutter | 12% | |
| Mix | 10% | Fixed |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Hall | |
| Decay | 1.5 s | |
| Pre-delay | 40 ms | |
| High Cut | 10 kHz | |
| Low Cut | 2 kHz | |
| Width | 100% | |
| Mix | 0% | Macro: 0–45% |

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
| 5 | COLOR | Exciter > Mix | 0% | 50% | 25% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 45% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**DYNAMICS behavior:** At 0%, the dry signal passes through with Enveloper transient boost only (expansion-like feel). At 100%, the fully compressed signal dominates. DRIVE controls how hard the signal hits the compressor threshold.
