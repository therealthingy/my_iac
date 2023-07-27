# Playbook for Darwin machines

RUN: `ansible-playbook main.yml`


# TODO:
## THINGS 2 CONSIDER 4 Mac playbook
- User should have name 'gg'
- SW:
  - https://github.com/Lymphatus/caesium-image-compressor  (once stable)
  - Android emulator 4 Whatsapp  (BlueStacks ??)



## References (Ex.s)
* https://github.com/geerlingguy/mac-dev-playbook

## OS setup
* SYSTEM:
  * **Disable usb drive not properly ejected warning**:
    `sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd`
  * **Add message to lock-screen**
    `sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText “ENTER HERE”`
   * **Disable chime**:
     `defaults write com.apple.PowerChime ChimeOnNoHardware -bool true;killall PowerChime`
  * `sudo systemsetup -setremotelogin on`
* USER:
  * **Print-Dialog always expanded**
    `defaults write -g PMPrintingExpandedStateForPrint -bool TRUE`
  * **Change scroll direction**
    `defaults write -g com.apple.swipescrolldirection -bool FALSE`
  * **Show full file path in Finder**
    `defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES; killall Finder`
  * **Disable ń popup after long pressing n, ...**
    `defaults write -g ApplePressAndHoldEnabled -bool FALSE`
  * **Change Screenshot format**
    `defaults write com.apple.screencapture type JPG` (JPG, PNG, TIFF, PDF)
  * **Disable shadow for window Screenshots** (via `Command + Shift + 4` &rarr; `Space`):
    `defaults write com.apple.screencapture disable-shadow -bool TRUE; killall SystemUIServer`
  * **Make apps hidden in Dock**
    `defaults write com.apple.Dock showhidden -bool TRUE; killall Dock`
  * **Eliminate Dock reveal delay**
    * No animation: `defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock`
    * Super-fast animation: `defaults write com.apple.dock autohide-time-modifier -float 0.12;killall Dock`
    * Revert to default: `defaults delete com.apple.dock autohide-time-modifier;killall Dock`


## Apps
* Install *Xcode Command Line Tools*: `xcode-select --install`

### Blackhole: Record Sysaudio
#### How it works
- OS sends Audio to Speakers AND Blackhole
- Screen capture uses Blackhole (or bh+mic for audio)

#### Setup
* Open *Audio MIDI Setup*
  * Click *Create Multi-Output Device* (REQUIRED; will be later set in System Preferences under *Sound* as *Output* device when recording)
    * Name it "bh + <device>" (e.g., built-in output)
    * Check checkbox for device + *BlackHole 16ch* (IMPORTANT: *BlackHole 16ch* must be LAST in list)
    * Select the Drift Correction checkbox for any devices not designated clock master + Make sure sample rates of ALL devices match
  * Click *Create Aggregate Device* (OPTIONAL; will be later set in Screen capture utility as *Microphone* when Mic + SysAudio (BlackHole) shall be recorded)
    * Name it "bh + <device>" (e.g., internal mic)
    * Check checkbox for device + *BlackHole 16ch* (IMPORTANT: *BlackHole 16ch* must be FIRST in list)

#### Record
* Record System Audio (Blackhole) only:
  * System Preferences: *Sound* &rarr; *Output* &rarr; *bh + built-in output*
  * Cmd + Shift + 5 (in Screen capture utilty): *Options* &rarr; *BlackHole 16ch*
* Record System Audio (Blackhole) + mic:
  * System Preferences: *Sound* &rarr; *Output* &rarr; *bh + built-in output*
  * Cmd + Shift + 5 (in Screen capture utilty): *Options* &rarr; *bh + internal mic*





---
## Misc.
### Linux VMs
* [Using Apple Mac Keyboard with Ubuntu](https://www.unixfu.ch/using-apple-mac-keyboard-with-ubuntu/):
  * Ubuntu Linux sets the keyboard parameters in the file `/etc/default/keyboard`.
  * You can set the content manually in /etc/default/keyboard:
    ```
    XKBMODEL="macintosh"
    XKBLAYOUT="ch"
    XKBVARIANT="de_mac"
    XKBOPTIONS="lv3:alt_switch"

    BACKSPACE="guess"
    ```
  * or you can go through the installation process: Run
    ```
    sudo apt-get install keyboard-configuration
    sudo dpkg-reconfigure keyboard-configuration
    ```
