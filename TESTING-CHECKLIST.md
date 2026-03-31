# Testing Checklist — MPD-CLA Frequency-Domain Presets

Run through this checklist for **each** of the 5 presets after building.

---

## Per-Preset QA

### Preset: _______________

#### Smart Control Sweep Tests

- [ ] **DRIVE** — sweeps full range without digital overs on output meter
- [ ] **BASS** — audible low shelf boost/cut within the preset's frequency range
- [ ] **TREBLE** — audible high shelf boost/cut within the preset's frequency range
- [ ] **COMPRESS** — at 100% sounds usable (aggressive but not destroyed)
- [ ] **DYNAMICS full left (Punch)** — audible transient snap, aggressive attack
- [ ] **DYNAMICS full right (Sustain)** — smooth leveling, no transient bite
- [ ] **DYNAMICS center** — balanced default feel, matches preset's home position
- [ ] **WIDTH full left (Narrow)** — image collapses toward mono center
- [ ] **WIDTH full right (Wide)** — expanded stereo spread, sounds natural
- [ ] **WIDTH center** — unity stereo, no change from original image
- [ ] **SPACE** — at max does not completely wash out the source
- [ ] **OUTPUT** — can compensate for loudness added by all other processing

#### Dynamics Section Tests

- [ ] DRIVE at max + DYNAMICS full left (Punch) = snappy, aggressive compression
- [ ] DRIVE at max + DYNAMICS full right (Sustain) = heavy but smooth leveling
- [ ] COMPRESS at 0% + DYNAMICS sweep = no audible change (compression bypassed via mix)
- [ ] COMPRESS at 100% + DYNAMICS sweep = full range of character heard clearly

#### Width / Mono Compatibility Tests

- [ ] WIDTH at max → sum to mono in Logic output: **no phase cancellation**
- [ ] WIDTH at max → check correlation meter: stays positive (no anti-phase)
- [ ] WIDTH at min → image is centered, no artifacts
- [ ] WIDTH sweep → smooth transition, no clicks or jumps
- [ ] A/B: WIDTH at center vs bypassing Direction Mixer = identical sound

#### Signal Integrity

- [ ] All 8 knobs at default = clean pass-through, near unity gain
- [ ] No unexpected noise floor increase with all effects at 0%
- [ ] Bypass all plugins: confirms signal passes clean
- [ ] EQ HPF/LPF correctly focuses on the preset's target frequency range

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
- [ ] DYNAMICS knob still controls both Attack AND Release after reload
- [ ] WIDTH knob still controls Direction Mixer Spread after reload

---

## Preset-Specific Checks

### MPD-CLA-SUB (20–80 Hz)
- [ ] LPF at 250 Hz correctly isolates sub content
- [ ] Pedalboard saturation adds harmonics audible on small speakers
- [ ] Opto compressor is smooth — no pumping artifacts on sub content
- [ ] ChromaVerb at max (20%) stays tight, no low-end wash
- [ ] WIDTH at mono (0.0) produces clean centered sub — critical for club/PA systems

### MPD-CLA-LO-MID (80–500 Hz)
- [ ] HPF at 60 Hz removes sub rumble without thinning body
- [ ] LPF at 2 kHz rolls off gently, no harsh cutoff
- [ ] Exciter adds warmth at 150/400 Hz without muddiness
- [ ] Tape delay thickening (fixed 10%) is subtle, not echoey
- [ ] Opto compression preserves natural dynamics feel

### MPD-CLA-HI-MID (500 Hz–2 kHz)
- [ ] DeEsser at 1.8 kHz catches harshness without dulling midrange
- [ ] FET compression with DYNAMICS at Punch = aggressive midrange snap
- [ ] Exciter at 800 Hz / 1.5 kHz adds presence without harshness
- [ ] Plate reverb stays in the mid-frequency range (400 Hz–4 kHz band-limited)
- [ ] Most complex chain (8 inserts) — verify no latency or gain staging issues

### MPD-CLA-HIGH (2–8 kHz)
- [ ] DeEsser at 5.5 kHz catches sibilance on vocal material
- [ ] VCA compression is transparent — preserves high-frequency detail
- [ ] Dotted 1/8 delay syncs properly to host tempo
- [ ] Hall verb provides depth without pushing highs back in mix
- [ ] LPF at 12 kHz prevents air-band bleed into this preset's range

### MPD-CLA-AIR (8–20 kHz)
- [ ] HPF at 6 kHz cleanly isolates air content
- [ ] DeEsser at 10 kHz tames digital harshness/aliasing
- [ ] Exciter shimmer (30% fixed) adds sparkle without artificial artifacts
- [ ] Plate reverb with 2.0s decay creates lush shimmer tail
- [ ] VCA compression is barely perceptible — just controlling air dynamics
- [ ] DRIVE limited to +10 dB max — prevents over-driving delicate content

---

## Final Sign-Off

| Preset | Chain OK | Smart Controls OK | DYNAMICS OK | WIDTH OK | Mono-Safe | .cst | .patch | QA Pass |
|--------|----------|-------------------|-------------|----------|-----------|------|--------|---------|
| MPD-CLA-SUB | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-LO-MID | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-HI-MID | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-HIGH | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-AIR | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
