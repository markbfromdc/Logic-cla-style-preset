# MPD-CLA-LO-MID — Low-Mid Channel Strip (80–500 Hz)

**Target:** Low-mid content — bass harmonics, guitar/piano body, vocal warmth, snare body, toms

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Low-mid focus + cleanup |
| 2 | Enveloper | Fixed transient shaping (expansion feel at low DYNAMICS) |
| 3 | Compressor (Opto) | Smooth body dynamics |
| 4 | Exciter | Harmonic warmth |
| 5 | Tape Delay | Subtle thickening |
| 6 | ChromaVerb (Room) | Small room warmth |
| 7 | Direction Mixer | Mono-safe stereo width |
| 8 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 60 Hz | Clean sub rumble below range |
| HPF Slope | 18 dB/oct | |
| Low Shelf Frequency | 100 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Boost Frequency | 250 Hz | Fixed — body center |
| Mid Boost Gain | +1 dB | |
| Mid Boost Q | 1.0 | |
| Mid Cut Frequency | 600 Hz | Fixed — honk removal |
| Mid Cut Gain | -1.5 dB | |
| Mid Cut Q | 1.5 | |
| High Shelf Frequency | 500 Hz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |
| LPF Frequency | 2 kHz | Fixed — gentle rolloff above range |
| LPF Slope | 6 dB/oct | |

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
| Circuit | Opto | |
| Ratio | 3:1 | |
| Attack | 15 ms | Fixed |
| Release | 150 ms | Fixed |
| Knee | 0.8 | |
| Mix | 0% | Macro: 0–100% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +15 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 150 Hz | |
| Amount 1 | 4% | |
| Frequency 2 | 400 Hz | |
| Amount 2 | 6% | |
| Mix | 20% | Macro: 0–40% (COLOR knob) |

### Tape Delay

| Parameter | Value | Notes |
|-----------|-------|-------|
| Time | 80 ms | |
| Feedback | 8% | |
| High Cut | 1 kHz | |
| Low Cut | 80 Hz | |
| Mix | 10% | Fixed — always slightly thickening |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Room | |
| Decay | 0.5 s | |
| Pre-delay | 10 ms | |
| High Cut | 2 kHz | |
| Low Cut | 80 Hz | |
| Mix | 0% | Macro: 0–30% |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.5 (narrow) → 1.5 (wide) |
| | | Mid-side processing — mono-safe |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +15 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | DYNAMICS | Compressor > Mix | 0% | 100% | 0% |
| 5 | COLOR | Exciter > Mix | 0% | 40% | 20% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 1.5 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 30% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**DYNAMICS behavior:** At 0%, the dry signal passes through with Enveloper transient boost only (expansion-like feel). At 100%, the fully compressed signal dominates. DRIVE controls how hard the signal hits the compressor threshold.
