# MPD-FX-SHORT-VERB — Short Reverb FX Send

**Target:** FX send return — short room/plate reverb for proximity and space

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | ChromaVerb (Room) | Short reverb |
| 2 | Channel EQ | Post-reverb filtering |
| 3 | Direction Mixer | Mono-safe stereo width |
| 4 | Gain | Output trim |

---

## Plugin Settings

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Room | |
| Decay | 0.6 s | Macro: 0.2–1.5 s |
| Pre-delay | 20 ms | Macro: 0–80 ms |
| High Cut | 10 kHz | Macro: 2–16 kHz (DAMP knob) |
| Low Cut | 150 Hz | |
| Density | 50% | Macro: 0–100% (COLOR knob) |
| Size | 50% | Macro: 20–100% |
| Width | 100% | |
| Mix | 100% | Fixed — send/return paradigm |

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF Frequency | 150 Hz | Macro: 60–500 Hz (LOW CUT knob) |
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
| 1 | DECAY | ChromaVerb > Decay | 0.2 s | 1.5 s | 0.6 s |
| 2 | PRE-DLY | ChromaVerb > Pre-delay | 0 ms | 80 ms | 20 ms |
| 3 | DAMP | ChromaVerb > High Cut | 2 kHz | 16 kHz | 10 kHz |
| 4 | LOW CUT | Channel EQ > HPF Frequency | 60 Hz | 500 Hz | 150 Hz |
| 5 | COLOR | ChromaVerb > Density | 0% | 100% | 50% |
| 6 | WIDTH | Direction Mixer > Spread | 0.5 (narrow) | 2.0 (wide) | 1.0 |
| 7 | SIZE | ChromaVerb > Size | 20% | 100% | 50% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** ChromaVerb set to 100% wet — this is a send/return effect. Room algorithm default. Channel EQ acts as post-reverb filter to clean up reverb tails.
