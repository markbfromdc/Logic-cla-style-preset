# Logic Pro Template Build Guide — MPD-CLA Session v3.0

Step-by-step instructions for building the pre-routed Logic Pro session template. This creates a ready-to-mix session with 8 busses, 4 FX sends, and 20 audio tracks, all loaded with MPD-CLA presets.

**Prerequisite:** All 25 presets must be built and saved first. See `BUILD-GUIDE.md`.

---

## Quick Reference

```
TRACKS (20)                    BUSSES (8)              FX SENDS (4)
Track  1-4 : Drums       ---> Bus 1: DRUMS        --> Bus 7: MIX
Track  5-6 : Bass        ---> Bus 2: BASS         --> Bus 7: MIX
Track  7-10: Guitars     ---> Bus 3: GUITARS       --> Bus 7: MIX
Track 11-14: Keys        ---> Bus 4: KEYS         --> Bus 7: MIX
Track 15-18: Vocals      ---> Bus 5: VOCALS        --> Bus 7: MIX
Track 19-20: FX/SFX      ---> Bus 6: FX           --> Bus 7: MIX
                                                                    Send 1: SHORT VERB --> Bus 7
                               Bus 7: MIX         --> Bus 8        Send 2: LONG VERB  --> Bus 7
                               Bus 8: MASTER       --> Output 1-2   Send 3: SLAP DLY   --> Bus 7
                                                                    Send 4: LONG DLY   --> Bus 7
```

---

## Step 1: Create a New Empty Project

1. File > New (or Cmd+N)
2. Choose **Empty Project**
3. When prompted to create a track, click **Cancel** — we'll create everything manually
4. Set project tempo (120 BPM default, change as needed)
5. Set sample rate: **48 kHz** (recommended)
6. Set bit depth: **24-bit**

---

## Step 2: Create the 8 Busses

Create busses in reverse order (Master first) so routing targets exist before they're needed.

### Bus 8: MASTER

1. Mix > Create New Auxiliary Channel Strip
2. Set input to **Bus 8**
3. Set output to **Output 1-2** (Stereo Out)
4. Name: `MASTER`
5. Color: **Red**
6. Load preset: Open Library (Y) > User Patches > MPD-CLA > `MPD-MASTER-BUS`
7. Set fader to **0 dB**

### Bus 7: MIX

1. Mix > Create New Auxiliary Channel Strip
2. Set input to **Bus 7**
3. Set output to **Bus 8**
4. Name: `MIX`
5. Color: **Orange**
6. Load preset: `MPD-BUS-MIX`
7. Set fader to **0 dB**

### Busses 1-6: Instrument Groups

Create each bus in order:

| Bus | Input | Output | Name | Color | Preset |
|-----|-------|--------|------|-------|--------|
| 1 | Bus 1 | Bus 7 | DRUMS | Blue | `MPD-BUS-DRUMS` |
| 2 | Bus 2 | Bus 7 | BASS | Purple | `MPD-BUS-BASS` |
| 3 | Bus 3 | Bus 7 | GUITARS | Green | `MPD-BUS-GUITARS` |
| 4 | Bus 4 | Bus 7 | KEYS | Yellow | `MPD-BUS-KEYS` |
| 5 | Bus 5 | Bus 7 | VOCALS | Pink | `MPD-BUS-VOCALS` |
| 6 | Bus 6 | Bus 7 | FX | Gray | `MPD-BUS-FX` |

For each:
1. Mix > Create New Auxiliary Channel Strip
2. Set input to the corresponding Bus number
3. Set output to **Bus 7** (MIX)
4. Name and color per the table above
5. Load the preset from Library > User Patches > MPD-CLA
6. Set fader to **0 dB**

---

## Step 3: Create the 4 FX Send Returns

These are Aux channel strips that receive signal from send knobs on tracks and busses.

| Send | Input | Output | Name | Color | Preset |
|------|-------|--------|------|-------|--------|
| 1 | Bus 9 | Bus 7 | SHORT VERB | Light Blue | `MPD-FX-SHORT-VERB` |
| 2 | Bus 10 | Bus 7 | LONG VERB | Cyan | `MPD-FX-LONG-VERB` |
| 3 | Bus 11 | Bus 7 | SLAP DLY | Teal | `MPD-FX-SLAP-DLY` |
| 4 | Bus 12 | Bus 7 | LONG DLY | Mint | `MPD-FX-LONG-DLY` |

