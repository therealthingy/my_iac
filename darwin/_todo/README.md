sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd

## Misc.
### System `default`s
 `defaults write com.apple.PowerChime ChimeOnNoHardware -bool true;killall PowerChime`


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
## Linux VMs
### [Using Apple Mac Keyboard with Ubuntu](https://www.unixfu.ch/using-apple-mac-keyboard-with-ubuntu/)
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
