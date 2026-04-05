# Plugin Settings Rationale — Audio Engineering Design Decisions

**Version:** 3.0
**Last Updated:** 2026-04-05
**Applies to:** All MPD-CLA presets (mixing, bus, FX send, mastering)

---

## Channel EQ Decisions

### HPF/LPF Frequency Selection

Each preset uses HPF and LPF to create a **focus zone** around its target frequency band:

| Preset | HPF | LPF | Focus Zone | Design Intent |
|--------|-----|-----|-----------|---------------|
| SUB | Off | 250 Hz, 12 dB/oct | 20–250 Hz | No HPF — we want ALL sub content. LPF at 250 Hz prevents mid-frequency bleed that would muddy the processing. |
| LO-MID | 60 Hz, 18 dB/oct | 2 kHz, 6 dB/oct | 60–2000 Hz | Steep HPF removes sub rumble that would eat headroom. Gentle LPF slope (6 dB/oct) allows natural harmonic content above 500 Hz. |
| HI-MID | 400 Hz, 12 dB/oct | 5 kHz, 6 dB/oct | 400–5000 Hz | HPF removes low-mid content that would trigger the FET compressor inappropriately. Gentle LPF allows presence harmonics through. |
| HIGH | 1.5 kHz, 12 dB/oct | 12 kHz, 6 dB/oct | 1.5–12 kHz | HPF ensures only high-frequency content drives the VCA. LPF at 12 kHz prevents air-band bleed (that's AIR preset's territory). |
| AIR | 6 kHz, 12 dB/oct | Off | 6–20+ kHz | Steep HPF isolates air content. No LPF — we want all ultra-high content preserved. |

### HPF Slope Selection

| Slope | Where Used | Why |
|-------|-----------|-----|
| 18 dB/oct | LO-MID | Aggressive sub removal — sub content belongs in the SUB preset, not here |
| 12 dB/oct | HI-MID, HIGH, AIR | Standard slope — clean separation without ringing or phase issues |
| Off | SUB | Sub content IS the target — no HPF |

### Fixed Mid Cut/Boost Rationale

Every preset has fixed mid-frequency adjustments that are NOT macro'd. These are "set and forget" corrections for common problems in each frequency range:

| Preset | Cut/Boost | Frequency | Gain | Q | Purpose |
|--------|-----------|-----------|------|---|---------|
| SUB | Cut | 200 Hz | -2 dB | 1.5 | Removes "mud" harmonics above the sub fundamental. Without this, the Pedalboard's added harmonics can create buildup at 200 Hz. |
| LO-MID | Boost | 250 Hz | +1 dB | 1.0 | Reinforces the "body center" — the warm fundamental range for most instruments. This is where chest resonance, guitar body, and piano warmth live. |
| LO-MID | Cut | 600 Hz | -1.5 dB | 1.5 | Removes "honk" — the nasal, boxy quality that accumulates when multiple low-mid sources stack. |
| HI-MID | Cut | 800 Hz | -1 dB | 2.0 | Reduces nasality. 800 Hz is the "telephone" frequency — pleasant in isolation but problematic in dense mixes. |
| HI-MID | Boost | 1.5 kHz | +1.5 dB | 1.0 | Enhances the "presence center" — vocal intelligibility, snare crack, guitar attack all live here. |
| HIGH | Cut | 3.5 kHz | -1 dB | 2.0 | Tames harshness. 3.5 kHz is where the ear is most sensitive (ear canal resonance). A small cut here prevents listener fatigue. |
| HIGH | Boost | 5 kHz | +1 dB | 0.8 | Enhances clarity. 5 kHz adds "definition" without the harshness of 3.5 kHz. Wide Q (0.8) keeps it natural. |
| AIR | Boost | 10 kHz | +1.5 dB | 0.7 | The "air center" — this is what makes recordings sound open, expensive, and hi-fi. Wide Q for a natural shelf-like feel. |

---

## Compressor Design Decisions

### Circuit Type Selection

