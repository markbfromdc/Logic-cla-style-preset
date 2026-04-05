# Signal Flow & Gain Staging Specification

**Version:** 3.0
**Last Updated:** 2026-04-05
**Applies to:** All MPD-CLA presets (mixing, bus, FX send, mastering)

---

## Signal Flow Overview

Audio enters each preset at unity (0 dBFS peak assumed) and should exit at unity when all macro knobs are at default position. The OUTPUT knob provides ±18 dB trim range to compensate for any processing gain.

```
INPUT (0 dBFS reference)
  │
  ├─ Channel EQ ─────── Fixed gain changes (mid cuts/boosts, HPF/LPF)
  │                      Typical net: -1 to -3 dB (cuts > boosts)
  │
  ├─ [DeEsser 2] ────── Gain-neutral (only attenuates on detection)
  │
  ├─ Enveloper ───────── Fixed transient boost (+6 dB Attack, -3 dB Output)
  │                      Net: ~0 dB (transients are brief, so +6/-3 ≈ 0)
  │
  ├─ Compressor ──────── DRIVE adds input gain → triggers compression
  │                      DYNAMICS at 0% = bypassed (dry signal only)
  │                      DYNAMICS at 100% = full wet, gain reduction active
  │                      Net: depends on DRIVE + DYNAMICS settings
  │
  ├─ Harmonics ───────── Exciter/Pedalboard (COLOR controls wet/dry mix)
  │                      Typical net: +0.5 to +2 dB depending on preset
  │
  ├─ [Tape Delay] ────── Fixed mix % adds slight level
  │   (fixed)            Typical net: +0.2 to +0.5 dB
  │
  ├─ Reverb ──────────── SPACE at 0% = gain-neutral
  │                      SPACE at max = adds reverb tail energy
  │                      Typical net at max: +1 to +3 dB
  │
  ├─ Direction Mixer ─── WIDTH at center (1.0) = gain-neutral
  │                      WIDTH at other positions = negligible change
  │
  └─ Gain ────────────── OUTPUT trim (-12 to +6 dB)
                         Used to restore unity after processing
```

---

## Per-Preset Signal Flow Diagrams

### MPD-CLA-SUB (20–80 Hz)

```
IN ──▶ Ch.EQ ──▶ Enveloper ──▶ Comp(Opto) ──▶ Pedalboard ──▶ ChromaVerb ──▶ Dir.Mixer ──▶ Gain ──▶ OUT
       │          │              │               │               │              │             │
       │ HPF: Off │ Atk +6dB    │ DRIVE: 0-12   │ Drive: 10%    │ Room 0.3s    │ Spread      │ OUTPUT
       │ LPF: 250 │ Out -3dB    │ DYNAMICS: mix │ Tone: 30%     │ SPACE: 0-20% │ WIDTH       │ -12/+6
       │ BASS ±6  │             │ Attack 30ms   │ COLOR: mix    │              │ 0.0-1.5     │
       │ TREBLE±6 │             │ Release 200ms │               │              │             │
       │          │             │ (fixed)       │               │              │             │
```

**Level budget at defaults (all knobs center/zero):**
- Channel EQ: -2 dB (mid cut at 200 Hz)
- Enveloper: ~0 dB (Attack +6dB with Output -3dB, net negligible)
- Compressor: 0 dB (Mix at 0% = bypass)
- Pedalboard: +1 dB (20% mix of driven signal, always on)
- ChromaVerb: 0 dB (Mix at 0%)
- Direction Mixer: 0 dB (Spread at 1.0)
- **Net at defaults: ~-1 dB** (within acceptable tolerance)

### MPD-CLA-LO-MID (80–500 Hz)

```
IN ──▶ Ch.EQ ──▶ Enveloper ──▶ Comp(Opto) ──▶ Exciter ──▶ Tape Delay ──▶ ChromaVerb ──▶ Dir.Mixer ──▶ Gain ──▶ OUT
       │          │              │               │            │               │              │             │
       │ HPF: 60  │ Atk +6dB    │ DRIVE: 0-15   │ 150/400 Hz │ 80ms          │ Room 0.5s    │ Spread      │ OUTPUT
       │ LPF: 2k  │ Out -3dB    │ DYNAMICS: mix │ COLOR: mix │ Mix: 10%      │ SPACE: 0-30% │ WIDTH       │ -12/+6
       │ BASS ±6  │             │ Attack 15ms   │            │ (fixed)       │              │ 0.5-1.5     │
       │ TREBLE±6 │             │ Release 150ms │            │               │              │             │
       │          │             │ (fixed)       │            │               │              │             │
```

