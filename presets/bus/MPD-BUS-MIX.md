# MPD-BUS-MIX — Mix Bus Channel Strip

**Target:** Mix bus — all instrument busses sum here before master

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Linear Phase EQ | Phase-coherent mix bus EQ |
| 2 | Compressor (VCA) | Light mix bus glue |
| 3 | Direction Mixer | Mono-safe stereo width |
| 4 | Gain | Output trim |

---

## Plugin Settings

### Linear Phase EQ

| Parameter | Value | Notes |
|-----------|-------|-------|
| Low Shelf Frequency | 100 Hz | |
| Low Shelf Gain | 0 dB | Macro: ±4 dB |
| Parametric 1 Frequency | 250 Hz | Fixed — warmth center |
| Parametric 1 Gain | 0 dB | Macro: ±3 dB (WARM knob) |
| Parametric 1 Q | 0.7 | |
| Parametric 2 Frequency | 12 kHz | Fixed — air center |
| Parametric 2 Gain | 0 dB | Macro: -2 to +4 dB (AIR knob) |
| Parametric 2 Q | 0.5 | |
| High Shelf Frequency | 8 kHz | |
| High Shelf Gain | 0 dB | Macro: ±4 dB |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | Transparent glue |
| Ratio | 2:1 | Very gentle |
| Attack | 10 ms | Fixed |
| Release | 100 ms | Fixed |
| Knee | 1.0 | Soft knee for transparency |
| Mix | 0% | Macro: 0–60% (GLUE knob) |
| Input Gain | 0 dB | Macro: 0 to +10 dB |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.8 (slightly narrow) → 1.5 (slightly wide) |
| | | Narrow range — mix bus width should be subtle |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | INPUT | Compressor > Input Gain | 0 dB | +10 dB | 0 dB |
| 2 | LOW | Linear Phase EQ > Low Shelf Gain | -4 dB | +4 dB | 0 dB |
| 3 | HIGH | Linear Phase EQ > High Shelf Gain | -4 dB | +4 dB | 0 dB |
| 4 | GLUE | Compressor > Mix | 0% | 60% | 0% |
| 5 | WARM | Linear Phase EQ > Parametric 1 Gain (250 Hz) | -3 dB | +3 dB | 0 dB |
| 6 | WIDTH | Direction Mixer > Spread | 0.8 | 1.5 | 1.0 |
| 7 | AIR | Linear Phase EQ > Parametric 2 Gain (12 kHz) | -2 dB | +4 dB | 0 dB |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** Mix bus uses Linear Phase EQ instead of Channel EQ for phase-coherent processing at the sum stage. Reduced EQ ranges (±4 dB shelves, ±3 dB parametrics) — small moves on the mix bus have large impact. GLUE max capped at 60% for subtle parallel compression. WIDTH range intentionally narrow (0.8–1.5).
