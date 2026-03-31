# Build Guide — MPD-CLA Channel Strip Presets (Frequency-Domain)

Step-by-step instructions for building each preset in Logic Pro.

---

## Prerequisites

- Logic Pro 10.7+
- All stock plugins (no third-party required)
- Refer to individual preset specs in `presets/` for exact parameter values

---

## Phase 1: Chain Assembly

1. Create a new **Audio** track
2. Open the **Channel Strip** inspector
3. Load plugins in the insert slots **in order** per the preset's insert chain table
4. Dial in all **fixed settings** exactly as specified in the preset spec
5. Set all macro-controlled parameters to their **default values** (0 dB / 0% / 1.0 spread)
6. **Verify signal flow:** bypass each plugin one at a time and confirm no gain staging issues

### Gain Staging Tips

- With all plugins active and macros at default, the output level should match the input level (unity gain)
- The Gain plugin at the end of the chain is specifically for compensating any level changes
- Watch for the Exciter adding level — it's always on with a fixed mix percentage

---

## Phase 2: Smart Control Mapping

1. Open the **Smart Controls** pane (press **B**)
2. Click the **Inspector button** (i) to show the parameter mapping panel
3. Switch to **Edit Mode** (click the pencil/Edit icon in the Smart Controls header)

### Standard Knobs (single parameter each)

For knobs 1–4, 7–8:
- Click the knob in the layout view
- In the Parameter Mapping area, click **Add Mapping**
- Navigate to the target plugin and parameter
- Set **Min** and **Max** values per the preset's ranges table
- Double-click the label text and type the knob name

### Knob 5: DYNAMICS (Dual-Parameter Mapping)

The DYNAMICS knob controls **two parameters simultaneously** — this is how you get punch-to-sustain morphing from a single knob:

1. Click the **DYNAMICS** knob in the layout
2. Click **Add Mapping** → navigate to **Compressor > Attack**
   - Set Min to the preset's fastest attack (e.g., 0.2 ms for HI-MID)
   - Set Max to the preset's slowest attack (e.g., 40 ms for HI-MID)
3. Click **Add Mapping** again → navigate to **Compressor > Release**
   - Set Min to the preset's fastest release (e.g., 20 ms for HI-MID)
   - Set Max to the preset's slowest release (e.g., 300 ms for HI-MID)
4. Both mappings now appear under the same knob
5. When the user turns the knob left → both Attack and Release go fast (PUNCH)
6. When the user turns the knob right → both Attack and Release go slow (SUSTAIN)

**Important:** The Min value of both mappings = the PUNCH end (fast). The Max value = the SUSTAIN end (slow). This is the natural direction — left is aggressive, right is gentle.

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
1: DRIVE         5: DYNAMICS
2: BASS          6: WIDTH
3: TREBLE        7: SPACE
4: COMPRESS      8: OUTPUT
```

4. **Exit Edit Mode** when all 8 knobs are mapped

---

## Phase 3: Save as Channel Strip Setting

1. Click the **Setting** button at the top of the channel strip (shows "Default" or current name)
2. Select **Save Channel Strip Setting As...**
3. Navigate to or create folder: **MPD-CLA/**
4. Enter the preset name: `MPD-CLA-SUB`, `MPD-CLA-LO-MID`, `MPD-CLA-HI-MID`, `MPD-CLA-HIGH`, or `MPD-CLA-AIR`
5. Click **Save**

Logic saves `.cst` files to:
```
~/Music/Audio Music Apps/Channel Strip Settings/MPD-CLA/
```

---

## Phase 4: Save as Patch (Critical!)

**Smart Controls are saved with the Patch, NOT the Channel Strip Setting.** If you skip this step, the Smart Control mappings and the DYNAMICS dual-parameter mapping won't persist.

1. After mapping all knobs, go to the **Library** pane (press **Y**)
2. Click **Save Patch**
3. Name: `MPD-CLA-SUB`, `MPD-CLA-LO-MID`, etc.
4. Location: `~/Music/Audio Music Apps/Patches/MPD-CLA/`

Patches store:
- Channel Strip (insert chain + settings)
- Smart Control layout + all mappings (including dual-parameter)
- Send routing
- Output routing

**Always save BOTH the .cst AND the .patch for each preset.**

---

## Build Order

Follow this order for the most efficient workflow:

| Order | Preset | Reason |
|-------|--------|--------|
| 1 | MPD-CLA-HI-MID | Most complex (8 inserts), establishes the template |
| 2 | MPD-CLA-HIGH | Similar chain, validates VCA + DeEsser approach |
| 3 | MPD-CLA-AIR | Tests shimmer/Exciter-heavy approach |
| 4 | MPD-CLA-LO-MID | Tests Opto + warmth in low range |
| 5 | MPD-CLA-SUB | Simplest chain, validates sub-only processing |

### Workflow Tip

After building MPD-CLA-HI-MID, speed up subsequent presets:
1. Load the HI-MID channel strip as a starting point
2. Swap out plugins that differ (e.g., remove DeEsser for LO-MID, swap FET for Opto)
3. Update the fixed settings for the new frequency range
4. Re-map any Smart Controls that changed (DYNAMICS ranges differ per preset)
5. Save as new Channel Strip + Patch

---

## Verification After Save

After saving each preset:

1. **Close and reopen** Logic Pro
2. Load the Channel Strip Setting from `MPD-CLA/`
3. Verify all plugin settings loaded correctly
4. Load the **Patch** from `MPD-CLA/`
5. Verify Smart Control labels and mappings are intact
6. **Test DYNAMICS knob:** sweep left to right, confirm both Attack and Release move together
7. **Test WIDTH knob:** sweep left to right, confirm stereo image narrows and widens
8. **Mono fold-down test:** set WIDTH to max, then sum to mono in Logic's output — verify no phase cancellation
