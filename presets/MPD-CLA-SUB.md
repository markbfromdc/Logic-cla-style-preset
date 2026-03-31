# MPD-CLA-SUB — Sub-Bass Channel Strip (20–80 Hz)

**Target:** Sub-bass content — kick fundamentals, bass synths, 808s, sub drops

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Channel EQ | Sub focus + cleanup above |
| 2 | Compressor (Opto) | Smooth sub dynamics |
| 3 | Pedalboard (Dist) | Harmonic saturation for speaker translation |
| 4 | ChromaVerb (Room) | Minimal low-end space |
| 5 | Direction Mixer | Mono-safe stereo width |
| 6 | Gain | Output trim |

---

## Plugin Settings

### Channel EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| HPF | Off | Preserve all sub content |
| Low Shelf Frequency | 40 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±6 dB |
| Mid Frequency | 200 Hz | Fixed |
| Mid Gain | -2 dB | Clear mud above sub range |
| Mid Q | 1.5 | |
| High Shelf Frequency | 100 Hz | |
| High Shelf Gain | 0 dB | Macro: ±6 dB |
| LPF Frequency | 250 Hz | Fixed — focus on sub content |
| LPF Slope | 12 dB/oct | |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | Opto | Smooth, no transient snap needed |
| Ratio | 4:1 | |
| Attack | 30 ms | DYNAMICS range: 1 ms (punch) → 80 ms (sustain) |
| Release | 200 ms | DYNAMICS range: 40 ms (punch) → 500 ms (sustain) |
| Knee | 1.0 | |
| Mix | 0% | Macro: 0–100% |
| Input Gain | 0 dB | Macro: 0 to +12 dB |

### Pedalboard

| Parameter | Value | Notes |
|-----------|-------|-------|
| Pedal | Hi-Drive | Very low gain |
| Drive | 10% | Fixed |
| Tone | 30% | Very dark — just adding sub harmonics |
| Mix | 20% | Fixed |

### ChromaVerb

| Parameter | Value | Notes |
|-----------|-------|-------|
| Algorithm | Room | |
| Decay | 0.3 s | Very short — sub reverb must be tight |
| Pre-delay | 5 ms | |
| High Cut | 200 Hz | Kill all reverb above sub range |
| Low Cut | 20 Hz | |
| Mix | 0% | Macro: 0–20% |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.0 (mono) → 1.5 (wide) |
| | | Mid-side processing — mono-safe |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | DRIVE | Compressor > Input Gain | 0 dB | +12 dB | 0 dB |
| 2 | BASS | Channel EQ > Low Shelf Gain | -6 dB | +6 dB | 0 dB |
| 3 | TREBLE | Channel EQ > High Shelf Gain | -6 dB | +6 dB | 0 dB |
| 4 | COMPRESS | Compressor > Mix | 0% | 100% | 0% |
| 5 | DYNAMICS | Compressor > Attack (1–80 ms) | Punch | Sustain | 30 ms |
| 5 | DYNAMICS | Compressor > Release (40–500 ms) | Punch | Sustain | 200 ms |
| 6 | WIDTH | Direction Mixer > Spread | 0.0 (mono) | 1.5 (wide) | 1.0 |
| 7 | SPACE | ChromaVerb > Mix | 0% | 20% | 0% |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** Knob 5 (DYNAMICS) has two mappings — both Attack and Release are controlled by the same knob.