| Circuit | Analog Model | Character | Presets | Why |
|---------|-------------|-----------|---------|-----|
| **Opto** | LA-2A style | Smooth, program-dependent, gentle | SUB, LO-MID | Low frequencies have long wavelengths. Opto's inherently slow, program-dependent response avoids pumping artifacts that faster compressors would create on sustained bass notes. The "soft" character preserves the natural feel of body and warmth. |
| **FET** | 1176 style | Aggressive, colored, characterful | HI-MID | Midrange is where "energy" and "attitude" live. FET's aggressive coloration adds harmonic density that makes midrange content cut through a mix. The DYNAMICS knob morphs this from brutal punch to smooth sustain, giving maximum range from one compressor type. |
| **VCA** | SSL/dbx style | Precise, transparent, fast | HIGH, AIR | High frequencies are where listener perception is most acute. Any compressor coloration would be immediately obvious as artifacts. VCA's clean, transparent character shapes dynamics without adding unwanted harmonics or altering the tonal balance. |

### Ratio Selection

| Preset | Ratio | Why |
|--------|-------|-----|
| SUB (4:1) | Medium — sub content needs control but not limiting. Higher ratios cause audible "ducking" on sub frequencies. |
| LO-MID (3:1) | Gentle — body/warmth content sounds unnatural when heavily compressed. 3:1 levels out dynamics without squashing. |
| HI-MID (4:1) | Medium-aggressive — midrange benefits from assertive control. 4:1 with the FET circuit creates the classic "compressed vocal/snare" sound. |
| HIGH (3:1) | Moderate — enough control for transients without destroying high-frequency detail. Higher ratios would make highs sound "dull." |
| AIR (2:1) | Gentle — air content is extremely delicate. Anything above 2:1 would create audible pumping on cymbals, breath sounds, and string harmonics. |

### Knee Selection

| Preset | Knee | Why |
|--------|------|-----|
| SUB (1.0) | Very soft — gradual onset matches the Opto circuit's smooth character. Sub compression should be felt, not heard. |
| LO-MID (0.8) | Soft — natural transition into compression preserves the organic feel of body content. |
| HI-MID (0.5) | Medium — the FET circuit benefits from a defined threshold. The slight knee softening prevents the onset from being too abrupt. |
| HIGH (0.5) | Medium — matches the VCA's precise character. Clean enough for transient control without artifacts. |
| AIR (0.8) | Soft — preserves the delicate, natural quality of air-band content. Hard-knee compression on air frequencies sounds digital and harsh. |

---

## DeEsser 2 Decisions

### Why Only on HI-MID, HIGH, and AIR

DeEsser 2 is used on the three highest-frequency presets because harsh resonances, sibilance, and digital artifacts are concentrated above 500 Hz. Sub and LO-MID content does not contain sibilance or the type of harsh transients that a DeEsser targets.

### Frequency Selection

