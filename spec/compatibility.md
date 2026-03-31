# Compatibility & Deployment Specification

**Version:** 2.0
**Last Updated:** 2026-03-31
**Applies to:** All MPD-CLA presets

---

## System Requirements

| Requirement | Minimum | Recommended |
|-------------|---------|-------------|
| DAW | Logic Pro 10.7 | Logic Pro 10.8+ |
| macOS | 11.0 (Big Sur) | 13.0+ (Ventura+) |
| RAM | 4 GB | 8 GB+ |
| CPU | Any Apple Silicon or Intel Mac | Apple Silicon (M1+) for lowest latency |

---

## Plugin Availability Matrix

All plugins used are stock Logic Pro plugins. This table documents when each plugin became available:

| Plugin | First Available | Used In Presets | Critical? |
|--------|----------------|-----------------|-----------|
| Channel EQ | Logic Pro 8+ | All 5 | Yes — core EQ |
| Compressor | Logic Pro 8+ | All 5 | Yes — core dynamics |
| Gain | Logic Pro 8+ | All 5 | Yes — output trim |
| Tape Delay | Logic Pro 9+ | LO-MID, HI-MID, HIGH | Yes — fixed thickening |
| Exciter | Logic Pro 9+ | LO-MID, HI-MID, HIGH, AIR | Yes — harmonic enhancement |
| Pedalboard | Logic Pro 9+ | SUB | Yes — sub harmonic saturation |
| ChromaVerb | Logic Pro 10.4 | All 5 | Yes — primary reverb |
| DeEsser 2 | Logic Pro 10.4 | HI-MID, HIGH, AIR | Yes — harshness control |
| Direction Mixer | Logic Pro 9+ | All 5 | Yes — stereo width |

**Minimum Logic version:** 10.7 (for the latest ChromaVerb and DeEsser 2 algorithm updates).

### If Using Logic Pro < 10.4

ChromaVerb and DeEsser 2 are not available in Logic Pro versions before 10.4. **These presets will not load correctly on older versions.** There are no workarounds — ChromaVerb's algorithms and DeEsser 2's Relative mode have no direct equivalents in older plugins.

---

## File Installation

### Directory Structure

Logic Pro uses standard macOS directories for presets:

```
~/Music/Audio Music Apps/
├── Channel Strip Settings/
│   └── MPD-CLA/
│       ├── MPD-CLA-SUB.cst
│       ├── MPD-CLA-LO-MID.cst
│       ├── MPD-CLA-HI-MID.cst
│       ├── MPD-CLA-HIGH.cst
│       └── MPD-CLA-AIR.cst
└── Patches/
    └── MPD-CLA/
        ├── MPD-CLA-SUB.patch
        ├── MPD-CLA-LO-MID.patch
        ├── MPD-CLA-HI-MID.patch
        ├── MPD-CLA-HIGH.patch
        └── MPD-CLA-AIR.patch
```

**Note:** `~` refers to the current user's home directory (e.g., `/Users/username/`).

### Creating Directories

If the MPD-CLA subdirectories don't exist, create them:

```bash
mkdir -p ~/Music/Audio\ Music\ Apps/Channel\ Strip\ Settings/MPD-CLA
mkdir -p ~/Music/Audio\ Music\ Apps/Patches/MPD-CLA
```

Logic Pro creates the parent directories (`Channel Strip Settings/`, `Patches/`) automatically if they don't exist. Only the `MPD-CLA/` subfolder needs to be created manually (or Logic will prompt when saving).

### File Formats

| Format | Extension | Contains | When to Use |
|--------|-----------|----------|-------------|
| Channel Strip Setting | `.cst` | Plugin chain + all plugin parameter values | Loading just the plugin chain without Smart Controls |
| Patch | `.patch` | Everything in .cst + Smart Control layout, mappings, labels, min/max ranges, send routing, output routing | Loading the full preset with Smart Controls (primary use) |

**Critical distinction:** Smart Control mappings (including the DYNAMICS dual-parameter mapping and WIDTH control) are ONLY preserved in .patch files. If you load a .cst file, the plugins will be correct but the Smart Control knobs will not be mapped.

---

## Loading Presets

### From the Library (Patch)

1. Select the target track
2. Open the **Library** pane (press **Y** or click the Library button)
3. Navigate to **MPD-CLA** folder
4. Click the desired preset name
5. Smart Controls and all mappings load automatically

### From the Channel Strip (CST)