For each:
1. Mix > Create New Auxiliary Channel Strip
2. Set input to the send bus (Bus 9/10/11/12)
3. **Set output to Bus 7 (MIX)** — FX returns sum into the mix bus, not the master
4. Name and color per the table above
5. Load the preset from Library > User Patches > MPD-CLA
6. Set fader to **0 dB**

> **Important:** FX send presets are 100% wet. The dry/wet balance is controlled by the send level on each source track, not on the FX return.

---

## Step 4: Create Audio Tracks

Create 20 audio tracks with default routings. Tracks can be added or removed later — this is the starting template.

### Drums (Tracks 1-4)

| Track | Name | Output | Input |
|-------|------|--------|-------|
| 1 | Kick | Bus 1 | Input 1 |
| 2 | Snare | Bus 1 | Input 2 |
| 3 | Toms | Bus 1 | Input 3 |
| 4 | OH/Room | Bus 1 | Input 4 |

### Bass (Tracks 5-6)

| Track | Name | Output | Input |
|-------|------|--------|-------|
| 5 | Bass DI | Bus 2 | Input 5 |
| 6 | Bass Amp | Bus 2 | Input 6 |

### Guitars (Tracks 7-10)

| Track | Name | Output | Input |
|-------|------|--------|-------|
| 7 | GTR L | Bus 3 | Input 7 |
| 8 | GTR R | Bus 3 | Input 8 |
| 9 | Acoustic | Bus 3 | Input 9 |
| 10 | GTR Clean | Bus 3 | Input 10 |

### Keys (Tracks 11-14)

| Track | Name | Output | Input |
|-------|------|--------|-------|
| 11 | Piano | Bus 4 | — |
| 12 | Synth | Bus 4 | — |
| 13 | Pad | Bus 4 | — |
| 14 | EP | Bus 4 | — |

### Vocals (Tracks 15-18)

| Track | Name | Output | Input |
|-------|------|--------|-------|
| 15 | Lead Vox | Bus 5 | Input 1 |
| 16 | BG Vox L | Bus 5 | Input 2 |
| 17 | BG Vox R | Bus 5 | Input 3 |
| 18 | Harmonies | Bus 5 | Input 4 |

### FX/SFX (Tracks 19-20)

| Track | Name | Output | Input |
|-------|------|--------|-------|
| 19 | Riser/FX | Bus 6 | — |
| 20 | Impact/SFX | Bus 6 | — |

For each track:
1. Track > New Audio Track (or Option+Cmd+N)
2. Set output to the appropriate bus (not Stereo Out)
3. Rename the track
4. Color-code to match its bus group

### Loading Mixing Presets on Tracks

Individual tracks get frequency-domain mixing presets based on their content:

| Track | Recommended Preset | Why |
|-------|-------------------|-----|
| Kick | MPD-CLA-SUB | Fundamental below 80 Hz |
| Snare | MPD-CLA-HI-MID | Crack and body 500 Hz-2 kHz |
| Toms | MPD-CLA-LO-MID | Body and attack 80-500 Hz |
| OH/Room | MPD-CLA-AIR | Shimmer and air 8-20 kHz |
| Bass DI | MPD-CLA-SUB | Sub-bass fundamental |
| Bass Amp | MPD-CLA-LO-MID | Harmonics and midrange grit |
| GTR L/R | MPD-CLA-HI-MID | Presence and bite |
| Acoustic | MPD-CLA-HIGH | Pick attack and clarity 2-8 kHz |
| GTR Clean | MPD-CLA-HI-MID | Clean presence |
| Piano | MPD-CLA-HI-MID | Body and clarity |
| Synth | MPD-CLA-HIGH | High harmonic content |
| Pad | MPD-CLA-LO-MID | Warmth and body |
| EP | MPD-CLA-HI-MID | Bell-like presence |
| Lead Vox | MPD-CLA-HI-MID | Vocal clarity and presence |
| BG Vox | MPD-CLA-HIGH | Brightness, sit behind lead |
| Harmonies | MPD-CLA-HIGH | Complementary brightness |
| Riser/FX | MPD-CLA-AIR | Open, shimmery character |
| Impact/SFX | MPD-CLA-SUB | Low-end weight |

> **Note:** These are starting points. Swap presets based on the actual content of each track.

---

## Step 5: Configure Sends on All Tracks

Add 4 sends to every audio track and busses 1-6. All sends start at **-inf (off)** by default.

### Adding Sends

For each audio track and busses 1-6:
1. In the Mixer (Cmd+2) or Channel Strip inspector, click an empty Send slot
2. Route to the FX send bus:
   - Send 1 > **Bus 9** (SHORT VERB)
   - Send 2 > **Bus 10** (LONG VERB)
   - Send 3 > **Bus 11** (SLAP DLY)
   - Send 4 > **Bus 12** (LONG DLY)
3. Set send mode to **Post-Fader** (default, recommended)
4. Leave all send levels at **-inf** (off)

### Recommended Starting Send Levels

These are suggested starting points — adjust to taste:

| Source Bus | SHORT VERB | LONG VERB | SLAP DLY | LONG DLY |
|------------|-----------|-----------|----------|----------|
| DRUMS | -12 dB | Off | -18 dB | Off |
| BASS | Off | Off | Off | Off |
| GUITARS | -10 dB | -14 dB | Off | -16 dB |
| KEYS | -12 dB | -10 dB | Off | Off |
| VOCALS | -8 dB | -12 dB | -14 dB | -12 dB |
| FX | Off | Off | Off | Off |

> **Tip:** Apply sends at the bus level rather than per-track for consistent group reverb. Only use per-track sends when a specific track needs different FX treatment than its group.

---

## Step 6: Arrange the Mixer

Organize the mixer for fast navigation:

### Recommended Mixer Order (left to right)

```
[Tracks 1-4] [Bus 1] | [Tracks 5-6] [Bus 2] | [Tracks 7-10] [Bus 3] |
[Tracks 11-14] [Bus 4] | [Tracks 15-18] [Bus 5] | [Tracks 19-20] [Bus 6] |
[FX 1-4] | [Bus 7: MIX] | [Bus 8: MASTER]
```

### Track Stacks (Optional but Recommended)

Group tracks into Summing Stacks for cleaner arrangement:
1. Select tracks 1-4, then Track > Create Track Stack > **Summing Stack**
2. Name the stack "DRUMS" — this creates a folder in the arrangement
3. Repeat for each group: BASS (5-6), GUITARS (7-10), KEYS (11-14), VOCALS (15-18), FX (19-20)

> **Note:** If using Summing Stacks, the stack's output bus becomes the group bus automatically. Verify routing after creating stacks.

---

## Step 7: Set Channel Strip I/O Defaults

### Headroom Settings

| Channel | Fader | Pan |
|---------|-------|-----|
| All audio tracks | -6 dB | C (center) |
| Busses 1-6 | 0 dB | C |
| FX returns 1-4 | 0 dB | C |
| Bus 7 (MIX) | 0 dB | C |
| Bus 8 (MASTER) | 0 dB | C |

Starting audio tracks at **-6 dB** provides headroom before the bus stage.

### Pan Defaults (Adjust Per Song)

| Track | Pan |
|-------|-----|
| Kick | C |
| Snare | C |
| Toms | -20 to +20 |
| OH/Room | -40/+40 (stereo) |
| Bass DI | C |
| Bass Amp | C |
| GTR L | -50 |
| GTR R | +50 |
| Acoustic | +25 |
| Lead Vox | C |
| BG Vox L | -30 |
| BG Vox R | +30 |

---

## Step 8: BCF2000 Setup (Optional)

If using a Behringer BCF2000 hardware controller:

1. Connect BCF2000 via USB
2. Logic Pro > Settings > Control Surfaces > Setup
3. Add the BCF2000 (should auto-detect)
4. See `spec/bcf2000.md` for detailed encoder mapping

### Quick BCF2000 Workflow

- Select a track/bus in Logic
- The BCF2000's 8 rotary encoders map to Smart Controls knobs 1-8
- Knob assignments follow the selected channel's preset automatically
- Switch between tracks to control different presets with the same 8 knobs

---

## Step 9: Save as Template

1. Verify all routing (see Step 10 first)
2. File > Save as Template...
3. Template name: `MPD-CLA Template`
4. Collection: **My Templates** (or create a new collection)
5. Click **Save**

The template is saved to:
```
~/Music/Audio Music Apps/Project Templates/MPD-CLA Template.logicx
```

### Using the Template

When starting a new project:
1. File > New from Template
2. Select **MPD-CLA Template**
3. All busses, FX sends, and routing are pre-configured
4. Import/record audio to the appropriate tracks
5. Swap mixing presets on tracks as needed for the specific song

---

## Step 10: Verification Checklist

Run through these checks before saving the template.

### Routing Verification

