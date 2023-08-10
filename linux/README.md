# Playbook for GNU/Linux (currently only Debian based) machines


## TODOs
### General
- **Change** all **networking** to *NetworkManager*  (packages: network-manager, nmcli)  using ***[netplan](https://netplan.io/)***




### *dev-workstation*
- initial setup: Muting audio doesn't work  (4 some reason ??!)
- not indempotent ISSUE:
   - Firefox settings after restart
   - TASK [petermosmans.customize-gnome : Download GNOME Shell extensions]
- Consider switching all apps to flatpak  (Brave, Codium, EVENTUALLY firefox, vlc & celluloid)

### *server*
- **SECURITY**: https://christitus.com/linux-security-mistakes/  (Fail2ban)

- **Switch to btrfs** (https://mutschler.dev/linux/raspi-btrfs/, btrfs maintenance: https://mutschler.dev/linux/raspi-post-install/,  https://raspberrypi.stackexchange.com/questions/8265/btrfs-root-filesystem-on-raspbian) + encrypted root fs
  - DEBIAN: Switch from swapfile to swap partition
    - Switch off the swapfile + remove dphys-swapfile: `sudo apt-get purge dphys-swapfile`
    - Activate the swap partition: `sudo swapon /dev/sdaX`
    - REMOVE sparse file + add subvolume QUOTA 4 samba share
- Support for **headless system** w/ **encrypted root partition**  (https://linuxconfig.org/how-to-unlock-a-luks-volume-on-boot-on-raspberry-pi-os, https://github.com/ViRb3/pi-encrypted-boot-ssh, https://docs.ansible.com/ansible/latest/collections/community/crypto/luks_device_module.html)
  - Change docker-containers (which rely on encrypted-data, e.g., traefik SSL certs) 2 **`unless_stopped`**

### *home_server*
- Check hosting DS-LITE (IPv6 only):
  ```
  -> fritzbox permit ports
  /usr/bin/nc -6 -l <port>      # on mac
  http://www.ipv6scanner.com/cgi-bin/main.py
  ```
- **Backup** via borg: https://github.com/borgbackup/borg/issues/4532, https://linuxtut.com/en/d34053037468488eacab/)

- Containers:
  - **NETWORKING**  (DEBUG DOCKER images: https://github.com/nicolaka/netshoot):
    - ISSUE: pihole -- **DESTINATION ipv6 addresses (of request) != SOURCE ipv6 address (of response)**
        ```
        > dig wikipedia.com @fd00::40b3:8c93:9122:52c7
        ;; reply from unexpected source: fd00::8656:3dd3:f10e:116d#53, expected fd00::40b3:8c93:9122:52c7#53
        ```
      - SOLUTION: iptables MASQUERADE picks random IPv6 address -- either allow only 1 address OR ~~use SNAT instead w/ to-addr~~ (doesn't work since public IP addr will be overwritten !!) ...

    - Convert *iptables* 2 *nftables*  (https://www.unixtutorial.org/migrate-iptables-to-nftables-in-centos-8/;           VALIDATION: `nft list ruleset`; SERVICE-NAME: nftables)

  - filebrowser: restart container iff config file has changed AND container is ALREADY RUNNING  ( see traefik, BUT ONLY IF CONFIG FILE HAS CHANGED )
  - pihole idempotent data dir

- FUTURE WORK:
  - **Switch Notifications to a service**  (e.g., by using https://github.com/caronc/apprise)
  - Services:
    - **https://academy.pointtosource.com/containers/ebooks-calibre-readarr/**
    - https://hub.docker.com/r/hurlenko/aria2-ariang
    - https://hub.docker.com/r/dyonr/jackettvpn/
    - Heimdall
    - Add traefik allowed ip range 4 vault (https://doc.traefik.io/traefik/middlewares/http/forwardauth/)
    - **SSO service** 4 which allows authenticating all services   (https://goauthentik.io/, https://github.com/authelia/authelia)
      - REQUIREMENT: [oauth2, etc. support (also for protected application necessary)](https://www.reddit.com/r/selfhosted/comments/s9ky8f/pass_credentials_from_authelia_to_protected/)
      - [Guide: 2 Factor Auth and Single Sign On with Authelia](https://piped.kavin.rocks/watch?v=u6H-Qwf4nZA)
    - ( Each container role should have role docker als dependency )
  - dyndns: Setup https://dynv6.com
---



## Setup steps
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

## RUN Playbook
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

### POST ansible run (i.e., not automated steps)
* *Home servers*:
  * traefik: SSL certs gen
  * transmission & samba: Directory structure (e.g., on (encrypted luks) sparse file)
* *workstations*:
  * Enable installed Gnome extensions (via 'Extensions app')  (!!  TODO: AUTOMATE  !!)
* *Dev workstations*:
  * Apps setup
    * *VSCod~~e~~ium*: Install extension 'Settings Sync' & follow instructions
    * *Firefox*:
      * Go to [about:profiles](about:profiles) and *Launch profile in new browser* for 'default'
      * Open [about:profiles](about:profiles) again in a new browser window & delete the other profile, including data
      * Allow extensions
      * Right click on Bookmarks bar &rarr; *Manage bookmarks* &rarr; *Import and Backup* &rarr; *Restore* &rarr; *Choose File* &rarr; Select the hidden firefox default bookmarks file
      * Cleanup &mldr;



## Misc. commands
### Dev
* Validate playbook: `ansible-playbook main.yml --syntax-check`
* Encrypt:
  * `ansible-vault encrypt <file>`   /   `ansible-vault decrypt <file>`
  * `ansible-vault encrypt_string <string>`

### ( Ad-hoc commands )
* `ansible <group>  -m <module>`
  * `--key-file ~/.ssh/rpi`
  * `-i inventory`
  * `--list-hosts`
  * `--become --ask-become-pass`: Privilege escalation
  * Useful modules: `ping` (not ICMP ping !!), `gather_facts`
