# Version History & Change Log

**Last Updated:** 2026-03-31

---

## Version 2.0 — Frequency-Domain Redesign (Current)

**Date:** 2026-03-31

### Summary

Complete redesign from instrument-based presets to frequency-domain presets. Added dynamics character control (DYNAMICS knob) and mono-safe stereo width control (WIDTH knob).

### Changes

#### Presets Removed
- MPD-CLA-VOX (vocal)
- MPD-CLA-BASS (bass)
- MPD-CLA-DRUM (drums)
- MPD-CLA-GTR (guitar)
- MPD-CLA-UNPLG (acoustic/unplugged)

#### Presets Added
- **MPD-CLA-SUB** — 20–80 Hz (sub-bass)
- **MPD-CLA-LO-MID** — 80–500 Hz (low-mid body)
- **MPD-CLA-HI-MID** — 500 Hz–2 kHz (high-mid presence)
- **MPD-CLA-HIGH** — 2–8 kHz (high clarity)
- **MPD-CLA-AIR** — 8–20 kHz (air/shimmer)

#### Smart Control Layout Changes

| Knob | v1.0 Label | v2.0 Label | Change |
|------|-----------|-----------|--------|
| 1 | SENSITIVITY | DRIVE | Renamed (same function: Compressor Input Gain) |
| 2 | BASS | BASS | Unchanged |
| 3 | TREBLE | TREBLE | Unchanged |
| 4 | COMPRESS | COMPRESS | Unchanged |
| 5 | REVERB | DYNAMICS | **Replaced** — now controls Attack + Release (dual-parameter) |
| 6 | DELAY | WIDTH | **Replaced** — now controls Direction Mixer Spread |
| 7 | PITCH | SPACE | **Replaced** — now controls reverb mix (was Chorus/Ensemble mix) |
| 8 | OUTPUT | OUTPUT | Unchanged |

#### New Plugins Added to Chain
- **Direction Mixer** — added to all 5 presets for mono-safe stereo width control
- **DeEsser 2** — added to HI-MID, HIGH, AIR for harshness control

#### Plugins Removed from Macro Control
- **Chorus/Ensemble** — no longer macro'd (some presets have fixed chorus)
- **Tape Delay** — no longer macro'd (some presets have fixed delay)

#### Architecture Changes
- All presets now include HPF and/or LPF to focus on their target frequency band
- Compressor circuit types are assigned by frequency band, not instrument
- Reverb algorithms are selected by frequency band characteristics
- DYNAMICS knob provides Punch ↔ Sustain morphing via dual-parameter Smart Control mapping

### Rationale

Instrument-based presets force users to match a preset to a source category. A pad synth doesn't fit neatly into "bass" or "guitar." Frequency-domain presets let users apply processing based on what they hear (frequency content) rather than what they know (instrument name). This is more intuitive for experienced engineers and more educational for beginners — it teaches them to think in terms of frequency, not instrument labels.

---

## Version 1.0 — Instrument-Based Presets (Superseded)

**Date:** 2026-03-31 (initial commit)

### Summary

Initial implementation with 5 instrument-based presets inspired by the CLA Signature Series plugin workflow.

### Presets

| Preset | Target | Compressor | Insert Count |
|--------|--------|------------|-------------|
| MPD-CLA-VOX | Lead/background vocals | FET 4:1 | 8 |
| MPD-CLA-BASS | Electric/synth bass | Opto 3:1 | 7 |
| MPD-CLA-DRUM | Drum bus/percussion | FET 8:1 | 7 |
| MPD-CLA-GTR | Electric guitar | VCA 3:1 | 7 |
| MPD-CLA-UNPLG | Acoustic instruments | Opto 2.5:1 | 7 |

### Smart Control Layout (v1.0)

| Knob | Label | Target |
|------|-------|--------|
| 1 | SENSITIVITY | Compressor Input Gain |
| 2 | BASS | Channel EQ Low Shelf Gain |
| 3 | TREBLE | Channel EQ High Shelf Gain |
| 4 | COMPRESS | Compressor Mix |
| 5 | REVERB | Reverb Mix |
| 6 | DELAY | Delay Mix |
| 7 | PITCH | Chorus/Ensemble Mix |
| 8 | OUTPUT | Gain Output |

### Status

**Superseded** by v2.0. All v1.0 preset files have been removed from the repository. The v1.0 design is documented here for historical reference only.

---

## Traceability

| Version | Commit | Branch |
|---------|--------|--------|
| 1.0 | `02f9892` | claude/cla-logic-channel-strip-uGr4F |
| 2.0 | `c46f8b0` | claude/cla-logic-channel-strip-uGr4F |
| 2.0.1 (SUB fix) | `701446b` | claude/cla-logic-channel-strip-uGr4F |
