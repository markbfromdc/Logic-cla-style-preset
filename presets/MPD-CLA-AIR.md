# MPD-CLA-AIR — Air Channel Strip (8–20 kHz)

**Target:** Air/ultra-high content — vocal breath, cymbal shimmer, acoustic sparkle, synth air, string harmonics

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Air focus + cleanup |
| 2 | DeEsser 2 | Ultra-high harshness control |
| 3 | Compressor (VCA) | Delicate air dynamics |
| 4 | Exciter | Shimmer/sparkle enhancement |
| 5 | ChromaVerb (Plate) | Airy plate shimmer |
| 6 | Direction Mixer | Mono-safe stereo width |
| 7 | Gain | Output trim |

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

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | Transparent, preserves delicate air detail |
| Ratio | 2:1 | |
| Attack | 1 ms | DYNAMICS range: 0.1 ms (punch) → 20 ms (sustain) |
| Release | 40 ms | DYNAMICS range: 10 ms (punch) → 200 ms (sustain) |
| Knee | 0.8 | |
| Mix | 0% | Macro: 0–100% |
| Input Gain | 0 dB | Macro: 0 to +10 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 8 kHz | |
| Amount 1 | 5% | |
| Frequency 2 | 14 kHz | |
| Amount 2 | 8% | |
| Harmonics | Odd + Even | |
| Mix | 30% | Fixed — shimmer is the point |

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
| 4 | COMPRESS | Compressor > Mix | 0% | 100% | 0% |
| 5 | DYNAMICS | Compressor > Attack (0.1–20 ms) | Punch | Sustain | 1 ms |
| 5 | DYNAMICS | Compressor > Release (10–200 ms) | Punch | Sustain | 40 ms |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 50% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** Knob 5 (DYNAMICS) has two mappings — both Attack and Release are controlled by the same knob.
