# Ansible Playbook 4 setting up my machines


## TODOs
- FIX WIREGUARD VPN


### GENERAL
- `.zshrc`:
  - clipbrd aliases:
    - GNU/Linux support
    - Sanitize filename  (TODO: `detox` doesn't work on strings)

  - `video-trim_keep` fct.:
    - allow omitting hours
    - validate: monotonically increasing
    - preview option ?!?

- Firefox:
  ```
  extensions:
      # URL on addons.mozilla.org
      - ublock-origin
      - consent-o-matic
      - umatrix
      - darkreader
      - save-page-we
      - privacy-redirect
      #- startpage-private-search
  # Privacy friendly settings reference: https://github.com/arkenfox/user.js/blob/master/user.js
  # TODOs:
  #   - Rmv 'Import bookmarks from another browser to Firefox' from bookmarks bar  (`browser.uiCustomization.state` -> ""PersonalToolbar":["import-button","personal-bookmarks"]")
  #   - DEFAULT SEARCH ENGINE  (https://superuser.com/questions/1372679/how-to-set-duckduckgo-as-default-search-engine-using-user-js)
  preferences:
      browser.aboutConfig.showWarning: false
      browser.discovery.enabled: false # Disable "Recommend extensions / features as you browse"
      browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons: false
      browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features: false
      privacy.sanitize.timeSpan: 0 # Changes Burger menu -> History -> 'Clear recent history' … -> 'Time range to clear': 'Everything'
      # Privacy - Safe browsing
      browser.safebrowsing.downloads.enabled: false
      browser.safebrowsing.downloads.remote.block_potentially_unwanted: false
      browser.safebrowsing.downloads.remote.block_uncommon: false
      browser.safebrowsing.malware.enabled: false
      browser.safebrowsing.phishing.enabled: false
      #browser.shell.checkDefaultBrowser: false
      browser.toolbars.bookmarks.visibility: "always" # Show bookmarks bar (always, newtab, never)
      browser.startup.page: 1 # 0=blank, 1=home (DEFAULT), 2=last visited page, 3=resume previous session
      browser.startup.homepage: "{{ 'https://ipleak.net/' if 'clients_media' in group_names else 'about:home' }}"
      browser.newtabpage.enabled: true
      browser.newtab.preload: false
      browser.newtabpage.activity-stream.feeds.topsites: false # We have already bookmark bar, hence shortcuts are useless
      browser.newtabpage.activity-stream.feeds.telemetry: false
      browser.newtabpage.activity-stream.telemetry: false
      browser.newtabpage.activity-stream.feeds.snippets: false
      browser.newtabpage.activity-stream.feeds.section.topstories: false
      browser.newtabpage.activity-stream.section.highlights.includePocket: false
      browser.newtabpage.activity-stream.showSponsored: false
      browser.newtabpage.activity-stream.feeds.discoverystreamfeed: false
      browser.newtabpage.activity-stream.showSponsoredTopSites: false
      browser.newtabpage.activity-stream.default.sites: ""
      browser.newtabpage.activity-stream.feeds.section.topstories.options: ""
      dom.gamepad.enabled: false
      dom.vr.enabled: false
      dom.vibrator.enabled: false
      extensions.pocket.enabled: false
      extensions.pocket.api: ""
      extensions.pocket.oAuthConsumerKey: ""
      extensions.pocket.site: "''"
      geo.provider.network.url: "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%"
      geo.provider.ms-windows-location: false # Windows
      geo.provider.use_corelocation: false # Mac
      geo.provider.use_gpsd: false # Linux
      browser.region.network.url: ""
      browser.region.update.enabled: false
      intl.accept_languages: "en-US, en"
      javascript.use_us_english_locale: true
      extensions.getAddons.showPane: false
      extensions.htmlaboutaddons.recommendations.enabled: false
      datareporting.policy.dataSubmissionEnabled: false
      datareporting.healthreport.uploadEnabled: false
      toolkit.telemetry.unified: false
      toolkit.telemetry.enabled: false
      toolkit.telemetry.server: "data:,"
      toolkit.telemetry.archive.enabled: false
      toolkit.telemetry.newProfilePing.enabled: false
      toolkit.telemetry.shutdownPingSender.enabled: false
      toolkit.telemetry.updatePing.enabled: false
      toolkit.telemetry.bhrPing.enabled: false
      toolkit.telemetry.firstShutdownPing.enabled: false
      toolkit.telemetry.coverage.opt-out: true
      toolkit.coverage.opt-out: true
      toolkit.coverage.endpoint.base: ""
      browser.ping-centre.telemetry: false
      app.shield.optoutstudies.enabled: false
      app.normandy.enabled: false
      app.normandy.api_url: ""
      breakpad.reportURL: ""
      browser.tabs.crashReporting.sendReport: false
      browser.tabs.warnOnOpen: false
      browser.tabs.warnOnClose: false
      browser.tabs.firefox-view: false # Disable 'Firefox View'
      browser.crashReports.unsubmittedCheck.autoSubmit2: false
      browser.safebrowsing.downloads.remote.enabled: false
      #browser.places.speculativeConnect.enabled: false
      browser.fixup.alternate.enabled: false # disable location bar domain guessing
      browser.search.suggest.enabled: false # location bar
      browser.urlbar.suggest.searches: false
      browser.urlbar.speculativeConnect.enabled: false
      browser.urlbar.suggest.quicksuggest.nonsponsored: false
      browser.urlbar.suggest.quicksuggest.sponsored: false
      browser.formfill.enable: false # Search & form history
      extensions.formautofill.addresses.enabled: false # Autofill
      extensions.formautofill.available: "off"
      extensions.formautofill.creditCards.available: false
      extensions.formautofill.creditCards.enabled: false
      extensions.formautofill.heuristics.enabled: false
      signon.rememberSignons: false # disable auto-filling username & password form fields
      signon.autofillForms: false
      #security.ssl.require_safe_negotiation: true
      #security.tls.enable_0rtt_data: false
      beacon.enabled: false
      privacy.sanitize.sanitizeOnShutdown: true
      privacy.clearOnShutdown.cache: true
      privacy.clearOnShutdown.downloads: true
      privacy.clearOnShutdown.formdata: true
      privacy.clearOnShutdown.history: true
      privacy.clearOnShutdown.sessions: true
      privacy.clearOnShutdown.offlineApps: false
      privacy.resistFingerprinting: true
      privacy.resistFingerprinting.block_mozAddonManager: true
      browser.messaging-system.whatsNewPanel.enabled: false
      identity.fxaccounts.enabled: false

  extensions: # NOTE: URL on addons.mozilla.org
    - video-downloader-profession
    - video-downloadhelper
    - buster-captcha-solver
    - duplicate-tabs-closer
    - old-reddit-redirect
  ```


#### Darwin
- FIX lscolors

- Add apps (VSCodium & Terminal) 2 *Developer Tools*:
  - Run in terminal: `sudo spctl developer-mode enable-terminal`
  - Go 2 System Preferences, *Security & Privacy*, *Privacy tab*, go 2 *Developer Tools* & enable it

- SYSTEM settings:
  - **Add message to lock-screen**
  `sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText “ENTER HERE”`
  - SOUND:
    ```
    defaults write -g "com.apple.sound.beep.feedback" -int 0
    defaults write "com.apple.systemsound" "com.apple.sound.uiaudio.enabled" -int 0
    killall -HUP SystemUIServer
    ```

  - **Disable usb drive not properly ejected warning**:
    `sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd`

  - **Change scroll direction**
    `defaults write -g com.apple.swipescrolldirection -bool FALSE`

  - `systemsetup (get|set)wakeonmodem <bool>`

  - FINDER settings:
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

- APP settings:
  ```
  ch.sudo.cyberduck, com.colliderli.iina, com.ranchero.NetNewsWire-Evergreen, org.wireshark.Wireshark, org.videolan.vlc, net.freemacsoft.AppCleaner:
    SUAutomaticallyUpdate: false
    SUEnableAutomaticChecks: false

  org.tempel.prefseditor:
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

  - ADD VLC config  (stored in : `~/Library/Preferences/org.videolan.vlc`)

- [Mac App Store apps](https://github.com/mas-cli/mas/blob/main/README.md):
  - Uninstall:
    - iMovie  (408981434)
    - Pages  (409201541)
    - Numbers  (409203825)
    - GarageBand  (682658836)
  - Install:
    - Synctrain  (6553985316; Internet/Tools;   replaces cask 'syncthing-app')
    - Keynote  (409183694; Office)
    - dict.cc  (327732352; Office/Misc)
    - DjVu Viewer + DjVu to PDF  (755261884; Office/Misc)

- Install X11

- SW: https://github.com/Lymphatus/caesium-image-compressor  (once stable)


#### Ubuntu
- grub:
  - cmdline:  disable all cpu mitigations `mitigations=off`  (https://unix.stackexchange.com/a/554922)
    - grep . /sys/devices/system/cpu/vulnerabilities/*
  - server role: `preempt=none`    (merge w/ rpi)
- HELIX LSPs
- install [git-crypt](https://github.com/AGWA/git-crypt/blob/master/INSTALL.md)
    PROBLEM: openssl1.x
- FIX mute audio
- GNome Extensions ??
- RPI: Replace [`timeshift-autosnap-apt`](https://github.com/wmutschl/timeshift-autosnap-apt/tree/main) w/ [`apt-btrfs-snapshot`](https://packages.ubuntu.com/search?keywords=apt-btrfs)
- ( make sure WAYLAND (`echo $XDG_SESSION_TYPE`) )


### *client-devel*
- not indempotent ISSUE:
   - Firefox settings after restart
   - TASK [petermosmans.customize-gnome : Download GNOME Shell extensions]
- Consider switching all apps to flatpak  (EVENTUALLY firefox, vscodium)


### *server*
- **SECURITY**: https://christitus.com/linux-security-mistakes/  (Fail2ban)
- !!!!!!!!!!!!!!!!!!!     Add restricted `www` user     !!!!!!!!!!!!!!!!!!!


### *home_server*
- **SSO**: [authentik](https://goauthentik.io/)
  - "highly recommend using SAML2 or OIDC when possible, LDAP should only be used as a fallback"

- **Backup** via borg: https://github.com/borgbackup/borg/issues/4532, https://linuxtut.com/en/d34053037468488eacab/

- **Switch Notifications to a service**  (e.g., by using https://github.com/caronc/apprise)

- pihole + unbound:    dns over tls
  - https://git.bln41.win/b30/pudc/src/branch/main/docker-compose.yml
  - https://hub.docker.com/r/klutchell/unbound
  - https://github.com/pi-hole/docker-pi-hole#environment-variables


## "Usage"
### PRE Ansible-Run Setup Steps
- Install "dependencies" for playbook: **`ansible-galaxy install -r requirements.yml`**
- OPTIONAL: Add own systems to be managed in dedicated local inventory:
  - `cp inventory.yml ~/.ansible-inventory.yml`
  - **New system** &mdash; Initial setup steps   (see also: https://stackoverflow.com/questions/34333058/ansible-change-ssh-port-in-playbook):
    - (0.) Distro specific "preps":
      - Ubuntu (non Server): **`sudo apt install -y ssh`**
      - Debian: `su` &rarr; `apt install sudo  &&  /sbin/usermod -aG sudo <username>  &&  /sbin/reboot`
    - (1.) SSH login for Ansible:
      - (1.1.) Generate new ssh key using custom script `ssh-key_generate` (which adds entry automatically to `.ssh/config`)
      - (1.2.) Add `HostNamne <hostname>`
      - (1.3.) Copy new key to new system: **`ssh-copy-id -i ~/.ssh/<identity-file>.pub <user>@<ip>`**
      - (1.4.) IF SSH PORT SHALL BE CHANGED: Add AFTER initial ansible run: `Port 2233`
    - UBUNTU SERVER -- extend llvm (if formatted incorrect):
      ```bash
      sudo  lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
      sudo resize2fs /dev/mapper/ubuntu–vg-ubuntu–lv
      ```

### RUN Playbook
- Cache SSH passphrase: `eval `ssh-agent` && ssh-add ~/.ssh/<cert-file>`
- Exec 4 specific client: **`ansible-playbook --vault-pass-file ~/.ansible-vault main.yml`**
  - Flags:
    - `--ask-vault-pass`  (when not using `--vault-pass-file <file>`)
    - **`--ask-become-pass`**  (may be required for 1st ansible run (if not set as host var '`ansible_sudo_pass`' in inventory), but not afterwards (due to passwordless sudo))
    - **`--tags "<tag>,"`: Target only tagged tasks**
    - **`--limit "host1,host2,..."`: Only specified hosts**
    - **`-i <inventory-file>`: Inventory (list ips/hostnames OR file)**
    - `-e "<key>=<value>"`: Overwrite vars
    - `--list-hosts`: Only list matching hosts

#### POST Ansible Run (i.e., not automated steps)
- *clients*:
  - Enable installed Gnome extensions (via 'Extensions app')  (!!  TODO: AUTOMATE  !!)

- *Dev clients*:
  - Apps setup
    - *VSCod~~e~~ium*:
      - Install extension 'zokugun.sync-settings'
      - Command -> "Sync Settings: Open the repository settings"
      - `path: ~/.config/vscodium`

    - *Firefox*:
      - Go to [about:profiles](about:profiles) and *Launch profile in new browser* for 'default'
      - Open [about:profiles](about:profiles) again in a new browser window & delete the other profile, including data
      - Allow extensions
      - Right click on Bookmarks bar &rarr; *Manage bookmarks* &rarr; *Import and Backup* &rarr; *Restore* &rarr; *Choose File* &rarr; Select the hidden firefox default bookmarks file
      - Cleanup &mldr;

- DARWIN: SETUP **Blackhole** -- Record Sysaudio:
  - Open *Audio MIDI Setup*
    - Click *Create Multi-Output Device* (REQUIRED; will be later set in System Preferences under *Sound* as *Output* device when recording)
      - Name it "bh + <device>" (e.g., built-in output)
      - Check checkbox for device + *BlackHole 16ch* (IMPORTANT: *BlackHole 16ch* must be LAST in list)
      - Select the Drift Correction checkbox for any devices not designated clock master + Make sure sample rates of ALL devices match
    - Click *Create Aggregate Device* (OPTIONAL; will be later set in Screen capture utility as *Microphone* when Mic + SysAudio (BlackHole) shall be recorded)
      - Name it "bh + <device>" (e.g., internal mic)
      - Check checkbox for device + *BlackHole 16ch* (IMPORTANT: *BlackHole 16ch* must be FIRST in list)
  - Record:
    - Record System Audio (Blackhole) only:
      - System Preferences: *Sound* &rarr; *Output* &rarr; *bh + built-in output*
      - Cmd + Shift + 5 (in Screen capture utility): *Options* &rarr; *BlackHole 16ch*
    - Record System Audio (Blackhole) + mic:
      - System Preferences: *Sound* &rarr; *Output* &rarr; *bh + built-in output*
      - Cmd + Shift + 5 (in Screen capture utility): *Options* &rarr; *bh + internal mic*


## References (Ex.s) / GUIDELINEs
### SECURE SERVER
- (1.) Use secure & encrypted communication
- (2.) Disable root login & use `sudo`
- (3.) Remove unused software, open only required ports
- (4.) Use the principle of least privilege
- (5.) Update the OS & installed software
- (6.) Use a properly-configured firewall
- (7.) Make sure log files are populated & rotated
- (8.) Monitor logins & block suspect IP addresses

### Darwin
- EX.s: https://github.com/geerlingguy/mac-dev-playbook
- `defaults` command:
  - List all the domains available: `defaults domains > domainslist.txt`
  - List all its current key-value pairs: `defaults read com.apple.finder > finderdefaults.txt`
  - Write setting: `defaults write com.apple.finder AppleShowAllFiles true`
  - Delete setting: &mldr;
- ALTERNATIVELY: `prefs-editor` cask


### Misc. Ansible Commands
#### Dev
- Validate playbook: `ansible-playbook main.yml --syntax-check`
- Encrypt:
  - `ansible-vault encrypt <file>`   /   `ansible-vault decrypt <file>`
  - `ansible-vault encrypt_string <string>`

#### ( Ad-hoc commands )
- `ansible <group>  -m <module>`
  - `--key-file ~/.ssh/rpi`
  - `-i inventory`
  - `--list-hosts`
  - `--become --ask-become-pass`: Privilege escalation
  - Useful modules: `ping` (not ICMP ping !!), `gather_facts`