- [ ] All audio tracks output to their assigned bus (1-6), NOT to Stereo Out
- [ ] Busses 1-6 all output to Bus 7 (MIX)
- [ ] Bus 7 (MIX) outputs to Bus 8 (MASTER)
- [ ] Bus 8 (MASTER) outputs to Output 1-2 (Stereo Out)
- [ ] FX returns (Bus 9-12) all output to Bus 7 (MIX)
- [ ] No track or bus outputs directly to Stereo Out (except Bus 8)

### Signal Flow Test

1. Play test audio through one track per bus group
2. Verify signal appears on Bus 1-6 meters
3. Verify signal sums into Bus 7 (MIX)
4. Verify signal passes through Bus 8 (MASTER)
5. Verify signal reaches Output 1-2

### FX Send Test

1. Raise Send 1 (SHORT VERB) on a vocal track to -6 dB
2. Verify signal appears on the SHORT VERB return (Bus 9)
3. Verify the reverb return sums into Bus 7 (MIX)
4. Repeat for each FX send
5. Reset all test sends to -inf

### Preset Verification

- [ ] Each bus has its correct preset loaded (check Smart Control labels)
- [ ] Each FX return has its correct preset loaded
- [ ] Bus 7 labels: INPUT / LOW / HIGH / GLUE / WARM / WIDTH / AIR / OUTPUT
- [ ] Bus 8 labels: INPUT / LOW / HIGH / GLUE / LOUD / WIDTH / CEILING / OUTPUT
- [ ] FX returns show effect-specific knob labels (DECAY, TIME, etc.)
- [ ] Sweep each knob on Bus 7 and Bus 8 — verify parameter responds

### Gain Staging Check

1. Play pink noise or test audio at -18 dBFS through all tracks simultaneously
2. Bus 1-6 meters should read approximately -12 to -6 dBFS
3. Bus 7 (MIX) should read approximately -6 to 0 dBFS
4. Bus 8 (MASTER) should not clip with all presets at default settings

---

## Troubleshooting

### "No signal on bus"
- Check the track's output assignment in the Mixer — it may have reverted to Stereo Out
- Verify the Aux channel strip's input matches the expected bus number

### "FX send has no effect"
- Confirm the FX return Aux input matches the send bus number (Bus 9/10/11/12)
- Check that the FX preset is 100% wet (not a dry/wet mix issue)
- Verify send level is raised above -inf on the source track

### "Preset won't load on bus"
- Bus/Aux channels use the same preset library as audio tracks
- Ensure you're loading from **Patches** (Library, Y key) not Channel Strip Settings
- Smart Controls only persist in .patch format

### "Clicking/distortion at bus stage"
- Reduce individual track faders — summing many tracks at 0 dB causes clipping
- Use the -6 dB track fader default as your starting point
- The DRIVE knob on bus presets adds input gain — start at 0

---

## File Locations Reference

```
~/Music/Audio Music Apps/
├── Project Templates/
│   └── MPD-CLA Template.logicx          <-- This template
├── Channel Strip Settings/MPD-CLA/
│   ├── MPD-CLA-SUB.cst                  <-- Mixing presets
│   ├── MPD-CLA-LO-MID.cst
│   ├── MPD-CLA-HI-MID.cst
│   ├── MPD-CLA-HIGH.cst
│   ├── MPD-CLA-AIR.cst
│   ├── MPD-BUS-DRUMS.cst                <-- Bus presets
│   ├── MPD-BUS-BASS.cst
│   ├── MPD-BUS-GUITARS.cst
│   ├── MPD-BUS-KEYS.cst
│   ├── MPD-BUS-VOCALS.cst
│   ├── MPD-BUS-FX.cst
│   ├── MPD-BUS-MIX.cst
│   ├── MPD-FX-SHORT-VERB.cst            <-- FX send presets
│   ├── MPD-FX-LONG-VERB.cst
│   ├── MPD-FX-SLAP-DLY.cst
│   ├── MPD-FX-LONG-DLY.cst
│   ├── MPD-MASTER-BUS.cst               <-- Mastering presets
│   ├── MPD-MASTER-SUB.cst
│   ├── MPD-MASTER-LO-MID.cst
│   ├── MPD-MASTER-HI-MID.cst
│   ├── MPD-MASTER-HIGH.cst
│   ├── MPD-MASTER-AIR.cst
│   ├── MPD-MASTER-STREAM.cst
│   └── MPD-MASTER-MULTI.cst
└── Patches/MPD-CLA/
    └── (same filenames with .patch extension)
```
