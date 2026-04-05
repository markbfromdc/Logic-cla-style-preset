# MPD-FX-LONG-DLY — Long Delay FX Send

**Target:** FX send return — tempo-synced rhythmic delay for echo trails

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Tape Delay | Tempo-synced delay |
| 2 | Channel EQ | Post-delay filtering |
| 3 | Direction Mixer | Mono-safe stereo width |
| 4 | Gain | Output trim |

---

## Plugin Settings

### Tape Delay

| Parameter | Value | Notes |
|-----------|-------|-------|
| Sync | On | Tempo-synced |
| Note Value | Dotted 1/8 | Macro: steps through note values (TIME knob) |
| Feedback | 25% | Macro: 0–60% |
| High Cut | 6 kHz | Macro: 2–10 kHz (DAMP knob) |
| Low Cut | 200 Hz | |
| Flutter | 8% | Macro: 0–25% |
| Tape Distortion | 8% | Macro: 0–40% (SATURATION knob) |
| Mix | 100% | Fixed — send/return paradigm |

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 200 Hz | Macro: 150–800 Hz (LOW CUT knob) |
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
| 1 | TIME | Tape Delay > Note Value | 1/8 note | 1/2 note | Dotted 1/8 |
| 2 | FEED | Tape Delay > Feedback | 0% | 60% | 25% |
| 3 | DAMP | Tape Delay > High Cut | 2 kHz | 10 kHz | 6 kHz |
| 4 | LOW CUT | Channel EQ > HPF Frequency | 150 Hz | 800 Hz | 200 Hz |
| 5 | FLUTTER | Tape Delay > Flutter | 0% | 25% | 8% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SATURATION | Tape Delay > Tape Distortion | 0% | 40% | 8% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note on TIME knob:** In sync mode, Tape Delay uses a stepped note value selector. The Smart Control knob steps through note values (1/16, 1/8, dotted 1/8, 1/4, dotted 1/4, 1/2) rather than sweeping smoothly. This is expected behavior.

Tape Delay set to 100% wet — send/return paradigm. Higher FEED max (60%) for rhythmic echo trails. More aggressive LOW CUT (150–800 Hz) since long delay repeats accumulate low-frequency energy.
