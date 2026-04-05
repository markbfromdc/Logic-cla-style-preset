# MPD-BUS-BASS — Bass Bus Channel Strip

**Target:** Summed bass bus — electric bass, synth bass, sub bass, upright bass

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Bass bus tone shaping |
| 2 | Enveloper | Transient shaping |
| 3 | Compressor (Opto) | Smooth bass leveling |
| 4 | Pedalboard (Dist) | Harmonic saturation |
| 5 | Direction Mixer | Mono-safe stereo width |
| 6 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 25 Hz | Clean ultra-sub rumble |
| HPF Slope | 18 dB/oct | |
| Low Shelf Frequency | 60 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Cut Frequency | 300 Hz | Fixed — reduce muddiness |
| Mid Cut Gain | -1.5 dB | |
| Mid Cut Q | 1.5 | |
| High Shelf Frequency | 1 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |
| LPF Frequency | 5 kHz | Fixed — gentle rolloff |
| LPF Slope | 6 dB/oct | |

### Enveloper

| Parameter | Value | Notes |
|-----------|-------|-------|
| Attack Gain | +6 dB | Fixed — transient emphasis |
| Attack Time | 20 ms | |
| Release Gain | 0 dB | |
| Output Level | -3 dB | |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | Opto | Smooth, musical for bass |
| Ratio | 3:1 | |
| Attack | 20 ms | Fixed — preserve pluck/pick attack |
| Release | 180 ms | Fixed |
| Knee | 0.8 | |
| Mix | 0% | Macro: 0–100% (DYNAMICS knob) |
| Input Gain | 0 dB | Macro: 0 to +12 dB |

### Pedalboard

| Parameter | Value | Notes |
|-----------|-------|-------|
| Pedal | Hi-Drive | |
| Drive | 15% | Fixed |
| Tone | 35% | Dark — sub harmonic emphasis |
| Mix | 15% | Macro: 0–40% (COLOR knob) |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.0 (mono) → 1.0 (stereo) |
| | | Range limited — bass should stay center |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +12 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | DYNAMICS | Compressor > Mix | 0% | 100% | 0% |
| 5 | COLOR | Pedalboard > Mix | 0% | 40% | 15% |
| 6 | WIDTH | Direction Mixer > Spread | 0.0 (mono) | 1.0 (stereo) | 1.0 |
| 7 | SPACE | *(not used)* | — | — | — |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** WIDTH range intentionally limited to 0.0–1.0 (no widening beyond stereo). Bass content should stay center or narrow for mono compatibility. Knob 7 (SPACE) is unmapped — bass bus typically should not have reverb. The knob position is reserved for consistency across presets.