**Level budget at defaults:**
- Channel EQ: -1 dB (mid boost +1, mid cut -1.5, HPF/LPF)
- Enveloper: ~0 dB (Attack +6dB with Output -3dB, net negligible)
- Compressor: 0 dB (Mix at 0%)
- Exciter: +1 dB (20% mix, always on)
- Tape Delay: +0.3 dB (10% fixed mix)
- ChromaVerb: 0 dB (Mix at 0%)
- Direction Mixer: 0 dB
- **Net at defaults: ~+0.3 dB** (negligible)

### MPD-CLA-HI-MID (500 Hz–2 kHz)

```
IN ──▶ Ch.EQ ──▶ DeEsser ──▶ Enveloper ──▶ Comp(FET) ──▶ Exciter ──▶ Tape Delay ──▶ ChromaVerb ──▶ Dir.Mixer ──▶ Gain ──▶ OUT
       │          │             │              │              │            │               │              │             │
       │ HPF:400  │ 1.8kHz      │ Atk +6dB     │ DRIVE: 0-18  │ 800/1.5k   │ 100ms slap    │ Plate 1.2s   │ Spread      │ OUTPUT
       │ LPF: 5k  │ -25dB       │ Out -3dB     │ DYNAMICS:mix │ COLOR: mix │ Mix: 12%      │ SPACE: 0-40% │ WIDTH       │ -12/+6
       │ BASS ±6  │ (fixed)     │              │ Attack 5ms   │            │ (fixed)       │              │ 0.5-2.0     │
       │ TREBLE±6 │             │              │ Release 80ms │            │               │              │             │
       │          │             │              │ (fixed)      │            │               │              │             │
```

**Level budget at defaults:**
- Channel EQ: -0.5 dB (presence +1.5 offset by mid cut -1 and HPF/LPF)
- DeEsser: 0 dB (gain-neutral, only attenuates)
- Enveloper: ~0 dB (Attack +6dB with Output -3dB, net negligible)
- Compressor: 0 dB (Mix at 0%)
- Exciter: +1.2 dB (25% mix, always on)
- Tape Delay: +0.5 dB (12% fixed mix)
- ChromaVerb: 0 dB (Mix at 0%)
- Direction Mixer: 0 dB
- **Net at defaults: ~+1.2 dB** (compensate with OUTPUT at -1 dB)

### MPD-CLA-HIGH (2–8 kHz)

```
IN ──▶ Ch.EQ ──▶ DeEsser ──▶ Enveloper ──▶ Comp(VCA) ──▶ Exciter ──▶ Tape Delay ──▶ ChromaVerb ──▶ Dir.Mixer ──▶ Gain ──▶ OUT
       │          │             │              │              │            │               │              │             │
       │ HPF:1.5k │ 5.5kHz      │ Atk +6dB     │ DRIVE: 0-15  │ 3k/6k Hz   │ Dot 1/8 sync  │ Hall 1.5s    │ Spread      │ OUTPUT
       │ LPF: 12k │ -28dB       │ Out -3dB     │ DYNAMICS:mix │ COLOR: mix │ Mix: 10%      │ SPACE: 0-45% │ WIDTH       │ -12/+6
       │ BASS ±6  │ (fixed)     │              │ Attack 2ms   │            │ (fixed)       │              │ 0.5-2.0     │
       │ TREBLE±6 │             │              │ Release 60ms │            │               │              │             │
       │          │             │              │ (fixed)      │            │               │              │             │
```

**Level budget at defaults:**
- Channel EQ: -0.5 dB (presence +1 offset by mid cut -1 and HPF/LPF)
- DeEsser: 0 dB
- Enveloper: ~0 dB (Attack +6dB with Output -3dB, net negligible)
- Compressor: 0 dB (Mix at 0%)
- Exciter: +1.2 dB (25% mix)
- Tape Delay: +0.3 dB (10% fixed mix)
- ChromaVerb: 0 dB (Mix at 0%)
- Direction Mixer: 0 dB
- **Net at defaults: ~+1.0 dB** (compensate with OUTPUT at -1 dB)

### MPD-CLA-AIR (8–20 kHz)

```
IN ──▶ Ch.EQ ──▶ DeEsser ──▶ Enveloper ──▶ Comp(VCA) ──▶ Exciter ──▶ ChromaVerb ──▶ Dir.Mixer ──▶ Gain ──▶ OUT
       │          │             │              │              │            │              │             │
       │ HPF: 6k  │ 10kHz       │ Atk +6dB     │ DRIVE: 0-10  │ 8k/14k Hz  │ Plate 2.0s   │ Spread      │ OUTPUT
       │ LPF: Off │ -25dB       │ Out -3dB     │ DYNAMICS:mix │ COLOR: mix │ SPACE: 0-50% │ WIDTH       │ -12/+6
       │ BASS ±6  │ (fixed)     │              │ Attack 1ms   │            │              │ 0.5-2.0     │
       │ TREBLE±6 │             │              │ Release 40ms │            │              │             │
       │          │             │              │ (fixed)      │            │              │             │
```

