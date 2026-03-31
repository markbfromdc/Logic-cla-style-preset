# Testing & Validation Specification

**Version:** 2.0
**Last Updated:** 2026-03-31
**Applies to:** All MPD-CLA presets

---

## Testing Overview

Each preset must pass four testing phases before sign-off:

1. **Unit Tests** — Individual plugin and knob validation
2. **Integration Tests** — Full chain interaction and multi-knob scenarios
3. **Mono Compatibility Tests** — Direction Mixer width safety verification
4. **Performance Tests** — CPU load and latency benchmarks

---

## Phase 1: Unit Tests

### 1.1 Per-Plugin Bypass Test

For each plugin in the preset's insert chain:

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Send pink noise at -18 dBFS through the chain | Signal passes through cleanly |
| 2 | Bypass the target plugin | Level change should match the plugin's contribution (see [signal-flow.md](signal-flow.md) level budgets) |
| 3 | Re-enable the plugin | Sound returns to processed state, no clicks or artifacts |
| 4 | Repeat for every plugin in the chain | All plugins can be individually bypassed without issues |

**Pass criteria:** Every plugin can be bypassed and re-enabled without clicks, pops, or unexpected level changes.

### 1.2 Per-Knob Sweep Test

For each of the 8 Smart Control knobs:

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Set the knob to minimum | Parameter reaches its Min value, no artifacts |
| 2 | Slowly sweep from minimum to maximum | Smooth, continuous change — no clicks, jumps, or zipper noise |
| 3 | Set the knob to maximum | Parameter reaches its Max value, no digital clipping |
| 4 | Return to default position | Sound returns to neutral state |

**Additional checks per knob:**

| Knob | Specific Verification |
|------|----------------------|
| DRIVE | At max, output meter stays below 0 dBFS with COMPRESS at 100% |
| BASS | At ±6 dB extremes, no low-frequency resonance or rumble |
| TREBLE | At ±6 dB extremes, no high-frequency harshness or ringing |
| COMPRESS | At 0%, DRIVE and DYNAMICS have no audible effect |
| DYNAMICS | At full left, attack is audibly fast; at full right, attack is audibly slow |
| WIDTH | At min, image collapses; at max, image expands; no phase artifacts |
| SPACE | At max, reverb tail is audible but source remains identifiable |
| OUTPUT | At -12 dB, signal is quiet but clean; at +6 dB, signal is louder but not clipping |

### 1.3 Range Boundary Tests

Verify each knob's mapped range matches the preset specification:

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Set DRIVE to max | Check Compressor Input Gain readout matches preset's Max value |
| 2 | Set BASS to max | Check Channel EQ Low Shelf readout shows +6 dB |
| 3 | Set BASS to min | Check Channel EQ Low Shelf readout shows -6 dB |
| 4 | Set TREBLE to max/min | Same: ±6 dB |
| 5 | Set DYNAMICS to full left | Check Compressor Attack shows fastest value for this preset |
| 6 | Set DYNAMICS to full left | Check Compressor Release shows fastest value for this preset |
| 7 | Set DYNAMICS to full right | Check Attack and Release show slowest values |
| 8 | Set WIDTH to max | Check Direction Mixer Spread matches preset's max (1.5 or 2.0) |
| 9 | Set SPACE to max | Check Reverb Mix matches preset's max percentage |
| 10 | Set OUTPUT to min/max | Check Gain readout shows -12 dB / +6 dB |

---

## Phase 2: Integration Tests

### 2.1 Full Chain A/B Test

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Load the preset on a track with program material | Preset loads correctly |
| 2 | Set all knobs to default | Unity gain, minimal coloration |
| 3 | Bypass the entire channel strip | Compare dry vs processed |
| 4 | Adjust OUTPUT until processed matches dry loudness | Levels match within ±0.5 dB |
| 5 | Evaluate tonal difference | Processed should sound "better" (cleaner, more focused) without artifacts |

### 2.2 Multi-Knob Interaction Tests

