# Ansible playbook for setting up my machines


- macOS: FIX lscolors

- FIX mute audio

- GNome Extensions ??
- FIX coapp





## TODOs
* Debian:
  * Nautilus show hidden not working
  * GNOME display desktop icons using an extension OR nemo
  * UI apps not working     (but works before playbook has been run):
    ```
    ❯ echo $XDG_SESSION_TYPE
    wayland

    ❯ xdg-open .latexmkrc
    ~  Authorization required, but no authorization protocol specified
   [3030:1018/155622.586976:ERROR:ozone_platform_x11.cc(240)] Missing X server or $DISPLAY
   [3030:1018/155622.587008:ERROR:env.cc(255)] The platform failed to initialize.  Exiting.
   The futex facility returned an unexpected error code.

   ❯ codium .latexmkrc
   NOTHING HAPPENS …
   ```


### General
#### Darwin
* SYSTEM settings:
  * **Add message to lock-screen**
  `sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText “ENTER HERE”`
  * SOUND:
    ```
    defaults write -g "com.apple.sound.beep.feedback" -int 0
    defaults write "com.apple.systemsound" "com.apple.sound.uiaudio.enabled" -int 0
    killall -HUP SystemUIServer
    ```

  * **Disable usb drive not properly ejected warning**:
    `sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd`

  * **Change scroll direction**
    `defaults write -g com.apple.swipescrolldirection -bool FALSE`

* `systemsetup (get|set)wakeonmodem <bool>`

* FINDER settings:
  ```
  # Enable snap-to-grid for icons on the desktop and in other icon views
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

  # Set the size of icons on the desktop and in other icon views
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
  ```

* APP settings:
  ```
  ch.sudo.cyberduck, com.colliderli.iina, com.ranchero.NetNewsWire-Evergreen, org.wireshark.Wireshark, org.videolan.vlc, net.freemacsoft.AppCleaner:
    SUAutomaticallyUpdate: false
    SUEnableAutomaticChecks: false

  org.tempel.prefseditor:
    SUEnableAutomaticChecks

  org.m0k.transmission:
    BlocklistAutoUpdate
    BlocklistURL: http://john.bitsurge.net/public/biglist.p2p.gz
    DownloadFolder: /Users/gg/Downloads/torrents
    IncompleteDownloadFolder: /Users/gg/Downloads/torrents
    SUEnableAutomaticChecks

  net.tunnelblick.tunnelblick:
    updateCheckAutomatically
    SUEnableAutomaticChecks

  de.pascalbraband.SlidePilot:
    SUEnableAutomaticChecks
    SUSendProfileInfo

  com.samscott.maestral / com.samscott.maestral-cocoa, com.soggywaffles.paintbrush:
    SUEnableAutomaticChecks

  com.readdle.PDFExpert-Mac:
    SUAutomaticallyUpdate

  com.raycast.macos:
    amplitudePulseAnalyticsTracker_didSendInstallationEvent
    emojiPicker_skinTone: standard

  com.ranchero.NetNewsWire-Evergreen:
    openInBrowserInBackground: No

  com.googlecode.iterm2:
    PromptOnQuit: No
    PrefsCustomFolder: /Users/gary/.config/iterm2/
    SUSendProfileInfo
  ```


