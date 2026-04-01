# Test Data — MUSDB Stems Dataset

## Primary Dataset

**Dataset:** `danjacobellis/MUSDB_stems_stable_audio_fp16`
**Source:** [Hugging Face](https://huggingface.co/datasets/danjacobellis/MUSDB_stems_stable_audio_fp16)
**Based on:** MUSDB18 — the standard reference dataset for music source separation

### About MUSDB18

MUSDB18 is a corpus of 150 full-length stereo music tracks (~10 hours) across multiple genres, each with isolated stems:

| Stem Index | Stem | Content |
|------------|------|---------|
| 0 | Mixture | Full mix (sum of all stems) |
| 1 | Drums | Isolated drum/percussion tracks |
| 2 | Bass | Isolated bass tracks |
| 3 | Other | All other accompaniment (guitars, keys, synths, etc.) |
| 4 | Vocals | Isolated vocal tracks |

- **150 tracks** (100 training / 50 test split)
- **Stereo** at 44.1 kHz
- **Genres:** Pop, rock, electronic, hip-hop, metal, and more
- **Sources:** DSD100 (100 tracks), MedleyDB (46 tracks), Native Instruments (2 tracks), The Easton Ellises (2 tracks)

### This Variant

`MUSDB_stems_stable_audio_fp16` contains the MUSDB stems encoded through Stable Audio's VAE in fp16 (half-precision floating point). This provides:

- Compressed latent representations of each stem
- fp16 precision for efficient storage and processing
- Stable Audio-compatible format for generative audio workflows

### Loading the Dataset

```python
from datasets import load_dataset

dataset = load_dataset("danjacobellis/MUSDB_stems_stable_audio_fp16")
```

---

## Mapping Stems to Presets

Each MUSDB stem maps naturally to one or more frequency-domain presets for testing:

| Stem | Primary Preset | Secondary Preset | Why |
|------|---------------|-----------------|-----|
| **Drums** | MPD-CLA-SUB | MPD-CLA-HI-MID | Kick fundamentals live in SUB; snare crack and cymbal presence in HI-MID |
| **Bass** | MPD-CLA-SUB | MPD-CLA-LO-MID | Bass fundamentals in SUB; harmonics and finger/pick attack in LO-MID |
| **Vocals** | MPD-CLA-HI-MID | MPD-CLA-AIR | Vocal body and presence in HI-MID; breath and air in AIR |
| **Other** | MPD-CLA-LO-MID | MPD-CLA-HIGH | Guitar/keys body in LO-MID; clarity and edge in HIGH |
| **Mixture** | All 5 | — | Full mix tests all presets in context |

### Recommended Test Workflow

1. **Load a track's stems** from the dataset
2. **Apply the primary preset** to each stem individually
3. **Sweep all 8 knobs** on each stem to verify the preset responds appropriately
4. **Test DYNAMICS** (Punch ↔ Sustain) on the drums stem — most dramatic difference
5. **Test WIDTH** mono fold-down on the mixture — most critical for real-world playback
6. **Sum the processed stems** and compare to the original mixture
7. **Repeat with 3+ tracks** from different genres

### Suggested Test Tracks

Select tracks that cover different genres and production styles:

| Track # | Genre | Good For Testing |
|---------|-------|-----------------|
| 1–3 | Pop/Rock | Standard vocal + guitar + drums — covers all 5 presets |
| 4–6 | Electronic | Synth bass + pads — tests SUB and AIR presets with sustained content |
| 7–9 | Hip-Hop | 808s + vocal processing — tests SUB preset's Pedalboard saturation |
| 10+ | Metal/Acoustic | Extremes of dynamics and frequency content |

---

## Additional Test Sources

For testing beyond MUSDB stems, these signals are also recommended:

| Signal | Source | Purpose |
|--------|--------|---------|
| Pink noise at -18 dBFS | Logic Test Oscillator | Level calibration, frequency response |
| Sine sweep (20 Hz–20 kHz) | Logic Test Oscillator | Resonance detection, filter verification |
| White noise at -18 dBFS | Logic Test Oscillator | Compression behavior testing |

---

## Related Datasets

| Dataset | URL | Notes |
|---------|-----|-------|
| `danjacobellis/musdb18HQ` | [Hugging Face](https://huggingface.co/datasets/danjacobellis/musdb18HQ) | Uncompressed full-quality MUSDB18 stems (WAV) |
| `danjacobellis/musdb` | [Hugging Face](https://huggingface.co/datasets/danjacobellis/musdb) | Standard MUSDB18 in parquet format |
| MUSDB18 (original) | [Zenodo](https://zenodo.org/records/1117372) | Original dataset in NI STEMS format (.mp4) |
| MUSDB18-HQ (original) | [Zenodo](https://zenodo.org/records/3338373) | Full-bandwidth uncompressed version |

---

## License

MUSDB18 is provided for **educational purposes only**. The material should not be used for any commercial purpose without the express permission of the copyright holders. Source tracks are licensed under various Creative Commons licenses (CC BY-NC-SA 3.0/4.0).

---

## Traceability

| This Document | Links To |
|---------------|----------|
| Stem-to-preset mapping | [presets/](../presets/) — frequency-domain preset specs |
| Test workflow | [TESTING-CHECKLIST.md](../TESTING-CHECKLIST.md) — A/B Testing section |
| Detailed test protocols | [spec/testing-protocols.md](testing-protocols.md) — Source Material Requirements |
