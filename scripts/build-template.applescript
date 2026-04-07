-- MPD-CLA Logic Pro Template Builder
-- Semi-automated template construction via UI scripting
--
-- USAGE:
--   1. Open Script Editor on your Mac
--   2. File > Open > this file
--   3. Ensure Logic Pro is installed and closed
--   4. Enable UI scripting: System Settings > Privacy & Security > Accessibility
--      > add Script Editor (and Terminal if running from command line)
--   5. Click Run. Follow the dialog prompts between phases.
--
-- WHAT THIS AUTOMATES:
--   - Launches Logic Pro and creates a new empty project
--   - Creates 20 audio tracks in bulk
--   - Creates 12 auxiliary channels (8 busses + 4 FX returns)
--   - Opens Save As Template at the end
--
-- WHAT YOU DO MANUALLY (between dialog pauses):
--   - Name each track/bus
--   - Set bus input/output routing
--   - Load preset patches from the Library (Y)
--   - Configure sends on tracks
--   - Verify the routing per TEMPLATE-BUILD-GUIDE.md Step 10
--
-- Reference: TEMPLATE-BUILD-GUIDE.md in the repo root

on pauseForUser(stepName, instructions)
	display dialog stepName & return & return & instructions buttons {"Quit", "Continue"} default button "Continue" with title "MPD-CLA Template Builder"
	if button returned of result is "Quit" then error number -128
end pauseForUser

on clickMenu(menuPath)
	-- menuPath is a list of menu item names from top-level to leaf
	tell application "System Events"
		tell process "Logic Pro"
			set topMenu to item 1 of menuPath
			tell menu bar 1
				tell menu bar item topMenu
					click
					delay 0.2
					set currentMenu to menu 1
					repeat with i from 2 to (count of menuPath)
						set nextItem to item i of menuPath
						if i is (count of menuPath) then
							click menu item nextItem of currentMenu
						else
							tell menu item nextItem of currentMenu
								click
								delay 0.2
								set currentMenu to menu 1
							end tell
						end if
					end repeat
				end tell
			end tell
		end tell
	end tell
end clickMenu

on keystrokeCmd(theKey)
	tell application "System Events"
		keystroke theKey using command down
	end tell
	delay 0.3
end keystrokeCmd

on keystrokeCmdOpt(theKey)
	tell application "System Events"
		keystroke theKey using {command down, option down}
	end tell
	delay 0.3
end keystrokeCmdOpt

-- =====================================================================
-- MAIN SCRIPT
-- =====================================================================

-- Phase 0: Launch Logic Pro
tell application "Logic Pro" to activate
delay 2

