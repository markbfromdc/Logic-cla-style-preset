# Testing Checklist — MPD-CLA Frequency-Domain Presets v3.0

Run through this checklist for **each** preset after building.

---

## Per-Preset QA (Track Presets)

### Preset: _______________

#### Smart Control Sweep Tests

- [ ] **DRIVE** — sweeps full range without digital overs on output meter
- [ ] **BASS** — audible low shelf boost/cut within the preset's frequency range
- [ ] **TREBLE** — audible high shelf boost/cut within the preset's frequency range
- [ ] **DYNAMICS** — 0% = expanded/transient-boosted feel (Enveloper only), 100% = full compression
- [ ] **DYNAMICS** — 50% center gives natural parallel compression blend
- [ ] **COLOR** — sweeps from clean (0%) to full saturation/exciter effect (100%)
- [ ] **WIDTH full left (Narrow)** — image collapses toward mono center
- [ ] **WIDTH full right (Wide)** — expanded stereo spread, sounds natural
- [ ] **WIDTH center** — unity stereo, no change from original image
- [ ] **SPACE** — at max does not completely wash out the source
- [ ] **OUTPUT** — can compensate for loudness added by all other processing

#### Dynamics Section Tests

- [ ] DRIVE at max + DYNAMICS 0% = dry signal with Enveloper transient boost (no compression)
- [ ] DRIVE at max + DYNAMICS 100% = heavy compression fully engaged
- [ ] DYNAMICS sweep from 0% to 100% = smooth crossfade between expanded and compressed
- [ ] DYNAMICS at 50% = audible parallel compression character

#### Color Section Tests

- [ ] COLOR at 0% = clean, no harmonic coloring
- [ ] COLOR at 100% = full saturation/exciter effect, no digital artifacts
- [ ] COLOR sweep = smooth transition, no clicks or jumps

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
- [ ] DYNAMICS knob controls Compressor Mix after reload
- [ ] COLOR knob controls Exciter/Pedalboard Mix after reload
- [ ] WIDTH knob still controls Direction Mixer Spread after reload

---

## Preset-Specific Checks

### MPD-CLA-SUB (20–80 Hz)
- [ ] LPF at 250 Hz correctly isolates sub content
- [ ] Pedalboard saturation adds harmonics audible on small speakers
- [ ] Opto compressor is smooth — no pumping artifacts on sub content
- [ ] ChromaVerb at max (20%) stays tight, no low-end wash
- [ ] WIDTH at mono (0.0) produces clean centered sub — critical for club/PA systems
- [ ] COLOR controls Pedalboard Mix (not Exciter) for this preset

### MPD-CLA-LO-MID (80–500 Hz)
- [ ] HPF at 60 Hz removes sub rumble without thinning body
- [ ] LPF at 2 kHz rolls off gently, no harsh cutoff
- [ ] Exciter adds warmth at 150/400 Hz without muddiness
- [ ] Tape delay thickening (fixed 10%) is subtle, not echoey
- [ ] Opto compression preserves natural dynamics feel

### MPD-CLA-HI-MID (500 Hz–2 kHz)
- [ ] DeEsser at 1.8 kHz catches harshness without dulling midrange
- [ ] FET compression with DYNAMICS at 100% = aggressive midrange compression
- [ ] Exciter at 800 Hz / 1.5 kHz adds presence without harshness
- [ ] Plate reverb stays in the mid-frequency range (400 Hz–4 kHz band-limited)
- [ ] Most complex chain — verify no latency or gain staging issues

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

## Bus Preset Checklist

### Bus Preset: _______________

- [ ] All 8 knobs mapped and labeled correctly (DRIVE, BASS, TREBLE, DYNAMICS, COLOR, WIDTH, SPACE, OUTPUT)
- [ ] DYNAMICS 0% = expanded (Enveloper transient shaping only)
- [ ] DYNAMICS 100% = bus glue compression fully engaged
- [ ] DRIVE range is conservative — no clipping on summed signal
- [ ] WIDTH mono-fold test passes on the bus output
- [ ] Saved as .cst in `MPD-CLA/Bus/` folder
- [ ] Saved as .patch in `MPD-CLA/Bus/` folder
- [ ] Reloaded — all mappings intact

---

## FX Send Preset Checklist

### FX Send Preset: _______________

- [ ] All 8 knobs mapped and labeled correctly
- [ ] FX return is 100% wet — dry/wet balance controlled by send level
- [ ] DYNAMICS controls compression on the effect return signal
- [ ] COLOR shapes the character of the FX (e.g., exciter on reverb return)
- [ ] SPACE controls secondary effect parameter per spec
- [ ] No feedback loops or gain runaway at extreme settings
- [ ] Saved as .cst in `MPD-CLA/FX-Send/` folder
- [ ] Saved as .patch in `MPD-CLA/FX-Send/` folder
- [ ] Reloaded — all mappings intact

---

## Mastering Preset Checklist

### Mastering Preset: _______________

- [ ] All 8 knobs mapped and labeled correctly
- [ ] DYNAMICS 0% = open/expanded master (minimal compression)
- [ ] DYNAMICS 100% = glue compression fully engaged
- [ ] Processing is transparent — no artifacts on full-bandwidth material
- [ ] OUTPUT knob controls final ceiling; true-peak levels stay below limit
- [ ] WIDTH adjustments are subtle and mono-safe
- [ ] A/B against unprocessed mix shows improvement without degradation
- [ ] Saved as .cst in `MPD-CLA/Mastering/` folder
- [ ] Saved as .patch in `MPD-CLA/Mastering/` folder
- [ ] Reloaded — all mappings intact

---

## Final Sign-Off

### Track Presets

| Preset | Chain OK | Smart Controls OK | DYNAMICS OK | COLOR OK | WIDTH OK | Mono-Safe | .cst | .patch | QA Pass |
|--------|----------|-------------------|-------------|----------|----------|-----------|------|--------|---------|
| MPD-CLA-SUB | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-LO-MID | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-HI-MID | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-HIGH | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| MPD-CLA-AIR | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |

### Bus Presets

| Preset | Chain OK | Smart Controls OK | DYNAMICS OK | COLOR OK | WIDTH OK | Mono-Safe | .cst | .patch | QA Pass |
|--------|----------|-------------------|-------------|----------|----------|-----------|------|--------|---------|
| Bus 1: _______ | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Bus 2: _______ | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Bus 3: _______ | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |

### FX Send Presets

| Preset | Chain OK | Smart Controls OK | DYNAMICS OK | COLOR OK | WIDTH OK | Mono-Safe | .cst | .patch | QA Pass |
|--------|----------|-------------------|-------------|----------|----------|-----------|------|--------|---------|
| FX Send 1: _______ | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| FX Send 2: _______ | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| FX Send 3: _______ | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |

### Mastering Presets

| Preset | Chain OK | Smart Controls OK | DYNAMICS OK | COLOR OK | WIDTH OK | Mono-Safe | .cst | .patch | QA Pass |
|--------|----------|-------------------|-------------|----------|----------|-----------|------|--------|---------|
| Mastering 1: _______ | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Mastering 2: _______ | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |

**All presets must pass QA before v3.0 release.**
