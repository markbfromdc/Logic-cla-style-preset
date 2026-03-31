# MPD-CLA-LO-MID — Low-Mid Channel Strip (80–500 Hz)

**Target:** Low-mid content — bass harmonics, guitar/piano body, vocal warmth, snare body, toms

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Low-mid focus + cleanup |
| 2 | Compressor (Opto) | Smooth body dynamics |
| 3 | Exciter | Harmonic warmth |
| 4 | Tape Delay | Subtle thickening |
| 5 | ChromaVerb (Room) | Small room warmth |
| 6 | Direction Mixer | Mono-safe stereo width |
| 7 | Gain | Output trim |

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

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | Opto | |
| Ratio | 3:1 | |
| Attack | 15 ms | DYNAMICS range: 0.5 ms (punch) → 60 ms (sustain) |
| Release | 150 ms | DYNAMICS range: 30 ms (punch) → 400 ms (sustain) |
| Knee | 0.8 | |
| Mix | 0% | Macro: 0–100% |
| Input Gain | 0 dB | Macro: 0 to +15 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 150 Hz | |
| Amount 1 | 4% | |
| Frequency 2 | 400 Hz | |
| Amount 2 | 6% | |
| Mix | 20% | Fixed |

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
| 4 | COMPRESS | Compressor > Mix | 0% | 100% | 0% |
| 5 | DYNAMICS | Compressor > Attack (0.5–60 ms) | Punch | Sustain | 15 ms |
| 5 | DYNAMICS | Compressor > Release (30–400 ms) | Punch | Sustain | 150 ms |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 1.5 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 30% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** Knob 5 (DYNAMICS) has two mappings — both Attack and Release are controlled by the same knob.
