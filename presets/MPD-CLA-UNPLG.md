# MPD-CLA-UNPLG — Unplugged/Acoustic Channel Strip

**Target:** Acoustic guitar, piano, strings, acoustic instruments

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Tone shaping |
| 2 | Compressor (Opto) | Gentle dynamics |
| 3 | Exciter | Air/sparkle |
| 4 | Tape Delay | Subtle ambience |
| 5 | Space Designer | Natural room IR |
| 6 | Chorus | Stereo widening |
| 7 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 60 Hz | |
| HPF Slope | 12 dB/oct | |
| Low Shelf Frequency | 150 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Frequency | 2.5 kHz | Fixed |
| Mid Gain | -1 dB | Harshness taming |
| Mid Q | 2.0 | |
| High Shelf Frequency | 8 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | Opto | |
| Ratio | 2.5:1 | |
| Attack | 25 ms | Preserve natural transient fully |
| Release | Auto | |
| Knee | 1.0 | Very soft |
| Mix | 0% | Macro: 0–100% |
| Input Gain | 0 dB | Macro: 0 to +12 dB |

### Exciter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Frequency 1 | 5 kHz | |
| Amount 1 | 4% | |
| Frequency 2 | 12 kHz | |
| Amount 2 | 6% | |
| Mix | 25% | Fixed |

### Tape Delay

| Parameter | Value | Notes |
|-----------|-------|-------|
| Time | 140 ms | |
| Feedback | 10% | |
| High Cut | 4 kHz | |
| Low Cut | 200 Hz | |
| Flutter | 8% | |
| Mix | 0% | Macro: 0–35% |

### Space Designer

| Parameter | Value | Notes |
|-----------|-------|-------|
| IR | Medium Room or Studio | From factory library |
| Reverb Time | 1.0 s | |
| Pre-delay | 25 ms | |
| High Cut | 8 kHz | |
| Low Cut | 150 Hz | |
| Mix | 0% | Macro: 0–45% |

### Chorus

| Parameter | Value | Notes |
|-----------|-------|-------|
| Rate | 0.4 Hz | |
| Depth | 10% | |
| Mix | 0% | Macro: 0–35% |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | SENSITIVITY | Compressor > Input Gain | 0 dB | +12 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | COMPRESS | Compressor > Mix | 0% | 100% | 0% |
| 5 | REVERB | Space Designer > Mix | 0% | 45% | 0% |
| 6 | DELAY | Tape Delay > Mix | 0% | 35% | 0% |
| 7 | PITCH | Chorus > Mix | 0% | 35% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |
