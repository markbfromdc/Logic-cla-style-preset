# MPD-BUS-DRUMS — Drum Bus Channel Strip

**Target:** Summed drum bus — kick, snare, toms, overheads, room mics

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Drum bus tone shaping |
| 2 | Enveloper | Transient emphasis (+8 dB for drums) |
| 3 | Compressor (FET) | Parallel drum crush |
| 4 | Exciter | Harmonic bite |
| 5 | ChromaVerb (Room) | Drum room ambience |
| 6 | Direction Mixer | Mono-safe stereo width |
| 7 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 30 Hz | Clean sub rumble |
| HPF Slope | 18 dB/oct | |
| Low Shelf Frequency | 80 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Cut Frequency | 400 Hz | Fixed — reduce boxiness |
| Mid Cut Gain | -1.5 dB | |
| Mid Cut Q | 1.5 | |
| Presence Frequency | 3 kHz | Fixed — attack clarity |
| Presence Gain | +1 dB | |
| Presence Q | 1.0 | |
| High Shelf Frequency | 8 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |

### Enveloper

| Parameter | Value | Notes |
|-----------|-------|-------|
| Attack Gain | +8 dB | Higher for drums — transient emphasis critical |
| Attack Time | 15 ms | Faster for drum transients |
| Release Gain | 0 dB | |
| Output Level | -4 dB | Compensate for higher attack gain |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | FET | Aggressive character for drum crush |
| Ratio | 4:1 | |
| Attack | 1 ms | Fixed — fast for snap |
| Release | 50 ms | Fixed — quick recovery |
| Knee | 0.3 | Hard knee for aggressive feel |
| Mix | 0% | Macro: 0–100% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +18 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 2 kHz | Snare crack |
| Amount 1 | 5% | |
| Frequency 2 | 6 kHz | Cymbal shimmer |
| Amount 2 | 7% | |
| Harmonics | Odd + Even | |
| Mix | 15% | Macro: 0–50% (COLOR knob) |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Room | |
| Decay | 0.4 s | Tight drum room |
| Pre-delay | 5 ms | |
| High Cut | 8 kHz | |
| Low Cut | 100 Hz | |
| Mix | 0% | Macro: 0–35% |

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
| 4 | DYNAMICS | Compressor > Mix | 0% | 100% | 0% |
| 5 | COLOR | Exciter > Mix | 0% | 50% | 15% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 35% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**DYNAMICS behavior:** At 0%, dry signal with Enveloper transient boost (punchy expansion feel). At 100%, full FET drum crush. Enveloper Attack Gain set higher (+8 dB) than mixing presets for maximum drum transient impact.
