# MPD-MASTER-STREAM — Loudness/Streaming Target

**Target:** Streaming-optimized mastering — targets -14 LUFS (Spotify/YouTube), -16 LUFS (Apple Music), -1 dBTP ceiling

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Gain | Input trim |
| 2 | Linear Phase EQ | Phase-coherent master EQ |
| 3 | Compressor (VCA) | Transparent glue |
| 4 | Loudness Meter | LUFS monitoring (visual only) |
| 5 | Adaptive Limiter | Loudness push |
| 6 | Direction Mixer | Mono-safe stereo width |
| 7 | Limiter | Safety ceiling |

---

## Plugin Settings

### Gain (Input)

| Parameter | Value | Notes |
|-----------|-------|-------|
| Gain | 0 dB | Macro: -6 to +6 dB (INPUT knob) |

### Linear Phase EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| Low Shelf Frequency | 80 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±4 dB |
| High Shelf Frequency | 10 kHz | |
| High Shelf Gain | 0 dB | Macro: ±4 dB |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | Transparent |
| Ratio | 2:1 | |
| Attack | 10 ms | Fixed |
| Release | 100 ms | Fixed |
| Knee | 1.0 | |
| Mix | 0% | Macro: 0–50% (COMPRESS knob) |

### Loudness Meter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Target | -14 LUFS | Reference for Spotify/YouTube |
| | | Monitoring only — no parameter macro'd |

### Adaptive Limiter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Gain | 0 dB | Macro: 0 to +12 dB (LOUD knob) |
| Output Ceiling | -1 dBTP | Fixed |
| Lookahead | On | |
| Mode | OptimFull | |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.8 → 1.3 |
| | | Narrow range for mastering |

### Limiter

| Parameter | Value | Notes |
|-----------|-------|-------|
| Output Level | -1 dBTP | Macro: -3 to 0 dB (CEILING knob) |
| Release | 20 ms | Fixed |
| Lookahead | On | |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | INPUT | Gain > Gain | -6 dB | +6 dB | 0 dB |
| 2 | LOW | Linear Phase EQ > Low Shelf Gain (80 Hz) | -4 dB | +4 dB | 0 dB |
| 3 | HIGH | Linear Phase EQ > High Shelf Gain (10 kHz) | -4 dB | +4 dB | 0 dB |
| 4 | COMPRESS | Compressor > Mix | 0% | 50% | 0% |
| 5 | LOUD | Adaptive Limiter > Gain | 0 dB | +12 dB | 0 dB |
| 6 | WIDTH | Direction Mixer > Spread | 0.8 | 1.3 | 1.0 |
| 7 | CEILING | Limiter > Output Level | -3 dB | 0 dB | -1 dBTP |
| 8 | OUTPUT | *(not used — Limiter is final stage)* | — | — | — |

**Streaming loudness targets:**
- Spotify/YouTube: -14 LUFS integrated, -1 dBTP
- Apple Music: -16 LUFS integrated, -1 dBTP
- Use Loudness Meter plugin to monitor LUFS in real-time. Adjust LOUD knob until meter reads target.

**Note:** Knob 8 is unmapped because the Limiter is the final stage — its Output Level (CEILING) is the effective output control. The Gain plugin is at the INPUT position instead.
