# MPD-MASTER-MULTI — Multiband Dynamics

**Target:** Multiband compression/expansion — independent dynamics control per frequency band

---

## Insert Chain

| Slot | Plugin | Purpose |
|------|--------|---------|
| 1 | Multipressor | 4-band multiband dynamics |
| 2 | Compressor (VCA) | Post-multiband glue |
| 3 | Direction Mixer | Mono-safe stereo width |
| 4 | Gain | Output trim |

---

## Plugin Settings

### Multipressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Band 1 Range | 20–80 Hz | Sub |
| Band 1 Ratio | 2.5:1 | |
| Band 1 Threshold | -20 dB | Macro: -40 to 0 dB (LOW knob) |
| Band 2 Range | 80–500 Hz | Low-Mid |
| Band 2 Ratio | 2:1 | |
| Band 2 Threshold | -18 dB | Macro: -40 to 0 dB (LO-MID knob) |
| Band 3 Range | 500 Hz–4 kHz | Hi-Mid |
| Band 3 Ratio | 2.5:1 | |
| Band 3 Threshold | -18 dB | Macro: -40 to 0 dB (HI-MID knob) |
| Band 4 Range | 4–20 kHz | High |
| Band 4 Ratio | 2:1 | |
| Band 4 Threshold | -16 dB | Macro: -40 to 0 dB (HIGH knob) |
| Attack (all bands) | 10 ms | Fixed |
| Release (all bands) | 100 ms | Fixed |

### Compressor

| Parameter | Value | Notes |
|-----------|-------|-------|
| Circuit | VCA | Post glue |
| Ratio | 2:1 | |
| Attack | 10 ms | Fixed |
| Release | 100 ms | Fixed |
| Knee | 1.0 | |
| Mix | 0% | Macro: 0–50% (GLUE knob) |

### Direction Mixer

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spread | 1.0 | Macro: 0.8 → 1.3 |
| | | Narrow range for mastering |

---

## Smart Control Mapping

| Knob # | Label | Plugin > Parameter | Min | Max | Default |
|--------|-------|--------------------|-----|-----|---------|
| 1 | LOW | Multipressor > Band 1 Threshold | -40 dB | 0 dB | -20 dB |
| 2 | LO-MID | Multipressor > Band 2 Threshold | -40 dB | 0 dB | -18 dB |
| 3 | HI-MID | Multipressor > Band 3 Threshold | -40 dB | 0 dB | -18 dB |
| 4 | HIGH | Multipressor > Band 4 Threshold | -40 dB | 0 dB | -16 dB |
| 5 | GLUE | Compressor > Mix | 0% | 50% | 0% |
| 6 | WIDTH | Direction Mixer > Spread | 0.8 | 1.3 | 1.0 |
| 7 | CEILING | Gain > Gain | -3 dB | 0 dB | -1 dB |
| 8 | OUTPUT | Gain > Gain | -12 dB | +6 dB | 0 dB |

**Note:** Knobs 1–4 control each Multipressor band threshold independently. Lower threshold = more compression on that band. This gives per-band dynamics control from 4 knobs on the BCF2000. GLUE adds optional post-multiband parallel compression for cohesion.

**Note on knob 7 (CEILING):** Maps to the same Gain plugin as OUTPUT but controls a narrower range (-3 to 0 dB) for fine output ceiling control. In practice, set CEILING first for your target ceiling, then use OUTPUT for level matching.