Test these specific knob combinations that produce compounding effects:

| Test | Knobs | Expected Result |
|------|-------|-----------------|
| Heavy compression | DRIVE max + COMPRESS 100% + DYNAMICS left (Punch) | Aggressive, snappy compression — usable, not distorted |
| Heavy sustain | DRIVE max + COMPRESS 100% + DYNAMICS right (Sustain) | Heavy, smooth leveling — usable, not pumping |
| Compression bypass verify | COMPRESS 0% + DRIVE any + DYNAMICS any | Identical sound regardless of DRIVE/DYNAMICS positions |
| Maximum spatial | SPACE max + WIDTH max | Very wet, very wide — dramatic but not broken |
| Tone extremes | BASS max + TREBLE max | Scooped mid with boosted extremes — unusual but not distorted |
| Tone + compression | BASS max + DRIVE max + COMPRESS 100% | Low shelf boost feeding into compression — verify no pumping |
| Full everything | All knobs at max | Very heavily processed — verify no digital clipping |

### 2.3 Preset Switching Test

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Load MPD-CLA-HI-MID | Preset loads correctly |
| 2 | Set several knobs to non-default positions | Parameters respond correctly |
| 3 | Switch to MPD-CLA-HIGH (load new preset) | New preset loads cleanly |
| 4 | Verify knob labels update | Should show same 8 labels (they're identical) |
| 5 | Verify ranges update | DRIVE, SPACE, DYNAMICS ranges should differ between presets |
| 6 | Return to MPD-CLA-HI-MID | Original preset loads correctly |

---

## Phase 3: Mono Compatibility Tests

### 3.1 Direction Mixer Mono Fold-Down

This is the most critical test for production use. Many playback systems sum stereo to mono (club PAs, phone speakers, broadcast).

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Set WIDTH to center (Spread = 1.0) | Normal stereo image |
| 2 | Insert a **Gain** plugin on the master output, set to mono | Signal sums to mono |
| 3 | A/B the stereo vs mono versions | Mono version should sound like the stereo version "narrowed," NOT like content is missing |
| 4 | Set WIDTH to max (Spread = 1.5 or 2.0) | Wide stereo image |
| 5 | Sum to mono again | Side content is lost (expected), but center content is fully preserved |
| 6 | Verify no frequency notches or comb filtering | Mono signal should be tonally consistent, not thin or hollow |

**Pass criteria:** At ANY WIDTH position, summing to mono produces no phase cancellation, no comb filtering, and no tonal artifacts. Only stereo width information is lost — all center content is preserved.

### 3.2 Correlation Meter Validation

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Insert a **Correlation Meter** plugin (or use Logic's MultiMeter) | Correlation meter visible |
| 2 | Set WIDTH to center | Correlation ≈ source material's native correlation |
| 3 | Set WIDTH to max | Correlation decreases but stays **positive** (above 0) |
| 4 | Test with various source material | Correlation never goes negative (anti-phase) |

**Target values:**

| WIDTH Position | Correlation Range |
|---------------|-------------------|
| Minimum (narrow/mono) | 0.8 – 1.0 |
| Center (unity) | Source-dependent (typically 0.3 – 0.8) |
| Maximum (wide) | 0.1 – 0.5 (positive, never negative) |

### 3.3 Reverb + Width Interaction

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Set SPACE to max | Full reverb |
| 2 | Set WIDTH to max | Full widening applied to reverbed signal |
| 3 | Sum to mono | Reverb tail narrows but remains audible and clean |
| 4 | Verify no artifacts | Reverb in mono should sound like "a quieter reverb," not "a broken reverb" |

---

## Phase 4: Performance Tests

### 4.1 CPU Load Benchmarks

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open Logic's CPU meter (customize toolbar) | CPU usage visible |
| 2 | Load one instance of the preset on a single track | Record CPU baseline |
| 3 | Play program material through the preset | Note peak CPU usage |
| 4 | Load 8 instances across 8 tracks | Record peak CPU |
| 5 | Load 16 instances across 16 tracks | Record peak CPU |

**Target benchmarks (approximate, varies by Mac hardware):**

| Configuration | Target CPU |
|--------------|-----------|
| 1 instance | < 2% of total CPU |
| 8 instances | < 12% of total CPU |
| 16 instances | < 20% of total CPU |

**Note:** These are stock Logic plugins — CPU usage should be minimal. If any preset exceeds these targets, investigate whether a specific plugin (likely ChromaVerb or Space Designer) is causing excessive load.

### 4.2 Plugin Count by Preset

| Preset | Plugin Count | Notes |
|--------|-------------|-------|
| SUB | 6 | Lightest chain |
| LO-MID | 7 | Standard chain |
| HI-MID | 8 | Heaviest — includes DeEsser + Tape Delay + Exciter |
| HIGH | 8 | Same as HI-MID |
| AIR | 7 | No Tape Delay |

### 4.3 Latency Check

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Check Logic's channel strip latency indicator | Note total latency |
| 2 | Verify latency compensation is enabled | Logic > Preferences > Audio > General |
| 3 | Record through the preset | No audible timing offset |

**Note:** Logic's Plugin Delay Compensation (PDC) handles all latency automatically. Only verify that it's enabled and that total latency is not excessive (>10ms would be unusual for stock plugins).

---

## Source Material Requirements

### Recommended Test Signals

| Signal | Purpose | How to Generate |
|--------|---------|----------------|
| Pink noise at -18 dBFS | Level calibration, frequency response verification | Logic Test Oscillator plugin |
| Sine sweep (20 Hz – 20 kHz) | Frequency response verification, resonance detection | Logic Test Oscillator or external generator |
| White noise at -18 dBFS | Compression behavior testing | Logic Test Oscillator plugin |

### Recommended Program Material

Test each preset with at least 3 different real-world recordings:

| Preset | Recommended Source 1 | Recommended Source 2 | Recommended Source 3 |
|--------|---------------------|---------------------|---------------------|
| SUB | 808 kick loop | Sustained bass synth note | Upright bass recording |
| LO-MID | Fingerstyle bass guitar | Piano left hand | Male vocal (chest) |
| HI-MID | Lead vocal | Snare drum | Electric guitar (clean) |
| HIGH | Vocal with sibilance | Acoustic guitar pick | Cymbal close-mic |
| AIR | Female vocal (breathy) | Orchestral strings (bow noise) | Drum overhead pair |

---

## Regression Testing

After modifying any plugin setting, re-run:

| Change Made | Tests to Re-Run |
|-------------|----------------|
| Changed EQ frequency or gain | Phase 1.2 (BASS/TREBLE sweep), Phase 2.1 (A/B) |
| Changed compressor ratio/attack/release | Phase 1.2 (DYNAMICS sweep), Phase 2.2 (multi-knob interaction) |
| Changed reverb algorithm or decay | Phase 1.2 (SPACE sweep), Phase 3.3 (reverb + width) |
| Changed Direction Mixer range | Phase 3 (all mono compatibility tests) |
| Changed any Smart Control mapping | Phase 1.3 (range boundary), Phase 2.3 (preset switching) |
| Changed insert chain order | All tests (full regression) |

---

## Traceability

| This Spec Section | Source Document |
|--------------------|----------------|
| Knob sweep tests | [TESTING-CHECKLIST.md](../TESTING-CHECKLIST.md) — Smart Control Sweep Tests |
| Dynamics interaction tests | [TESTING-CHECKLIST.md](../TESTING-CHECKLIST.md) — Dynamics Section Tests |
| Mono compatibility tests | [TESTING-CHECKLIST.md](../TESTING-CHECKLIST.md) — Width / Mono Compatibility Tests |
| Level budget references | [spec/signal-flow.md](signal-flow.md) — Per-Preset Level Budgets |
| Parameter ranges | [presets/](../presets/) — Smart Control Mapping tables |
