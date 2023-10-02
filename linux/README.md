# Playbook for GNU/Linux (currently only Debian based) machines



## GUIDELINEs
* SECURE SERVER:
  * (1.) Use secure & encrypted communication
  * (2.) Disable root login & use `sudo`
  * (3.) Remove unused software, open only required ports
  * (4.) Use the principle of least privilege
  * (5.) Update the OS & installed software
  * (6.) Use a properly-configured firewall
  * (7.) Make sure log files are populated & rotated
  * (8.) Monitor logins & block suspect IP addresses




## TODOs
### General
- Fix tags  (e.g., `ansible-playbook --tags=containers, --vault-pass-file ~/.ansible-vault --ask-become-pass  main.yml`)

- **Merge mac- & linux** playbooks

### *dev-workstation*
* initial setup: Muting audio doesn't work  (4 some reason ??!)
* not indempotent ISSUE:
   * Firefox settings after restart
   * TASK [petermosmans.customize-gnome : Download GNOME Shell extensions]
* Consider switching all apps to flatpak  (EVENTUALLY firefox, vscodium)

### *server*
* ON ALL DISTROS: USE **netplan + systemd-networkd**

* **SECURITY**: https://christitus.com/linux-security-mistakes/  (Fail2ban)
* !!!!!!!!!!!!!!!!!!!     Add restricted www user     !!!!!!!!!!!!!!!!!!!

### *home_server*
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