**Level budget at defaults:**
- Channel EQ: +0.5 dB (presence +1.5, no cuts in this range)
- DeEsser: 0 dB
- Enveloper: ~0 dB (Attack +6dB with Output -3dB, net negligible)
- Compressor: 0 dB (Mix at 0%)
- Exciter: +1.5 dB (30% mix — highest of all presets)
- ChromaVerb: 0 dB (Mix at 0%)
- Direction Mixer: 0 dB
- **Net at defaults: ~+2.0 dB** (compensate with OUTPUT at -2 dB)

---

## Gain Staging Validation Procedure

### Step 1: Baseline Measurement

1. Insert a **Level Meter** plugin on the track output (after the preset chain)
2. Send a test signal (pink noise at -18 dBFS recommended)
3. Set all macro knobs to default (0 dB / 0% / Spread 1.0)
4. Record the output level

### Step 2: Unity Check

1. Compare input level to output level
2. **Target:** within ±2 dB of input at defaults
3. If output is hotter than +2 dB above input, reduce the OUTPUT default
4. If output is quieter than -2 dB below input, increase the OUTPUT default

### Step 3: Headroom Check

1. Set DRIVE to maximum
2. Set DYNAMICS to 100%
3. Check output level — should not exceed 0 dBFS (digital clip)
4. If clipping occurs, reduce the DRIVE max range in Smart Control mapping

### Step 4: Effect Stacking Check

1. Set SPACE to maximum
2. Set WIDTH to maximum
3. Check output level with DRIVE/DYNAMICS still at max
4. This represents the worst-case scenario
5. Verify OUTPUT knob at -12 dB can bring the level below 0 dBFS

### Step 5: A/B Level Match

1. Reset all knobs to default
2. Bypass the entire channel strip
3. Compare bypassed level to processed level
4. Adjust OUTPUT knob until levels match within ±0.5 dB
5. This is the preset's "loudness-matched" starting point

---

## Headroom Considerations by Frequency Band

| Preset | Concern | Mitigation |
|--------|---------|------------|
| SUB | Subharmonics from Pedalboard can cause headroom issues on monitoring systems that don't reproduce sub | LPF at 250 Hz constrains energy; DRIVE max limited to +12 dB |
| LO-MID | Exciter + Tape Delay combined can thicken the 250 Hz range | Both are at low fixed mix (20%, 10%); reverb High Cut at 2 kHz |
| HI-MID | Most inserts (9) = most cumulative gain change | Monitor HI-MID carefully during Step 4 of validation |
| HIGH | Exciter + Tape Delay in the presence range can create harshness | DeEsser 2 before compression catches resonances early |
| AIR | Exciter at 30% is the highest fixed mix of any preset | DRIVE max limited to +10 dB (lowest of all presets) |

---

## DRIVE + DYNAMICS Interaction

The DRIVE and DYNAMICS knobs interact in a specific way that affects gain staging:

```
DYNAMICS = 0%:   Input ──▶ [Compressor bypassed via mix] ──▶ Output
                 DRIVE has no audible effect (compressed signal is not mixed in)
                 Signal passes through dry with Enveloper's transient enhancement

DYNAMICS = 50%:  Input ──▶ 50% dry + 50% compressed ──▶ Output
                 DRIVE moderately affects tone (parallel compression)

DYNAMICS = 100%: Input ──▶ [Full compressed signal] ──▶ Output
                 DRIVE fully drives compression (traditional serial compression)
```

**Key insight:** DRIVE only matters when DYNAMICS is above 0%. At DYNAMICS = 0%, the compressor is effectively bypassed regardless of DRIVE settings. This is by design — the dry signal passes through the Mix at unity, retaining the Enveloper's transient enhancement for an expansion-like character.

---

## Traceability

| This Spec Section | Source Document |
|--------------------|----------------|
| Insert chain order | [presets/](../presets/) — Insert Chain tables |
| DRIVE/DYNAMICS ranges | [presets/](../presets/) — Smart Control Mapping tables |
| Level budget estimates | Derived from plugin default behaviors |
| Validation procedure | [TESTING-CHECKLIST.md](../TESTING-CHECKLIST.md) — Signal Integrity section |
