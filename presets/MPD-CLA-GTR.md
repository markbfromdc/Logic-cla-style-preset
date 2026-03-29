# MPD-CLA-GTR — Guitar Channel Strip

**Target:** Electric guitar (clean, crunch, lead)

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Tone shaping |
| 2 | Compressor (VCA) | Controlled dynamics |
| 3 | Exciter | Harmonic presence |
| 4 | Tape Delay | Rhythmic delay |
| 5 | ChromaVerb (Hall) | Spatial depth |
| 6 | Chorus | Width/modulation |
| 7 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 100 Hz | |
| HPF Slope | 12 dB/oct | |
| Low Shelf Frequency | 200 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Frequency | 400 Hz | Fixed |
| Mid Gain | -1.5 dB | Boxy cleanup |
| Mid Q | 1.5 | |
| Presence Frequency | 3 kHz | Fixed |
| Presence Gain | +1 dB | |
| Presence Q | 1.0 | |
| High Shelf Frequency | 6 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |
| LPF Frequency | 12 kHz | Fixed — fizz taming |
| LPF Slope | 6 dB/oct | |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | |
| Ratio | 3:1 | |
| Attack | 10 ms | Preserve pick attack |
| Release | 120 ms | |
| Knee | 0.5 | |
| Mix | 0% | Macro: 0–100% |
| Input Gain | 0 dB | Macro: 0 to +15 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 2.5 kHz | |
| Amount 1 | 8% | |
| Frequency 2 | 6 kHz | |
| Amount 2 | 5% | |
| Mix | 20% | Fixed |

### Tape Delay

| Parameter | Value | Notes |
|-----------|-------|-------|
| Time | Dotted 1/8 | Sync to host |
| Feedback | 25% | |
| High Cut | 5 kHz | |
| Low Cut | 250 Hz | |
| Flutter | 15% | |
| Mix | 0% | Macro: 0–45% |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Hall | |
| Decay | 1.8 s | |
| Pre-delay | 50 ms | |
| High Cut | 7 kHz | |
| Low Cut | 250 Hz | |
| Mix | 0% | Macro: 0–45% |

### Chorus

| Parameter | Value | Notes |
|-----------|-------|-------|
| Rate | 0.7 Hz | |
| Depth | 20% | |
| Mix | 0% | Macro: 0–50% |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | SENSITIVITY | Compressor > Input Gain | 0 dB | +15 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | COMPRESS | Compressor > Mix | 0% | 100% | 0% |
| 5 | REVERB | ChromaVerb > Mix | 0% | 45% | 0% |
| 6 | DELAY | Tape Delay > Mix | 0% | 45% | 0% |
| 7 | PITCH | Chorus > Mix | 0% | 50% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |
