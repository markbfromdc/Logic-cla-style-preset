# Build Guide — MPD-CLA Channel Strip Presets

Step-by-step instructions for building each preset in Logic Pro.

---

## Prerequisites

- Logic Pro 10.7+
- All stock plugins (no third-party required)
- Refer to individual preset specs in `presets/` for exact parameter values

---

## Phase 1: Chain Assembly

1. Create a new **Audio** track (or Software Instrument for testing with virtual instruments)
2. Open the **Channel Strip** inspector
3. Load plugins in the insert slots **in order** per the preset's insert chain table
4. Dial in all **fixed settings** exactly as specified in the preset spec
5. Set all macro-controlled parameters to their **default values** (0 dB / 0%)
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
4. For each of the 8 knobs:
   - **Click the knob** in the layout view
   - In the Parameter Mapping area, click **Add Mapping**
   - Navigate to the target plugin and parameter (see the preset's Smart Control Mapping table)
   - Set **Min** and **Max** values per the ranges table
   - **Double-click the label** text below the knob and type the label name (SENSITIVITY, BASS, etc.)
5. **Exit Edit Mode** when all 8 knobs are mapped

### Knob Labels

All presets use the same labels in the same order:

```
1: SENSITIVITY    5: REVERB
2: BASS           6: DELAY
3: TREBLE         7: PITCH
4: COMPRESS       8: OUTPUT
```

---

## Phase 3: Save as Channel Strip Setting

1. Click the **Setting** button at the top of the channel strip (shows "Default" or current name)
2. Select **Save Channel Strip Setting As...**
3. Navigate to or create folder: **MPD-CLA/**
4. Enter the preset name: `MPD-CLA-VOX`, `MPD-CLA-BASS`, `MPD-CLA-DRUM`, `MPD-CLA-GTR`, or `MPD-CLA-UNPLG`
5. Click **Save**

Logic saves `.cst` files to:
```
~/Music/Audio Music Apps/Channel Strip Settings/MPD-CLA/
```

---

## Phase 4: Save as Patch (Critical!)

**Smart Controls are saved with the Patch, NOT the Channel Strip Setting.** If you skip this step, the Smart Control mappings won't persist when loading the channel strip.

1. After mapping all knobs, go to the **Library** pane (press **Y**)
2. Click **Save Patch** (or use the menu: Logic Pro > Patches > Save Patch)
3. Name: `MPD-CLA-VOX`, `MPD-CLA-BASS`, etc.
4. Location: `~/Music/Audio Music Apps/Patches/MPD-CLA/`

Patches store:
- Channel Strip (insert chain + settings)
- Smart Control layout + mappings
- Send routing
- Output routing

**Always save BOTH the .cst AND the .patch for each preset.**

---

## Build Order

Follow this order for the most efficient workflow:

| Order | Preset | Reason |
|-------|--------|--------|
| 1 | MPD-CLA-VOX | Most complex (8 inserts), establishes the template |
| 2 | MPD-CLA-DRUM | Validates FET smash + Enveloper transient recovery |
| 3 | MPD-CLA-BASS | Tests Opto + Pedalboard saturation strategy |
| 4 | MPD-CLA-GTR | Tests VCA + delay/verb balance |
| 5 | MPD-CLA-UNPLG | Lightest processing, validates gentle approach |

### Workflow Tip

After building MPD-CLA-VOX, you can speed up subsequent presets:
1. Load the VOX channel strip as a starting point
2. Swap out plugins that differ (e.g., replace DeEsser with Enveloper for DRUM)
3. Update the fixed settings
4. Re-map any Smart Controls that changed (most stay the same)
5. Save as new Channel Strip + Patch

---

## Verification After Save

After saving each preset:

1. **Close and reopen** Logic Pro
2. Load the Channel Strip Setting from `MPD-CLA/`
3. Verify all plugin settings loaded correctly
4. Load the **Patch** from `MPD-CLA/`
5. Verify Smart Control labels and mappings are intact
6. Sweep each knob and confirm the mapped parameter responds within the correct range
