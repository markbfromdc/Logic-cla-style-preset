# MPD-CLA-DRUM — Drum Channel Strip

**Target:** Drum bus, individual drums, percussion

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Tone shaping |
| 2 | Compressor (FET) | Aggressive smash |
| 3 | Enveloper | Transient recovery |
| 4 | Tape Delay | Rhythmic slap |
| 5 | ChromaVerb (Room) | Drum room |
| 6 | Ensemble | Width/pitch |
| 7 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 40 Hz | |
| HPF Slope | 18 dB/oct | |
| Low Shelf Frequency | 60 Hz | Sub weight |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Frequency | 400 Hz | Fixed |
| Mid Gain | -3 dB | Box/cardboard cut |
| Mid Q | 1.5 | |
| Snap Frequency | 4.5 kHz | Fixed |
| Snap Gain | +2 dB | Transient bite |
| Snap Q | 1.2 | |
| High Shelf Frequency | 8 kHz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | FET | |
| Ratio | 8:1 | |
| Attack | 0.5 ms | Fast — smash mode |
| Release | 50 ms | Fast pump |
| Knee | 0 | Hard |
| Mix | 0% | Macro: 0–100% |
| Input Gain | 0 dB | Macro: 0 to +20 dB |

### Enveloper

| Parameter | Value | Notes |
|-----------|-------|-------|
| Attack Gain | +8 dB | Fixed — transient recovery after smash |
| Release Gain | -3 dB | Fixed — tighten tails |
| Lookahead | On | |

### Tape Delay

| Parameter | Value | Notes |
|-----------|-------|-------|
| Time | 90 ms | |
| Feedback | 10% | |
| High Cut | 5 kHz | |
| Low Cut | 250 Hz | |
| Mix | 0% | Macro: 0–35% |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Room | |
| Decay | 0.6 s | |
| Pre-delay | 15 ms | |
| High Cut | 6 kHz | |
| Low Cut | 250 Hz | |
| Width | 100% | |
| Mix | 0% | Macro: 0–40% |

### Ensemble

| Parameter | Value | Notes |
|-----------|-------|-------|
| Rate | 0.8 Hz | |
| Depth | 12% | |
| Voices | 4 | |
| Mix | 0% | Macro: 0–30% |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | SENSITIVITY | Compressor > Input Gain | 0 dB | +20 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | COMPRESS | Compressor > Mix | 0% | 100% | 0% |
| 5 | REVERB | ChromaVerb > Mix | 0% | 40% | 0% |
| 6 | DELAY | Tape Delay > Mix | 0% | 35% | 0% |
| 7 | PITCH | Ensemble > Mix | 0% | 30% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |
