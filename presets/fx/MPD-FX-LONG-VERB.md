# MPD-FX-LONG-VERB — Long Reverb FX Send

**Target:** FX send return — long hall reverb for depth and spatial dimension

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | ChromaVerb (Hall) | Long reverb |
| 2 | Channel EQ | Post-reverb filtering |
| 3 | Direction Mixer | Mono-safe stereo width |
| 4 | Gain | Output trim |

---

## Plugin Settings

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Hall | |
| Decay | 3.0 s | Macro: 1.5–6.0 s |
| Pre-delay | 50 ms | Macro: 20–150 ms |
| High Cut | 10 kHz | Macro: 2–14 kHz (DAMP knob) |
| Low Cut | 200 Hz | |
| Density | 50% | Macro: 0–100% (COLOR knob) |
| Size | 60% | Macro: 40–100% |
| Width | 100% | |
| Mix | 100% | Fixed — send/return paradigm |

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 200 Hz | Macro: 100–800 Hz (LOW CUT knob) |
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
| 1 | DECAY | ChromaVerb > Decay | 1.5 s | 6.0 s | 3.0 s |
| 2 | PRE-DLY | ChromaVerb > Pre-delay | 20 ms | 150 ms | 50 ms |
| 3 | DAMP | ChromaVerb > High Cut | 2 kHz | 14 kHz | 10 kHz |
| 4 | LOW CUT | Channel EQ > HPF Frequency | 100 Hz | 800 Hz | 200 Hz |
| 5 | COLOR | ChromaVerb > Density | 0% | 100% | 50% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SIZE | ChromaVerb > Size | 40% | 100% | 60% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** ChromaVerb set to 100% wet — this is a send/return effect. Hall algorithm for spacious long tails. Higher LOW CUT range (100–800 Hz) since long reverb tails need aggressive low-end filtering to avoid mud.
