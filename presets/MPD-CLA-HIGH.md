# MPD-CLA-HIGH — High Channel Strip (2–8 kHz)

**Target:** High-frequency content — vocal clarity, pick attack, cymbal body, string bite, synth edge

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | High focus + cleanup |
| 2 | DeEsser 2 | Sibilance/harshness control |
| 3 | Compressor (VCA) | Precise high-freq dynamics |
| 4 | Exciter | Harmonic edge |
| 5 | Tape Delay | Rhythmic clarity delay |
| 6 | ChromaVerb (Hall) | Spatial depth |
| 7 | Direction Mixer | Mono-safe stereo width |
| 8 | Gain | Output trim |

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

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | Precise, transparent for high-freq detail |
| Ratio | 3:1 | |
| Attack | 2 ms | DYNAMICS range: 0.1 ms (punch) → 30 ms (sustain) |
| Release | 60 ms | DYNAMICS range: 15 ms (punch) → 250 ms (sustain) |
| Knee | 0.5 | |
| Mix | 0% | Macro: 0–100% |
| Input Gain | 0 dB | Macro: 0 to +15 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 3 kHz | |
| Amount 1 | 6% | |
| Frequency 2 | 6 kHz | |
| Amount 2 | 8% | |
| Harmonics | Odd + Even | |
| Mix | 25% | Fixed |

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
| 4 | COMPRESS | Compressor > Mix | 0% | 100% | 0% |
| 5 | DYNAMICS | Compressor > Attack (0.1–30 ms) | Punch | Sustain | 2 ms |
| 5 | DYNAMICS | Compressor > Release (15–250 ms) | Punch | Sustain | 60 ms |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 45% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** Knob 5 (DYNAMICS) has two mappings — both Attack and Release are controlled by the same knob.