| Preset | DeEsser Freq | Target |
|--------|-------------|--------|
| HI-MID | 1.8 kHz | Catches harshness in the vocal presence range. Not traditional sibilance (that's higher) but the "nasal bite" that can make midrange content fatiguing. |
| HIGH | 5.5 kHz | Classic sibilance frequency. Catches "s", "t", "sh" sounds on vocals, pick scrape on guitars, and hi-hat harshness on drums. |
| AIR | 10 kHz | Targets digital aliasing artifacts, converter harshness, and the brittle quality that cheap microphones and plugins add to ultra-high frequencies. |

### Why Relative Mode (not Absolute)

**Relative mode** attenuates sibilance relative to the surrounding signal level. It acts more like a dynamic EQ — reducing only when the target frequency exceeds the broadband level.

**Absolute mode** uses a fixed threshold, which requires re-calibrating for every source level.

Relative mode is chosen because these presets must work on any source at any level. A preset shouldn't require threshold adjustment to function correctly.

### Sensitivity Values (-25 to -28 dB)

| Preset | Sensitivity | Why |
|--------|------------|-----|
| HI-MID (-25 dB) | Most sensitive — midrange harshness is subtle and needs early catching. A higher sensitivity ensures the DeEsser responds to moderate resonances. |
| HIGH (-28 dB) | Less sensitive — sibilance at 5.5 kHz is usually prominent and easy to detect. Lower sensitivity avoids over-processing normal consonant sounds. |
| AIR (-25 dB) | More sensitive — digital harshness at 10 kHz can be subtle but fatiguing. Higher sensitivity catches these artifacts before they reach the compressor. |

---

## Enveloper Decisions

### Why Enveloper Before Compressor

The Enveloper plugin is placed immediately before the Compressor in all mixing presets, most bus presets, and per-band mastering presets. Its purpose is to provide an "expansion-like" character when the DYNAMICS knob (Compressor Mix) is at low values.

### How It Works

At DYNAMICS = 0%, the compressed signal is not mixed in — only the dry path passes through. Since the Enveloper sits before the Compressor, its transient boost is always present in the dry signal. This creates a punchy, transient-enhanced signal that feels "expanded" compared to the source.

At DYNAMICS = 100%, the Compressor fully processes the signal, including the Enveloper-boosted transients. The compression then smooths out the transients, creating the compressed character.

The spectrum from 0% to 100% therefore moves from expanded/transient-enhanced to compressed/smooth — all from a single parameter (Compressor Mix).

### Fixed Settings

| Parameter | Value | Rationale |
|-----------|-------|-----------|
| Attack Gain | +6 dB | Moderate boost — enough to create audible transient emphasis without clipping on loud sources. Higher values (+8 to +10 dB) are used on the drum bus where transient impact is critical. |
| Attack Time | 20 ms | Catches the initial transient of most sources — drums, plucks, consonants. Fast enough for percussive material, slow enough to avoid artifacts on sustained sounds. |
| Release Gain | 0 dB | No sustain manipulation — the Enveloper only shapes transients, not tails. Sustain shaping would interfere with the Compressor's job. |
| Output Level | -3 dB | Compensates for the +6 dB transient peak. Since transients are brief (Attack Time = 20 ms), the average level increase is much less than +6 dB, so -3 dB (not -6 dB) provides appropriate compensation. |

### Net Level Impact

The Enveloper adds +6 dB to transient peaks but -3 dB to the overall output. Since transients are brief, the RMS level change is approximately 0 dB (within ±0.5 dB). This is confirmed in the per-preset level budgets in [signal-flow.md](signal-flow.md).

---

## Exciter / Harmonic Enhancement Decisions

### Why Exciter (not Pedalboard) on Most Presets

**Exciter** generates upper harmonics at specified frequencies with precise control. It's designed for adding "presence" and "air" without altering the fundamental tone.

**Pedalboard** uses distortion/overdrive circuits that generate harmonics across the entire spectrum. This is useful for SUB (where you want to create mid-frequency harmonics so subs translate on small speakers) but too uncontrolled for mid/high-frequency presets.

### COLOR Knob (v3.0)

In v2.0, the Exciter/Pedalboard Mix was fixed. In v3.0, the Mix is user-controllable via the **COLOR** knob (knob 5). The harmonic frequencies and amounts remain fixed — only the wet/dry blend is adjustable. This gives users control over how much harmonic character is added without changing the tonal targeting.

### Frequency Targeting Per Preset

| Preset | Freq 1 | Amt 1 | Freq 2 | Amt 2 | Mix | Rationale |
|--------|--------|-------|--------|-------|-----|-----------|
| SUB (Pedalboard) | -- | -- | -- | -- | 20% | Pedalboard's broadband distortion creates mid-frequency harmonics from sub content. This is the "small speaker translation" trick — when played on a phone or laptop, you hear the harmonics even though the speaker can't reproduce the fundamental. Drive 10% / Tone 30% keeps it dark and subtle. |
| LO-MID | 150 Hz | 4% | 400 Hz | 6% | 20% | Adds warmth harmonics at the body center. Low amounts prevent muddiness. 400 Hz gets slightly more emphasis (6%) to enhance the "fullness" perception. |
| HI-MID | 800 Hz | 5% | 1.5 kHz | 7% | 25% | Adds midrange presence. 1.5 kHz gets more emphasis (7%) because it's the "intelligibility" frequency — making vocals clearer and snares crisper. |
| HIGH | 3 kHz | 6% | 6 kHz | 8% | 25% | Adds "edge" harmonics. 6 kHz gets the most emphasis (8%) — this is the "clarity" frequency that makes high-frequency content cut through a mix. |
| AIR | 8 kHz | 5% | 14 kHz | 8% | 30% | Maximum mix (30%) because shimmer IS the point of the AIR preset. 14 kHz gets 8% to push harmonics into the ultra-high range that most sources lack naturally. |

### Harmonics: Odd + Even

HI-MID, HIGH, and AIR explicitly specify "Odd + Even" harmonics. This generates a fuller, more natural harmonic series (like a tube amplifier). Odd-only harmonics sound harsher and more synthetic. The LO-MID and SUB presets use default harmonics settings which are effectively the same — the documentation gap is cosmetic, not functional.

---

## Tape Delay Decisions

### Why Only on LO-MID, HI-MID, and HIGH

| Has Delay | Why |
|-----------|-----|
| SUB — No | Delay on sub-bass content creates comb filtering and phase cancellation at low frequencies. Even short delays cause destructive interference with wavelengths this long. |
| LO-MID — Yes (80ms, 10% fixed) | Short delay thickens the body range. At 80ms and 10% mix, it's more "doubling" than "echo" — adds perceived width and density. |
| HI-MID — Yes (100ms, 12% fixed) | Slap-back delay is a classic midrange production technique. 100ms creates a natural room-like reflection. |
| HIGH — Yes (dotted 1/8, 10% fixed) | Rhythmic delay in the clarity range creates musical movement. Tempo-synced for musicality. |
| AIR — No | Air-frequency delay would create obvious metallic artifacts. The ChromaVerb Plate tail provides all the sustained spatial effect this range needs. |

### Feedback Percentage Rationale

| Preset | Feedback | Why |
|--------|----------|-----|
| LO-MID (8%) | Very low — one soft repeat, then gone. More feedback would create low-frequency buildup and mud. |
| HI-MID (12%) | Low — two soft repeats. Enough to create a sense of space without obvious echo. |
| HIGH (20%) | Moderate — multiple repeats create rhythmic interest. The 2 kHz Low Cut prevents these repeats from muddying the midrange. |

### Band-Limiting (High Cut / Low Cut)

Every Tape Delay instance has High Cut and Low Cut filters to keep delay content within the preset's frequency range:

| Preset | Low Cut | High Cut | Effect |
|--------|---------|----------|--------|
| LO-MID | 80 Hz | 1 kHz | Delay only contains body-range content — no sub rumble, no mid-frequency echo |
| HI-MID | 400 Hz | 3 kHz | Delay stays in the midrange — prevents overlap with LO-MID and HIGH ranges |
| HIGH | 2 kHz | 8 kHz | Delay only in the clarity range — prevents overlap with HI-MID and AIR |

---

## Reverb Algorithm Decisions

### Algorithm Selection Rationale

| Algorithm | Presets | Acoustic Analog | Why |
|-----------|---------|----------------|-----|
| **Room** | SUB (0.3s), LO-MID (0.5s) | Small physical room | Room algorithms have naturally tight low-frequency decay. The short RT60 values (0.3–0.5s) prevent reverb from adding sustained low-frequency energy that would compete with the dry signal. Room reverb on low content sounds "real" — like the source is in a physical space. |
| **Plate** | HI-MID (1.2s), AIR (2.0s) | Metal plate reverb unit | Plate algorithms excel at midrange density and high-frequency shimmer. For HI-MID, the 1.2s Plate adds a dense, mid-focused tail that enhances vocal and snare presence. For AIR, the 2.0s Plate creates the classic "shimmering" reverb tail — exactly what air-frequency processing needs. |
| **Hall** | HIGH (1.5s) | Large concert hall | Hall algorithms create spacious, diffuse reverb with clear early reflections. In the 2–8 kHz range, this creates "depth" — the sense that the sound exists in a large space — without the density of a Plate or the intimacy of a Room. |

### Band-Limiting Reverb

Every reverb instance has High Cut and Low Cut to keep reverb energy within the preset's frequency range:

| Preset | Low Cut | High Cut | Purpose |
|--------|---------|----------|---------|
| SUB | 20 Hz | 200 Hz | Only sub-frequency reverb — prevents mid bleed |
| LO-MID | 80 Hz | 2 kHz | Body-range reverb — no sub rumble or mid-range wash |
| HI-MID | 400 Hz | 4 kHz | Midrange reverb — tight frequency focus |
| HIGH | 2 kHz | 10 kHz | Clarity-range reverb — no mid overlap, prevents air bleed |
| AIR | 6 kHz | 18 kHz | Ultra-high reverb — shimmer only |

---

## Direction Mixer Decisions

### Why Direction Mixer Over Alternatives

| Alternative | Problem | Direction Mixer Advantage |
|-------------|---------|--------------------------|
| **Stereo Spread** | Uses frequency-dependent phase shifts to widen. Creates comb filtering on mono fold-down. Some frequencies cancel when summed to mono. | Direction Mixer uses M/S processing — no frequency-dependent phase manipulation. Mono fold-down is always clean. |
| **Chorus** | Adds modulated delay to create width. Introduces pitch variation and timing artifacts. Audible "chorus effect" even at low mix. | Direction Mixer has zero latency, zero modulation, zero pitch change. It purely adjusts the L/R balance. |
| **Delay-based widening** | Short delays between L and R create phantom stereo. Causes severe comb filtering on mono fold-down. | Direction Mixer's M/S approach has no delay component. |
| **Binaural panning** | Only works on headphones. No stereo speaker benefit. | Direction Mixer works correctly on speakers and headphones. |

### WIDTH Range Decisions

| Preset | Min | Max | Why |
|--------|-----|-----|-----|
| SUB | 0.0 (mono) | 1.5 | Sub content is often summed to mono for club/PA systems. Starting from true mono (0.0) is essential. Max limited to 1.5 because excessive stereo widening on sub frequencies is never desirable. |
| LO-MID | 0.5 | 1.5 | Moderate range — body content benefits from some narrowing but rarely needs true mono. Widening limited to 1.5 to prevent "phasey" low-mid stereo. |
| HI-MID, HIGH, AIR | 0.5 | 2.0 | Full widening range. Mid and high frequencies tolerate and benefit from maximum stereo expansion. 2.0 gives dramatic width when needed. |

---

## Mastering Plugin Decisions (v3.0)

### Linear Phase EQ (MIX Bus, All Mastering Presets)

**Why Linear Phase instead of Channel EQ at mastering stage:**

Channel EQ introduces phase shifts at its filter frequencies — this is normal and inaudible on individual tracks. But on the mix bus and mastering chain, where all sources are summed, these phase shifts can cause subtle smearing of transients and stereo image degradation. Linear Phase EQ applies the same frequency response with zero phase shift, preserving transient integrity and stereo coherence.

**Trade-off:** Linear Phase EQ has higher latency (~20 ms) and CPU usage. This is acceptable on bus/mastering chains where latency is compensated by Logic's PDC and there are only 1–2 instances.

### Adaptive Limiter (MASTER-BUS, MASTER-STREAM)

The Adaptive Limiter rounds peaks like an analog amplifier rather than hard-clipping them. **OptimFull** mode provides maximum transparency. **Lookahead** is enabled to anticipate peaks before they arrive, allowing smoother gain reduction.

The LOUD knob controls Gain (0 to +10/+12 dB), which pushes signal into the limiter. The Output Ceiling is fixed at -1 dBTP to prevent inter-sample peaks from clipping on D/A conversion.

### Multipressor (MASTER-MULTI)

Logic's Multipressor provides 4-band dynamics processing. Each band's threshold is independently controllable via knobs 1–4, giving per-band dynamics control from the BCF2000. Band crossover frequencies are fixed at 80 Hz, 500 Hz, and 4 kHz to align with the mixing preset frequency bands.

### Loudness Meter (MASTER-STREAM)

Used for LUFS monitoring only — no parameters are macro'd. The meter provides real-time integrated loudness measurement. Target: -14 LUFS for Spotify/YouTube, -16 LUFS for Apple Music. The user adjusts the LOUD knob (Adaptive Limiter Gain) while watching the meter.

---

## Traceability

| This Spec Section | Source Document |
|--------------------|----------------|
| EQ frequencies | [presets/](../presets/) — Channel EQ tables |
| Compressor settings | [presets/](../presets/) — Compressor tables |
| DeEsser settings | [presets/](../presets/) — DeEsser 2 tables |
| Reverb settings | [presets/](../presets/) — ChromaVerb tables |
| Direction Mixer settings | [presets/](../presets/) — Direction Mixer tables |
| Overall architecture | [spec/architecture.md](architecture.md) |