1. Click the **Setting** button at the top of the channel strip
2. Navigate to **MPD-CLA** folder
3. Click the desired preset name
4. Plugin chain loads, but Smart Controls are NOT mapped
5. You would need to also load the corresponding Patch for Smart Controls

### Recommended Workflow

Always load via the **Library (Patch)** method. Only use the Channel Strip Setting method if you specifically want the plugin chain without Smart Controls.

---

## Troubleshooting

### Preset Not Appearing in Library

| Symptom | Cause | Solution |
|---------|-------|----------|
| MPD-CLA folder missing from Library | .patch files not in correct directory | Verify files are in `~/Music/Audio Music Apps/Patches/MPD-CLA/` |
| MPD-CLA folder missing from Channel Strip menu | .cst files not in correct directory | Verify files are in `~/Music/Audio Music Apps/Channel Strip Settings/MPD-CLA/` |
| Preset loads but some plugins show as "missing" | Logic version too old | Update to Logic Pro 10.7+ |
| Preset loads but Smart Controls are blank | Loaded .cst instead of .patch | Load from Library pane (Patch format) instead |

### Smart Controls Not Loading

| Symptom | Cause | Solution |
|---------|-------|----------|
| Knobs visible but not mapped | .cst was loaded instead of .patch | Re-load from Library pane |
| DYNAMICS knob only moves Attack, not Release | Only one mapping was saved | Re-open Edit Mode, verify both Attack AND Release are mapped to knob 5 |
| Labels show as "Knob 1", "Knob 2" etc. | Smart Control layout not saved with Patch | Re-create labels in Edit Mode, re-save Patch |

### Audio Issues

| Symptom | Cause | Solution |
|---------|-------|----------|
| Clipping at output | DRIVE too high with COMPRESS at 100% | Reduce DRIVE or lower OUTPUT |
| No compression audible | COMPRESS at 0% | COMPRESS controls parallel mix — set above 0% to hear compression |
| Reverb sounds wrong | ChromaVerb algorithm changed | Verify algorithm matches preset spec (Room/Plate/Hall) |
| Stereo image collapsed | WIDTH at minimum | Increase WIDTH; verify Direction Mixer is in the chain |
| Phase cancellation in mono | Direction Mixer not being used (using alternative width method) | Ensure Direction Mixer is the width plugin, not Stereo Spread or Chorus |

---

## Backup & Portability

### Transferring Presets Between Machines

1. Copy the following directories to the target machine:
   ```
   ~/Music/Audio Music Apps/Channel Strip Settings/MPD-CLA/
   ~/Music/Audio Music Apps/Patches/MPD-CLA/
   ```
2. Place them in the same paths on the target machine
3. Restart Logic Pro
4. Presets appear in Library and Channel Strip menus

### Backup Strategy

The `.cst` and `.patch` files are small (typically < 100 KB each). Include them in your regular Time Machine or manual backup of `~/Music/Audio Music Apps/`.

### Version Control

This Git repository stores the **specifications** for building the presets, not the binary preset files themselves. The .cst and .patch files are Logic Pro binary formats and are generated by following the [BUILD-GUIDE.md](../BUILD-GUIDE.md).

---

## Known Limitations

| Limitation | Impact | Workaround |
|------------|--------|------------|
| Smart Controls only saved in .patch format | Loading .cst gives plugins without knob mappings | Always load via Library (Patch) |
| Maximum 8 Smart Control knobs | Cannot add more macro controls | Current 8-knob layout is fixed by Logic's Smart Control system |
| No toggle switches in Smart Controls | DYNAMICS and WIDTH must use continuous knobs, not switches | Knob sweep provides more control than binary toggles anyway |
| Direction Mixer Spread maxes at 2.0 | Cannot create wider-than-2.0 stereo image via this method | 2.0 provides significant widening; more would risk mono issues |
| Patch format includes output routing | Loading a Patch may change the track's output assignment | Verify output routing after loading a Patch |
| Linear interpolation on Smart Controls | Cannot create logarithmic or exponential knob curves | Plugin parameters have their own internal scaling; linear SC mapping is sufficient |

---

## Traceability

| This Spec Section | Source Document |
|--------------------|----------------|
| File paths | [CLA-Logic-Channel-Strip-Roadmap.md](../CLA-Logic-Channel-Strip-Roadmap.md) — File Structure |
| Save procedure | [BUILD-GUIDE.md](../BUILD-GUIDE.md) — Phase 3 & 4 |
| Plugin requirements | [spec/architecture.md](architecture.md) — Technology Stack |
| Smart Control save behavior | [spec/smart-controls.md](smart-controls.md) — Save Behavior |