my pauseForUser("Phase 1: New Empty Project", "Script will now:
  1. Open File > New
  2. You select 'Empty Project' in the dialog
  3. Set Sample Rate = 48 kHz, Bit Depth = 24-bit
  4. When the 'New Tracks' dialog appears, click Cancel
  5. Come back here and click Continue")

my keystrokeCmd("n")
delay 1

my pauseForUser("Waiting", "Confirm you selected Empty Project, set 48kHz/24-bit, and cancelled the New Tracks dialog. Then click Continue.")

-- Phase 2: Create 20 audio tracks
my pauseForUser("Phase 2: Create 20 Audio Tracks", "Script will open the New Tracks dialog (Opt+Cmd+N), then you:
  1. Select 'Audio' track type
  2. Set Number = 20
  3. Check 'Open Library'
  4. Click Create
  5. Come back and click Continue")

my keystrokeCmdOpt("n")
delay 1

my pauseForUser("Waiting", "After the 20 audio tracks are created, click Continue.")

-- Phase 3: Rename and assign outputs to audio tracks
my pauseForUser("Phase 3: Name & Route Audio Tracks", "For each of the 20 tracks, rename and set output to the correct bus:

Track 1 Kick       -> Bus 1    Track 11 Piano     -> Bus 4
Track 2 Snare      -> Bus 1    Track 12 Synth     -> Bus 4
Track 3 Toms       -> Bus 1    Track 13 Pad       -> Bus 4
Track 4 OH/Room    -> Bus 1    Track 14 EP        -> Bus 4
Track 5 Bass DI    -> Bus 2    Track 15 Lead Vox  -> Bus 5
Track 6 Bass Amp   -> Bus 2    Track 16 BG Vox L  -> Bus 5
Track 7 GTR L      -> Bus 3    Track 17 BG Vox R  -> Bus 5
Track 8 GTR R      -> Bus 3    Track 18 Harmonies -> Bus 5
Track 9 Acoustic   -> Bus 3    Track 19 Riser/FX  -> Bus 6
Track 10 GTR Clean -> Bus 3    Track 20 Impact    -> Bus 6

Double-click track name to rename. Click the output slot to route.
Also set all faders to -6 dB.")

-- Phase 4: Create 8 busses (aux channels) via mixer
my pauseForUser("Phase 4: Create 8 Busses (Reverse Order)", "Script will open the Mixer (Cmd+2). Then for each bus below, use:
  Options menu > Create New Auxiliary Channel Strips... (or click + in mixer)

Create in this order (routing target must exist first):

  Bus 8: MASTER   input=Bus 8,  output=Stereo Out,  patch=MPD-MASTER-BUS
  Bus 7: MIX      input=Bus 7,  output=Bus 8,       patch=MPD-BUS-MIX
  Bus 1: DRUMS    input=Bus 1,  output=Bus 7,       patch=MPD-BUS-DRUMS
  Bus 2: BASS     input=Bus 2,  output=Bus 7,       patch=MPD-BUS-BASS
  Bus 3: GUITARS  input=Bus 3,  output=Bus 7,       patch=MPD-BUS-GUITARS
  Bus 4: KEYS     input=Bus 4,  output=Bus 7,       patch=MPD-BUS-KEYS
  Bus 5: VOCALS   input=Bus 5,  output=Bus 7,       patch=MPD-BUS-VOCALS
  Bus 6: FX       input=Bus 6,  output=Bus 7,       patch=MPD-BUS-FX

Load the preset on each bus from Library (Y) > User Patches > MPD-CLA.")

my keystrokeCmd("2")
delay 1

my pauseForUser("Waiting", "Click Continue when all 8 busses are created, named, routed, and have patches loaded.")

-- Phase 5: Create 4 FX send returns
my pauseForUser("Phase 5: Create 4 FX Send Returns", "Create 4 more aux channels for FX returns:

  Send 1: SHORT VERB   input=Bus 9,   output=Bus 7,  patch=MPD-FX-SHORT-VERB
  Send 2: LONG VERB    input=Bus 10,  output=Bus 7,  patch=MPD-FX-LONG-VERB
  Send 3: SLAP DLY     input=Bus 11,  output=Bus 7,  patch=MPD-FX-SLAP-DLY
  Send 4: LONG DLY     input=Bus 12,  output=Bus 7,  patch=MPD-FX-LONG-DLY

IMPORTANT: FX returns output to Bus 7 (MIX), NOT Bus 8.
All FX presets are 100% wet.")

-- Phase 6: Configure sends on tracks and busses
my pauseForUser("Phase 6: Configure Sends", "On every audio track AND busses 1-6, add 4 sends:
  Send 1 -> Bus 9  (SHORT VERB)
  Send 2 -> Bus 10 (LONG VERB)
  Send 3 -> Bus 11 (SLAP DLY)
  Send 4 -> Bus 12 (LONG DLY)

Mode = Post-Fader. Leave all send levels at -inf.

Tip: select all tracks and shift-click a send slot to add to all at once.")

-- Phase 7: Load mixing presets on audio tracks
my pauseForUser("Phase 7: Load Track Presets", "Select each track and load its mixing preset from Library (Y):

  Kick        -> MPD-CLA-SUB        Piano     -> MPD-CLA-HI-MID
  Snare       -> MPD-CLA-HI-MID     Synth     -> MPD-CLA-HIGH
  Toms        -> MPD-CLA-LO-MID     Pad       -> MPD-CLA-LO-MID
  OH/Room     -> MPD-CLA-AIR        EP        -> MPD-CLA-HI-MID
  Bass DI     -> MPD-CLA-SUB        Lead Vox  -> MPD-CLA-HI-MID
  Bass Amp    -> MPD-CLA-LO-MID     BG Vox    -> MPD-CLA-HIGH
  GTR L/R     -> MPD-CLA-HI-MID     Harmonies -> MPD-CLA-HIGH
  Acoustic    -> MPD-CLA-HIGH       Riser/FX  -> MPD-CLA-AIR
  GTR Clean   -> MPD-CLA-HI-MID     Impact    -> MPD-CLA-SUB")

-- Phase 8: Verification
my pauseForUser("Phase 8: Verification Checklist", "Run through the checklist in TEMPLATE-BUILD-GUIDE.md Step 10:

ROUTING
  [ ] All audio tracks -> Bus 1-6 (NOT Stereo Out)
  [ ] Busses 1-6 -> Bus 7 (MIX)
  [ ] Bus 7 -> Bus 8
  [ ] Bus 8 -> Output 1-2
  [ ] FX returns (Bus 9-12) -> Bus 7

SIGNAL FLOW
  [ ] Play test audio: verify meters on Bus 1-6, Bus 7, Bus 8

PRESETS
  [ ] Each bus shows correct Smart Control labels
  [ ] Bus 7: INPUT/LOW/HIGH/GLUE/WARM/WIDTH/AIR/OUTPUT
  [ ] Bus 8: INPUT/LOW/HIGH/GLUE/LOUD/WIDTH/CEILING/OUTPUT

GAIN STAGING
  [ ] Track faders at -6 dB
  [ ] Bus faders at 0 dB")

-- Phase 9: Save as Template
my pauseForUser("Phase 9: Save as Template", "Script will trigger File > Save as Template. Then:
  1. Template name: MPD-CLA Template
  2. Collection: My Templates (or create a new one)
  3. Click Save

Template will save to:
  ~/Music/Audio Music Apps/Project Templates/MPD-CLA Template.logicx")

try
	my clickMenu({"File", "Save as Template..."})
on error
	display dialog "Couldn't find Save as Template menu item automatically. Please use File > Save as Template... manually." buttons {"OK"} default button "OK"
end try

display dialog "MPD-CLA Template build complete!" & return & return & "Verify it appears in File > New from Template." buttons {"Done"} default button "Done" with title "MPD-CLA Template Builder"
