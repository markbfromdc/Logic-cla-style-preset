# MPD-CLA-HI-MID — High-Mid Channel Strip (500 Hz–2 kHz)

**Target:** High-mid content — vocal presence, snare crack, guitar attack, piano midrange, horn body

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Hi-mid focus + cleanup |
| 2 | DeEsser 2 | Harshness control at 1–2 kHz |
| 3 | Compressor (FET) | Aggressive mid dynamics |
| 4 | Exciter | Midrange presence |
| 5 | Tape Delay | Slap thickening |
| 6 | ChromaVerb (Plate) | Mid-focused plate |
| 7 | Direction Mixer | Mono-safe stereo width |
| 8 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 400 Hz | |
| HPF Slope | 12 dB/oct | |
| Low Shelf Frequency | 500 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Cut Frequency | 800 Hz | Fixed — nasal reduction |
| Mid Cut Gain | -1 dB | |
| Mid Cut Q | 2.0 | |
| Presence Frequency | 1.5 kHz | Fixed — midrange center |
| Presence Gain | +1.5 dB | |
| Presence Q | 1.0 | |
| High Shelf Frequency | 2 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |
| LPF Frequency | 5 kHz | Fixed — rolloff above range |
| LPF Slope | 6 dB/oct | |

### DeEsser 2

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency | 1.8 kHz | |
| Sensitivity | -25 dB | |
| Mode | Relative | |
| | | Always on, not macro'd |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | FET | Aggressive character suits midrange |
| Ratio | 4:1 | |
| Attack | 5 ms | DYNAMICS range: 0.2 ms (punch) → 40 ms (sustain) |
| Release | 80 ms | DYNAMICS range: 20 ms (punch) → 300 ms (sustain) |
| Knee | 0.5 | |
| Mix | 0% | Macro: 0–100% |
| Input Gain | 0 dB | Macro: 0 to +18 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 800 Hz | |
| Amount 1 | 5% | |
| Frequency 2 | 1.5 kHz | |
| Amount 2 | 7% | |
| Harmonics | Odd + Even | |
| Mix | 25% | Fixed |

### Tape Delay

| Parameter | Value | Notes |
|-----------|-------|-------|
| Time | 100 ms | Slap delay |
| Feedback | 12% | |
| High Cut | 3 kHz | |
| Low Cut | 400 Hz | |
| Flutter | 10% | |
| Mix | 12% | Fixed |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Plate | |
| Decay | 1.2 s | |
| Pre-delay | 30 ms | |
| High Cut | 4 kHz | |
| Low Cut | 400 Hz | |
| Width | 100% | |
| Mix | 0% | Macro: 0–40% |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.5 (narrow) → 2.0 (wide) |
| | | Mid-side processing — mono-safe |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +18 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | COMPRESS | Compressor > Mix | 0% | 100% | 0% |
| 5 | DYNAMICS | Compressor > Attack (0.2–40 ms) | Punch | Sustain | 5 ms |
| 5 | DYNAMICS | Compressor > Release (20–300 ms) | Punch | Sustain | 80 ms |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 40% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** Knob 5 (DYNAMICS) has two mappings — both Attack and Release are controlled by the same knob.
