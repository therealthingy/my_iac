# Playbook for GNU/Linux (currently only Debian-based) machines


## TODOs
- *dev-workstation*:
  - Firefox: After restart  --> not indempotent  ???
  - Consider switching all apps to flatpak  (Brave, Codium, EVENTUALLY firefox, vlc & celluloid)

- *server*:
  - Support for headless system w/ encrypted root partition (https://github.com/ViRb3/pi-encrypted-boot-ssh)

- *home_server*:
  - Containers:
    - ISSUE: **2 ipv6 addresses**
      - SOLUTION:
        - by either configuring statically + disabling dhcpd (denyinterfaces; https://forums.raspberrypi.com/viewtopic.php?t=178387)
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
	- **SECURITY: https://christitus.com/linux-security-mistakes/**
  - FUTURE WORK:
    - **EMail** notifications  (use [sendinblue](https://developers.sendinblue.com/docs/send-a-transactional-email) OR [sendgrid](https://sendgrid.com/pricing/); transmission: check whether execution flag is required for `postprocess.sh`)
    - **Backup** via Borgbackup
    - containers:
      - Heimdall
      - Add traefik allowed ip range 4 vault (https://doc.traefik.io/traefik/middlewares/http/forwardauth/)
      - **SSO service** 4 which allows authenticating all services   (https://goauthentik.io/, https://github.com/authelia/authelia)
        - REQUIREMENT: [oauth2, etc. support (also for protected application necessary)](https://www.reddit.com/r/selfhosted/comments/s9ky8f/pass_credentials_from_authelia_to_protected/)
        - [Guide: 2 Factor Auth and Single Sign On with Authelia](https://piped.kavin.rocks/watch?v=u6H-Qwf4nZA)
      - ( Each container role should have role docker als dependency )
    - dyndns:
      - Setup https://dynv6.com
      - Disable privacy extensions (i.e., derive global ipv6 address for eth0 iface from mac address, thus making sure fritzbox ipv6 permitted access works  (see also https://www.heise.de/ct/artikel/IPv6-DynDNS-klemmt-4785681.html))


## Not automated steps
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


## Commands
### Setup steps
* Install "dependencies" for playbook: `ansible-galaxy install -r requirements.yml`
* Initial setup   (see also: https://stackoverflow.com/questions/34333058/ansible-change-ssh-port-in-playbook):
  * ( (0.) Ubuntu: Install *ssh daemon*: **`sudo apt install -y ssh`**  //  Debian: `su` &rarr; `/sbin/usermod -aG sudo <username>` )
  * (1.) Generate ssh key using custom script `ssh-key_generate` (add it automatically to `.ssh/config`)
  * (2.) Add `HostNamne <hostname>`
  * (3.) **`ssh-copy-id -i ~/.ssh/<identity-file>.pub <user>@<ip>`**
  * (4.) LATER (after initial ansible run): Add `Port 2233`
* Exec 4 specific client: **`ansible-playbook --ask-vault-pass run.yml`**
  * Flags:
    * **`--ask-become-pass`**  (required for first setup, not required afterwards due to passwordless sudo)
    * `--tags "<tag>,"`: Target only tagged tasks
    * `-e "<key>=<value>"`: Overwrite vars
    * `--limit "host1,host2,host3,host4"`: Only specified hosts
    * `-i "xxx.xxx.xxx.xxx,"`: Inventory

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
