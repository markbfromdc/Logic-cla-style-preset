# Testing Checklist — MPD-CLA Presets

Run through this checklist for **each** of the 5 presets after building.

---

## Per-Preset QA

### Preset: _______________

#### Smart Control Sweep Tests

- [ ] **SENSITIVITY** — sweeps full range without digital overs on output meter
- [ ] **BASS** — audible low shelf boost/cut, no rumble at max
- [ ] **TREBLE** — audible high shelf boost/cut, no harshness at max
- [ ] **COMPRESS** — at 100% sounds usable (aggressive but not destroyed)
- [ ] **REVERB** — at max does not completely wash out the source
- [ ] **DELAY** — at max does not completely wash out the source
- [ ] **PITCH** — at max sounds like subtle doubling, not chorusy artifacts
- [ ] **OUTPUT** — can compensate for loudness added by all other processing

#### Signal Integrity

- [ ] All 8 knobs at default (0/min) = clean pass-through, near unity gain
- [ ] Sensitivity at max + Compress at 100% = heavy but usable compression
- [ ] No unexpected noise floor increase with all effects at 0%
- [ ] Bypass all plugins: confirms signal passes clean

#### A/B Testing

- [ ] Processed version loudness-matched to dry via OUTPUT knob
- [ ] A/B comparison shows clear tonal improvement without artifacts
- [ ] Test with source recording 1: _____________
- [ ] Test with source recording 2: _____________
- [ ] Test with source recording 3: _____________

#### Save Verification

- [ ] Saved as Channel Strip Setting (.cst) in `MPD-CLA/` folder
- [ ] Saved as Patch (.patch) in `MPD-CLA/` folder
- [ ] Reloaded .cst — all plugin settings intact
- [ ] Reloaded .patch — Smart Control labels and mappings intact
- [ ] All knob ranges verified after reload

---

## Preset-Specific Checks

### MPD-CLA-VOX
- [ ] DeEsser catches sibilance on "s" and "t" sounds
- [ ] Exciter adds presence without harshness
- [ ] Tape Delay at 110ms feels like a natural slap, not an echo
- [ ] ChromaVerb Plate sounds smooth, not metallic

### MPD-CLA-BASS
- [ ] HPF at 30 Hz removes sub rumble without thinning the tone
- [ ] Pedalboard saturation adds grit audible on small speakers
- [ ] Opto compressor is transparent — no pumping artifacts
- [ ] Low delay/reverb max values prevent muddiness

### MPD-CLA-DRUM
- [ ] FET smash at high Sensitivity creates the "pumping" drum bus sound
- [ ] Enveloper recovers transient snap after heavy compression
- [ ] Room verb sounds like a real drum room, not a hall
- [ ] Ensemble adds width without obvious pitch modulation

### MPD-CLA-GTR
- [ ] LPF at 12 kHz tames fizz without killing presence
- [ ] Dotted 1/8 delay syncs properly to host tempo
- [ ] Hall verb provides depth without pushing guitar back in mix
- [ ] VCA compression preserves pick attack dynamics

### MPD-CLA-UNPLG
- [ ] Opto compression is barely noticeable — just levels out dynamics
- [ ] Space Designer IR sounds natural and room-like
- [ ] Exciter adds "air" above 5 kHz without artificial shimmer
- [ ] Chorus at max provides stereo width, not obvious modulation

---

## Final Sign-Off

| Preset | Chain OK | Smart Controls OK | .cst Saved | .patch Saved | QA Pass |
|--------|----------|-------------------|------------|--------------|---------|
| MPD-CLA-VOX | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-BASS | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-DRUM | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-GTR | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-UNPLG | [ ] | [ ] | [ ] | [ ] | [ ] |
