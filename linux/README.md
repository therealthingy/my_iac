# Playbook for GNU/Linux (currently only Debian-based) machines


## TODOs
- *dev-workstation*:
  - ISSUE: Firefox: After restart  --> not indempotent  ???
  - Consider switching all apps to flatpak  (Brave, Codium, EVENTUALLY firefox, vlc & celluloid)

- *server*:
	- **SECURITY**: https://christitus.com/linux-security-mistakes/  (Fail2ban)

  - **Switch to btrfs** (https://mutschler.dev/linux/raspi-btrfs/, btrfs maintenance: https://mutschler.dev/linux/raspi-post-install/,  https://raspberrypi.stackexchange.com/questions/8265/btrfs-root-filesystem-on-raspbian) + encrypted root fs
    - DEBIAN: Switch from swapfile to swap partition
      - Switch off the swapfile + remove dphys-swapfile: `sudo apt-get purge dphys-swapfile`
      - Activate the swap partition: `sudo swapon /dev/sdaX`
      - REMOVE sparse file + add subvolume QUOTA 4 samba share
    - Support for **headless system** w/ **encrypted root partition**  (https://linuxconfig.org/how-to-unlock-a-luks-volume-on-boot-on-raspberry-pi-os, https://github.com/ViRb3/pi-encrypted-boot-ssh, https://docs.ansible.com/ansible/latest/collections/community/crypto/luks_device_module.html)
      - REVISE reboot policy for unattended upgrades: SHOULD BE EMail  (see down below)

- *home_server*:
  - **Backup** via borg: https://github.com/borgbackup/borg/issues/4532, https://linuxtut.com/en/d34053037468488eacab/)

  - Containers:
    - **NETWORKING**:
      - Convert iptables 2 nftables
      - ISSUE: **Request ipv6 addresses != Response ipv6 address**
        - DEBUG DOCKER images: https://github.com/nicolaka/netshoot
        - SOLUTION:
          - by either configuring statically + disabling dhcpd (denyinterfaces; https://forums.raspberrypi.com/viewtopic.php?t=178387;  https://libredd.it/r/ipv6/comments/uvjbif/setting_a_ula_it_just_worked/)
          - iptables ??
        - ISSUEs:
          - pihole IPv6:
            ```
            > dig google.com @fd00::40b3:8c93:9122:52c7
            ;; reply from unexpected source: fd00::8656:3dd3:f10e:116d#53, expected fd00::40b3:8c93:9122:52c7#53
            ```
          - watchtower:
            ```
            time="2022-08-14T00:04:37+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:41024->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
            time="2022-08-14T00:04:59+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
            time="2022-08-14T00:04:59+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:35606->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
            time="2022-08-14T00:05:20+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
            time="2022-08-14T00:05:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:44754->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
            time="2022-08-14T00:05:31+02:00" level=info msg="Unable to update container \"/portainer\": Error response from daemon: Head \"https://registry-1.docker.io/v2/portainer/portainer-ce/manifests/latest\": Get \"https://auth.docker.io/token?scope=repository%3Aportainer%2Fportainer-ce%3Apull&service=registry.docker.io\": net/http: TLS handshake timeout. Proceeding to next."
            time="2022-08-14T00:05:51+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
            time="2022-08-14T00:05:51+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:52343->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
            time="2022-08-14T00:06:15+02:00" level=info msg="Found new traefik:latest image (6964360aa1fa)"
            time="2022-08-14T00:06:15+02:00" level=info msg="Stopping /traefik (c9eed1be4b9d) with SIGTERM"
            time="2022-08-14T00:06:16+02:00" level=info msg="Creating /traefik"
            time="2022-08-14T00:06:17+02:00" level=info msg="Removing image 25c1b8b23cab"
            time="2022-08-14T00:06:17+02:00" level=info msg="Session done" Failed=0 Scanned=4 Updated=1 notify=no
            time="2022-08-14T01:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
            time="2022-08-14T01:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:47977->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
            time="2022-08-14T01:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
            time="2022-08-14T01:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:55385->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
            time="2022-08-14T01:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
            time="2022-08-14T01:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:46462->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
            time="2022-08-14T01:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
            time="2022-08-14T01:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:42593->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
            time="2022-08-14T01:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
            ```
    - traefik + filebrowser  restart container if config file has changed  ( https://raymii.org/s/tutorials/Ansible_-_Only-do-something-if-another-action-changed.html )
    - pihole idempotent data dir
  - FUTURE WORK:
    - **EMail** AGENT  (which supports SMTP)  (use [sendinblue](https://developers.sendinblue.com/docs/send-a-transactional-email) OR [sendgrid](https://sendgrid.com/pricing/))
    - containers:
      - https://hub.docker.com/r/hurlenko/aria2-ariang
      - https://hub.docker.com/r/dyonr/jackettvpn/
      - Heimdall
      - Add traefik allowed ip range 4 vault (https://doc.traefik.io/traefik/middlewares/http/forwardauth/)
      - **SSO service** 4 which allows authenticating all services   (https://goauthentik.io/, https://github.com/authelia/authelia)
        - REQUIREMENT: [oauth2, etc. support (also for protected application necessary)](https://www.reddit.com/r/selfhosted/comments/s9ky8f/pass_credentials_from_authelia_to_protected/)
        - [Guide: 2 Factor Auth and Single Sign On with Authelia](https://piped.kavin.rocks/watch?v=u6H-Qwf4nZA)
      - ( Each container role should have role docker als dependency )
    - dyndns:
      - Setup https://dynv6.com
      - Disable privacy extensions (i.e., derive global ipv6 address for eth0 iface from mac address, thus making sure fritzbox ipv6 permitted access works  (see also https://www.heise.de/ct/artikel/IPv6-DynDNS-klemmt-4785681.html))



## Setup steps
* Install "dependencies" for playbook: **`ansible-galaxy install -r requirements.yml`**
* OPTIONAL: Add own new sytem in local inventory:
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
* Exec 4 specific client: **`ansible-playbook --vault-pass-file ~/.ansible-vault run.yml`**
  * Flags:
    * `--ask-vault-pass`  (when not using `--vault-pass-file <file>`)
    * **`--ask-become-pass`**  (may be required for 1st ansible run (if not set as host var '`ansible_sudo_pass`' in inventory), but not afterwards (due to passwordless sudo))
    * **`--tags "<tag>,"`: Target only tagged tasks**
    * **`--limit "host1,host2,host3,host4"`: Only specified hosts**
    * **`-i "xxx.xxx.xxx.xxx,"`: Inventory (list ips/hostnames OR file)**
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
* Validate playbook: `ansible-playbook run.yml --syntax-check`
* Encrypt:
  * `ansible-vault encrypt <file>`   /   `ansible-vault decrypt <file>`
  * `ansible-vault encrypt_string "<string>"`

### ( Ad-hoc commands )
* `ansible <group>  -m <module>`
  * `--key-file ~/.ssh/rpi`
  * `-i inventory`
  * `--list-hosts`
  * `--become --ask-become-pass`: Privelege escalation
  * Useful modules: `ping` (not ICMP ping !!), `gather_facts`
