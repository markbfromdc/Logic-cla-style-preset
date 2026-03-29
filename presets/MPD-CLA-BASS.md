# MPD-CLA-BASS — Bass Channel Strip

**Target:** Electric bass, synth bass

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Tone shaping |
| 2 | Compressor (Opto) | Smooth dynamics |
| 3 | Pedalboard (Dist) | Harmonic saturation |
| 4 | Tape Delay | Subtle thickening |
| 5 | ChromaVerb (Room) | Minimal room |
| 6 | Chorus | Width/doubler |
| 7 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 30 Hz | Sub cleanup |
| HPF Slope | 24 dB/oct | |
| Low Shelf Frequency | 80 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Frequency | 350 Hz | Fixed |
| Mid Gain | -2 dB | Box removal |
| Mid Q | 2.0 | |
| Presence Frequency | 1.2 kHz | Fixed |
| Presence Gain | +1.5 dB | Finger/pick attack |
| Presence Q | 1.0 | |
| High Shelf Frequency | 4 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | Opto | |
| Ratio | 3:1 | |
| Attack | 20 ms | Let transient through |
| Release | Auto | |
| Knee | 1.0 | Soft |
| Mix | 0% | Macro: 0–100% |
| Input Gain | 0 dB | Macro: 0 to +15 dB |

### Pedalboard

| Parameter | Value | Notes |
|-----------|-------|-------|
| Pedal | Hi-Drive or Candy Fuzz | Very low gain |
| Drive | 15% | Fixed |
| Tone | 40% | Dark — upper harmonics without fizz |
| Mix | 25% | Fixed |
| | | CLA Bass "secret sauce" — small-speaker translation |

### Tape Delay

| Parameter | Value | Notes |
|-----------|-------|-------|
| Time | 60 ms | |
| Feedback | 5% | |
| High Cut | 3 kHz | |
| Low Cut | 300 Hz | |
| Mix | 0% | Macro: 0–30% |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Room | |
| Decay | 0.4 s | |
| Pre-delay | 10 ms | |
| High Cut | 4 kHz | |
| Low Cut | 300 Hz | |
| Mix | 0% | Macro: 0–25% |

### Chorus

| Parameter | Value | Notes |
|-----------|-------|-------|
| Rate | 0.3 Hz | |
| Depth | 10% | |
| Mix | 0% | Macro: 0–30% |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | SENSITIVITY | Compressor > Input Gain | 0 dB | +15 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | COMPRESS | Compressor > Mix | 0% | 100% | 0% |
| 5 | REVERB | ChromaVerb > Mix | 0% | 25% | 0% |
| 6 | DELAY | Tape Delay > Mix | 0% | 30% | 0% |
| 7 | PITCH | Chorus > Mix | 0% | 30% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |
