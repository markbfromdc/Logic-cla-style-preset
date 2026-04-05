# Build Guide — MPD-CLA Channel Strip Presets (Frequency-Domain) v3.0

Step-by-step instructions for building each preset in Logic Pro.

---

## Prerequisites

- Logic Pro 10.7+
- All stock plugins (no third-party required)
- Refer to individual preset specs in `presets/` for exact parameter values
- BCF2000 hardware controller recommended — see `spec/bcf2000.md` for setup

---

## Phase 1: Chain Assembly

1. Create a new **Audio** track
2. Open the **Channel Strip** inspector
3. Load plugins in the insert slots **in order** per the preset's insert chain table
4. Include **Enveloper** in the chain — place it **before** Compressor in every preset
5. Dial in all **fixed settings** exactly as specified in the preset spec
6. Set all macro-controlled parameters to their **default values** (0 dB / 0% / 1.0 spread)
7. **Verify signal flow:** bypass each plugin one at a time and confirm no gain staging issues

### Enveloper Placement

Enveloper sits immediately before Compressor in the insert chain. Its Attack and Release parameters are fixed per-preset (see preset specs). The Enveloper provides transient shaping that interacts with the DYNAMICS knob — when DYNAMICS is at 0% (Compressor Mix bypassed), the Enveloper's transient boost is the only dynamics processing you hear.

### Gain Staging Tips

- With all plugins active and macros at default, the output level should match the input level (unity gain)
- The Gain plugin at the end of the chain is specifically for compensating any level changes
- Watch for the Exciter adding level — it's always on with a fixed mix percentage

---

## Phase 2: Smart Control Mapping

1. Open the **Smart Controls** pane (press **B**)
2. Click the **Inspector button** (i) to show the parameter mapping panel
3. Switch to **Edit Mode** (click the pencil/Edit icon in the Smart Controls header)

### Knob Mappings

All 8 knobs are single-parameter mappings. For each knob:

1. Click the knob in the layout view
2. In the Parameter Mapping area, click **Add Mapping**
3. Navigate to the target plugin and parameter
4. Set **Min** and **Max** values per the preset's ranges table
5. Double-click the label text and type the knob name

| Knob | Label    | Target Plugin > Parameter | Notes |
|------|----------|---------------------------|-------|
| 1    | DRIVE    | Gain > Gain (or Distortion > Drive) | Per preset spec |
| 2    | BASS     | Channel EQ > Low Shelf Gain | Low shelf boost/cut |
| 3    | TREBLE   | Channel EQ > High Shelf Gain | High shelf boost/cut |
| 4    | DYNAMICS | Compressor > Mix | 0% = expanded (dry, Enveloper transient boost only), 100% = compressed (full Compressor wet) |
| 5    | COLOR    | Exciter > Mix (or Pedalboard > Mix for SUB) | Blends saturation/harmonic character |
| 6    | WIDTH    | Direction Mixer > Spread | See Width section below |
| 7    | SPACE    | Reverb/Delay > Mix | Per preset spec |
| 8    | OUTPUT   | Gain (output) > Gain | Final output trim |

### Knob 4: DYNAMICS (Compressor Mix)

The DYNAMICS knob controls a single parameter: **Compressor > Mix**.

- **0% (full left):** Compressor is fully bypassed via mix. The signal passes through Enveloper only, giving you an expanded, transient-boosted feel.
- **100% (full right):** Compressor is fully engaged. You hear the full compressed signal.
- **50% (center):** Parallel compression — a blend of dry (expanded) and compressed signals.

This replaces the previous dual-parameter Attack+Release mapping. The Enveloper (fixed settings) handles transient shaping, while the DYNAMICS knob controls how much compression is applied.

### Knob 5: COLOR (Exciter/Pedalboard Mix)

- For most presets: maps to **Exciter > Mix**
- For SUB preset: maps to **Pedalboard > Mix** (saturation character)
- 0% = clean/no harmonic coloring, 100% = full saturation/exciter effect

### Knob 6: WIDTH (Direction Mixer)

1. Click the **WIDTH** knob in the layout
2. Click **Add Mapping** → navigate to **Direction Mixer > Spread**
   - Set Min per preset (0.0 for SUB mono, 0.5 for others narrow)
   - Set Max per preset (1.5 for SUB, 2.0 for HI-MID/HIGH/AIR)
3. Default position (center) should land at Spread = 1.0 (unity stereo)

**Mono-safe guarantee:** Direction Mixer uses mid-side processing internally. Even at maximum Spread (2.0), summing to mono produces no phase cancellation — just the mid channel.

### Knob Labels

All presets use the same labels in the same order:

```
1: DRIVE         5: COLOR
2: BASS          6: WIDTH
3: TREBLE        7: SPACE
4: DYNAMICS      8: OUTPUT
```

4. **Exit Edit Mode** when all 8 knobs are mapped

---

## Phase 3: Save as Channel Strip Setting

1. Click the **Setting** button at the top of the channel strip (shows "Default" or current name)
2. Select **Save Channel Strip Setting As...**
3. Navigate to or create folder: **MPD-CLA/**
4. Enter the preset name (e.g., `MPD-CLA-SUB`, `MPD-CLA-LO-MID`, `MPD-CLA-HI-MID`, `MPD-CLA-HIGH`, `MPD-CLA-AIR`)
5. Click **Save**

Logic saves `.cst` files to:
```
~/Music/Audio Music Apps/Channel Strip Settings/MPD-CLA/
```

---

## Phase 4: Save as Patch (Critical!)

**Smart Controls are saved with the Patch, NOT the Channel Strip Setting.** If you skip this step, the Smart Control mappings won't persist.

1. After mapping all knobs, go to the **Library** pane (press **Y**)
2. Click **Save Patch**
3. Name: `MPD-CLA-SUB`, `MPD-CLA-LO-MID`, etc.
4. Location: `~/Music/Audio Music Apps/Patches/MPD-CLA/`

Patches store:
- Channel Strip (insert chain + settings)
- Smart Control layout + all mappings
- Send routing
- Output routing

**Always save BOTH the .cst AND the .patch for each preset.**

---

## Building Bus Presets

Bus presets process the summed output of grouped tracks (e.g., drum bus, vocal bus, instrument bus).

1. Create a new **Bus** (or Aux) track
2. Follow Phase 1 (Chain Assembly) using the bus preset spec from `presets/bus/`
3. Bus chains are typically shorter — fewer inserts, lighter processing
4. Enveloper placement remains before Compressor
5. DYNAMICS knob works the same way (Compressor Mix: 0% = expanded, 100% = compressed)
6. Map all 8 knobs per the bus preset's ranges table
7. Save as Channel Strip Setting in `MPD-CLA/Bus/` subfolder
8. Save as Patch in `MPD-CLA/Bus/` subfolder

### Bus-Specific Considerations

- Gain staging is critical on buses — multiple sources sum before processing
- Keep DRIVE ranges conservative to avoid clipping the summed signal
- WIDTH on buses affects the entire group — test mono-fold carefully
- SPACE settings should complement (not duplicate) per-track reverb/delay

---

## Building FX Send Presets

FX send presets live on Aux tracks fed by sends, providing shared time-based and modulation effects.

1. Create a new **Aux** track for the FX return
2. Load the FX send preset chain from `presets/fx-send/`
3. These presets are 100% wet — the dry/wet balance is controlled by the send level on each source track
4. Map all 8 knobs per the FX send preset's ranges table
5. DYNAMICS on FX sends controls compression on the effect return (useful for ducking reverb tails)
6. Save as Channel Strip Setting in `MPD-CLA/FX-Send/` subfolder
7. Save as Patch in `MPD-CLA/FX-Send/` subfolder

### FX Send Tips

- Keep the FX return fader at unity (0 dB) and control blend via send levels
- Use COLOR to shape the character of the effect (e.g., exciter on a reverb return for shimmer)
- SPACE knob on FX sends may control a secondary effect parameter (see preset spec)

---

## Building Mastering Presets

Mastering presets are applied to the stereo output bus for final processing.

1. Apply the mastering preset chain to the **Stereo Output** (or a dedicated master bus)
2. Load plugins from `presets/mastering/` spec
3. Mastering chains prioritize transparency — lighter compression, subtle EQ moves
4. Enveloper settings are gentler than track-level presets
5. DYNAMICS at 0% = minimal compression (open/expanded master), DYNAMICS at 100% = glue compression fully engaged
6. Map all 8 knobs per the mastering preset's ranges table
7. Save as Channel Strip Setting in `MPD-CLA/Mastering/` subfolder
8. Save as Patch in `MPD-CLA/Mastering/` subfolder

### Mastering-Specific Considerations

- Use a reference track for loudness matching
- WIDTH on the master bus should be used sparingly — subtle adjustments only
- OUTPUT knob is your final ceiling control; watch true-peak levels
- Always A/B against the unprocessed mix before committing

---

## Build Order

Follow this order for the most efficient workflow:

### Track Presets

| Order | Preset | Reason |
|-------|--------|--------|
| 1 | MPD-CLA-HI-MID | Most complex chain, establishes the template |
| 2 | MPD-CLA-HIGH | Similar chain, validates VCA + DeEsser approach |
| 3 | MPD-CLA-AIR | Tests shimmer/Exciter-heavy approach |
| 4 | MPD-CLA-LO-MID | Tests Opto + warmth in low range |
| 5 | MPD-CLA-SUB | Simplest chain, validates sub-only processing |

### Then: Bus, FX Send, and Mastering Presets

| Order | Category | Reason |
|-------|----------|--------|
| 6 | Bus presets | Reuse track preset templates with lighter settings |
| 7 | FX Send presets | 100% wet chains, simpler mapping |
| 8 | Mastering presets | Final chain, requires all others for context |

### Workflow Tip

After building MPD-CLA-HI-MID, speed up subsequent presets:
1. Load the HI-MID channel strip as a starting point
2. Swap out plugins that differ (e.g., remove DeEsser for LO-MID, swap FET for Opto)
3. Update the fixed settings for the new frequency range
4. Re-map any Smart Controls that changed (ranges differ per preset)
5. Save as new Channel Strip + Patch

---

## Verification After Save

After saving each preset:

1. **Close and reopen** Logic Pro
2. Load the Channel Strip Setting from `MPD-CLA/`
3. Verify all plugin settings loaded correctly
4. Load the **Patch** from `MPD-CLA/`
5. Verify Smart Control labels and mappings are intact
6. **Test DYNAMICS knob:** sweep left (0%) to right (100%), confirm Compressor Mix moves from dry to wet
7. **Test COLOR knob:** sweep left to right, confirm Exciter/Pedalboard Mix responds
8. **Test WIDTH knob:** sweep left to right, confirm stereo image narrows and widens
9. **Mono fold-down test:** set WIDTH to max, then sum to mono in Logic's output — verify no phase cancellation
10. **BCF2000 test (if applicable):** verify hardware knobs move on-screen Smart Controls correctly (see `spec/bcf2000.md`)
