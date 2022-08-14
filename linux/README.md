# Playbook for GNU/Linux machines

## TODOs
- GENERAL:
  - additional role:
    #- name: Install media tools
    #  ansible.builtin.apt:
    #    name:
    #      - celluloid
    #      - vlc
    #    state: present
    # TODO: yt-dl
- *dev-workstation*:
  - Firefox
    - https://galaxy.ansible.com/staticdev/firefox / https://github.com/staticdev/ansible-role-firefox
    - https://github.com/pyllyukko/user.js/blob/master/user.js
  - Eliminate snap for IDEs
  - Gnome Terminal issue w/ oh-my-zsh & p10k theme  +  Firefox dock app icon
- *home_server*:
  - Each container role should have role docker als dependency
  - traefik + filebrowser  restart container if config file has changed  ( https://raymii.org/s/tutorials/Ansible_-_Only-do-something-if-another-action-changed.html )
  - pihole FIXES:
     - idempotent data dir
     - Fix issue
       > dig google.com @fd00::40b3:8c93:9122:52c7
       ;; reply from unexpected source: fd00::8656:3dd3:f10e:116d#53, expected fd00::40b3:8c93:9122:52c7#53
      - by either configuring statically + disabling dhcpd (denyinterfaces; https://forums.raspberrypi.com/viewtopic.php?t=178387)
      - iptables ??
- *rpi*:
  - package `nala`
  - ( FUTURE WORK 4 dyndns: Disable privacy extensions (i.e., derive global ipv6 address for eth0 iface from mac address, thus making sure fritzbox ipv6 permitted access works  (see also https://www.heise.de/ct/artikel/IPv6-DynDNS-klemmt-4785681.html)) )


## Prereq.
```bash
ansible-galaxy collection install community.docker
```


## Not automated steps
* *Home servers*:
  * traefik: SSL certs gen
  * transmission & samba: Directory structure (e.g., on (encrypted luks) sparse file)
* *Dev workstations*:
  * Apps setup
    * VSCod~~e~~ium: Install extension 'Settings Sync' & follow instructions


## Commands
### Setup steps
* Initial setup   (see also: https://stackoverflow.com/questions/34333058/ansible-change-ssh-port-in-playbook):
  * ( (0.) Install ssh daemon, e.g., for Ubuntu: **`sudo apt install -y ssh`** )
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