* [Mac App Store apps](https://github.com/mas-cli/mas/blob/main/README.md):
  * Uninstall iMovie, Pages, Numbers, GarageBand
  * Install Keynote, dict.cc, DjVu Viewer + DjVu to PDF

* Install X11

* SW:
  * https://github.com/Lymphatus/caesium-image-compressor  (once stable)


##### Apps
* **Blackhole**: Record Sysaudio
  * Open *Audio MIDI Setup*
    * Click *Create Multi-Output Device* (REQUIRED; will be later set in System Preferences under *Sound* as *Output* device when recording)
      * Name it "bh + <device>" (e.g., built-in output)
      * Check checkbox for device + *BlackHole 16ch* (IMPORTANT: *BlackHole 16ch* must be LAST in list)
      * Select the Drift Correction checkbox for any devices not designated clock master + Make sure sample rates of ALL devices match
    * Click *Create Aggregate Device* (OPTIONAL; will be later set in Screen capture utility as *Microphone* when Mic + SysAudio (BlackHole) shall be recorded)
      * Name it "bh + <device>" (e.g., internal mic)
      * Check checkbox for device + *BlackHole 16ch* (IMPORTANT: *BlackHole 16ch* must be FIRST in list)
  * Record:
    * Record System Audio (Blackhole) only:
      * System Preferences: *Sound* &rarr; *Output* &rarr; *bh + built-in output*
      * Cmd + Shift + 5 (in Screen capture utility): *Options* &rarr; *BlackHole 16ch*
    * Record System Audio (Blackhole) + mic:
      * System Preferences: *Sound* &rarr; *Output* &rarr; *bh + built-in output*
      * Cmd + Shift + 5 (in Screen capture utility): *Options* &rarr; *bh + internal mic*



### *client-devel*
* not indempotent ISSUE:
   * Firefox settings after restart
   * TASK [petermosmans.customize-gnome : Download GNOME Shell extensions]
* Consider switching all apps to flatpak  (EVENTUALLY firefox, vscodium)

### *server*
* ON ALL DISTROS: USE **netplan + systemd-networkd**

* **SECURITY**: https://christitus.com/linux-security-mistakes/  (Fail2ban)
* !!!!!!!!!!!!!!!!!!!     Add restricted www user     !!!!!!!!!!!!!!!!!!!

### *home_server*
* pihole + unbound:
  * https://git.bln41.win/b30/pudc/src/branch/main/docker-compose.yml
  * https://hub.docker.com/r/klutchell/unbound
  * https://github.com/pi-hole/docker-pi-hole#environment-variables

* **Backup** via borg: https://github.com/borgbackup/borg/issues/4532, https://linuxtut.com/en/d34053037468488eacab/
* Containers:
  * ( filebrowser: restart container iff config file has changed AND container is ALREADY RUNNING  ( see traefik, BUT ONLY IF CONFIG FILE HAS CHANGED ) )
* FUTURE WORK:
  * **SSO service** 4 which allows authenticating all services   (https://goauthentik.io/, https://github.com/authelia/authelia)
    * REQUIREMENT: [oauth2, etc. support (also for protected application necessary)](https://www.reddit.com/r/selfhosted/comments/s9ky8f/pass_credentials_from_authelia_to_protected/)
    * [Guide: 2 Factor Auth and Single Sign On with Authelia](https://piped.kavin.rocks/watch?v=u6H-Qwf4nZA)
  * **Switch Notifications to a service**  (e.g., by using https://github.com/caronc/apprise)
  * Services:
    * **https://academy.pointtosource.com/containers/ebooks-calibre-readarr/**
    * Heimdall
---



## "Usage"
### Pre ansible-run setup steps
* Install "dependencies" for playbook: **`ansible-galaxy install -r requirements.yml`**
* OPTIONAL: Add own systems to be managed in dedicated local inventory:
  * `cp inventory.yml ~/.ansible-inventory.yml`
  * **New system** &mdash; Initial setup steps   (see also: https://stackoverflow.com/questions/34333058/ansible-change-ssh-port-in-playbook):
    * (0.) Distro specific "preps":
      * Ubuntu (non Server): **`sudo apt install -y ssh`**
      * Debian: `su` &rarr; `apt install sudo  &&  /sbin/usermod -aG sudo <username>  &&  /sbin/reboot`
    * (1.) SSH login for Ansible:
      * (1.1.) Generate new ssh key using custom script `ssh-key_generate` (which adds entry automatically to `.ssh/config`)
      * (1.2.) Add `HostNamne <hostname>`
      * (1.3.) Copy new key to new system: **`ssh-copy-id -i ~/.ssh/<identity-file>.pub <user>@<ip>`**
      * (1.4.) IF SSH PORT SHALL BE CHANGED: Add AFTER initial ansible run: `Port 2233`
    * UBUNTU SERVER -- extend llvm (if formatted incorrect):
      ```bash
      sudo  lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
      sudo resize2fs /dev/mapper/ubuntu–vg-ubuntu–lv
      ```

### RUN Playbook
* Cache SSH passphrase: `eval `ssh-agent` && ssh-add ~/.ssh/<cert-file>`
* Exec 4 specific client: **`ansible-playbook --vault-pass-file ~/.ansible-vault main.yml`**
  * Flags:
    * `--ask-vault-pass`  (when not using `--vault-pass-file <file>`)
    * **`--ask-become-pass`**  (may be required for 1st ansible run (if not set as host var '`ansible_sudo_pass`' in inventory), but not afterwards (due to passwordless sudo))
    * **`--tags "<tag>,"`: Target only tagged tasks**
    * **`--limit "host1,host2,..."`: Only specified hosts**
    * **`-i <inventory-file>`: Inventory (list ips/hostnames OR file)**
    * `-e "<key>=<value>"`: Overwrite vars
    * `--list-hosts`: Only list matching hosts

#### POST ansible run (i.e., not automated steps)
* *clients*:
  * Enable installed Gnome extensions (via 'Extensions app')  (!!  TODO: AUTOMATE  !!)
* *Dev clients*:
  * Apps setup
    * *VSCod~~e~~ium*: Install extension 'Settings Sync' & follow instructions
    * *Firefox*:
      * Go to [about:profiles](about:profiles) and *Launch profile in new browser* for 'default'
      * Open [about:profiles](about:profiles) again in a new browser window & delete the other profile, including data
      * Allow extensions
      * Right click on Bookmarks bar &rarr; *Manage bookmarks* &rarr; *Import and Backup* &rarr; *Restore* &rarr; *Choose File* &rarr; Select the hidden firefox default bookmarks file
      * Cleanup &mldr;




---
## References (Ex.s) / GUIDELINEs
### SECURE SERVER
* (1.) Use secure & encrypted communication
* (2.) Disable root login & use `sudo`
* (3.) Remove unused software, open only required ports
* (4.) Use the principle of least privilege
* (5.) Update the OS & installed software
* (6.) Use a properly-configured firewall
* (7.) Make sure log files are populated & rotated
* (8.) Monitor logins & block suspect IP addresses

### Darwin
* EX.s: https://github.com/geerlingguy/mac-dev-playbook
* `defaults` command:
  * List all the domains available: `defaults domains > domainslist.txt`
  * List all its current key-value pairs: `defaults read com.apple.finder > finderdefaults.txt`
  * Write setting: `defaults write com.apple.finder AppleShowAllFiles true`
  * Delete setting: &mldr;
* ALTERNATIVELY: `prefs-editor` cask


### Misc. Ansible Commands
#### Dev
* Validate playbook: `ansible-playbook main.yml --syntax-check`
* Encrypt:
  * `ansible-vault encrypt <file>`   /   `ansible-vault decrypt <file>`
  * `ansible-vault encrypt_string <string>`

#### ( Ad-hoc commands )
* `ansible <group>  -m <module>`
  * `--key-file ~/.ssh/rpi`
  * `-i inventory`
  * `--list-hosts`
  * `--become --ask-become-pass`: Privilege escalation
  * Useful modules: `ping` (not ICMP ping !!), `gather_facts`


