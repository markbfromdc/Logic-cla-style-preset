# MPD-FX-SLAP-DLY — Slap Delay FX Send

**Target:** FX send return — short slap-back delay for thickening and doubling

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Tape Delay | Slap-back delay |
| 2 | Channel EQ | Post-delay filtering |
| 3 | Direction Mixer | Mono-safe stereo width |
| 4 | Gain | Output trim |

---

## Plugin Settings

### Tape Delay

| Parameter | Value | Notes |
|-----------|-------|-------|
| Sync | Off | Free-running for precise ms control |
| Delay Time | 80 ms | Macro: 40–150 ms |
| Feedback | 10% | Macro: 0–40% |
| High Cut | 8 kHz | Macro: 2–12 kHz (DAMP knob) |
| Low Cut | 150 Hz | |
| Flutter | 10% | Macro: 0–30% |
| Tape Distortion | 10% | Macro: 0–50% (SATURATION knob) |
| Mix | 100% | Fixed — send/return paradigm |

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 150 Hz | Macro: 80–500 Hz (LOW CUT knob) |
| HPF Slope | 18 dB/oct | |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.5 (narrow) → 2.0 (wide) |
| | | Mid-side processing — mono-safe |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | TIME | Tape Delay > Delay Time | 40 ms | 150 ms | 80 ms |
| 2 | FEED | Tape Delay > Feedback | 0% | 40% | 10% |
| 3 | DAMP | Tape Delay > High Cut | 2 kHz | 12 kHz | 8 kHz |
| 4 | LOW CUT | Channel EQ > HPF Frequency | 80 Hz | 500 Hz | 150 Hz |
| 5 | FLUTTER | Tape Delay > Flutter | 0% | 30% | 10% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SATURATION | Tape Delay > Tape Distortion | 0% | 50% | 10% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** Tape Delay set to 100% wet — send/return paradigm. Short delay times (40–150 ms) for slap-back character. FLUTTER and SATURATION knobs give tape character control.
