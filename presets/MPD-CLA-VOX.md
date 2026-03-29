# MPD-CLA-VOX — Vocal Channel Strip

**Target:** Lead and background vocals

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Tone shaping |
| 2 | DeEsser 2 | Sibilance control |
| 3 | Compressor (FET) | Primary dynamics |
| 4 | Exciter | Harmonic presence |
| 5 | Tape Delay | Slap/short delay |
| 6 | ChromaVerb (Plate) | Vocal plate reverb |
| 7 | Chorus | Pitch doubler/widener |
| 8 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 80 Hz | |
| HPF Slope | 12 dB/oct | |
| Low Shelf Frequency | 200 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Frequency | 300 Hz | Fixed |
| Mid Gain | -2 dB | Mud removal |
| Mid Q | 1.5 | |
| High Shelf Frequency | 5 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |
| Air Frequency | 12 kHz | Fixed |
| Air Gain | +2 dB | |
| Air Q | 0.7 | |

### DeEsser 2

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency | 6.5 kHz | |
| Sensitivity | -30 dB | |
| Mode | Relative | |
| | | Always on, not macro'd |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | FET | |
| Ratio | 4:1 | |
| Attack | 5 ms | |
| Release | 80 ms | |
| Knee | 0.5 | |
| Mix | 0% | Macro: 0–100% |
| Input Gain | 0 dB | Macro: 0 to +18 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 3 kHz | |
| Amount 1 | 5% | |
| Frequency 2 | 8 kHz | |
| Amount 2 | 8% | |
| Harmonics | Odd + Even | |
| Mix | 30% | Fixed — always adding a bit |

### Tape Delay

| Parameter | Value | Notes |
|-----------|-------|-------|
| Time | 110 ms | Slap delay |
| Feedback | 15% | |
| High Cut | 6 kHz | |
| Low Cut | 200 Hz | |
| Flutter | 10% | |
| Mix | 0% | Macro: 0–50% |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Plate | |
| Decay | 1.5 s | |
| Pre-delay | 40 ms | |
| High Cut | 8 kHz | |
| Low Cut | 200 Hz | |
| Width | 100% | |
| Mix | 0% | Macro: 0–50% |

### Chorus

| Parameter | Value | Notes |
|-----------|-------|-------|
| Rate | 0.5 Hz | |
| Depth | 15% | |
| Mix | 0% | Macro: 0–40% |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | SENSITIVITY | Compressor > Input Gain | 0 dB | +18 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | COMPRESS | Compressor > Mix | 0% | 100% | 0% |
| 5 | REVERB | ChromaVerb > Mix | 0% | 50% | 0% |
| 6 | DELAY | Tape Delay > Mix | 0% | 50% | 0% |
| 7 | PITCH | Chorus > Mix | 0% | 40% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |
