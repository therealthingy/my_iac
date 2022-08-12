# Playbook for GNU/Linux machines


## TODOs
- FIX: firefox initial installation
  ```
  fatal: [ansible_test]: FAILED! => {"changed": false, "msg": "'/usr/bin/apt-get dist-upgrade --auto-remove' failed: E: Packages were downgraded and -y was used without --allow-downgrades.\n", "rc": 100, "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nCalculating upgrade...\nThe following packages will be REMOVED:\n  guile-2.2-libs libgnome-games-support-1-3 libgnome-games-support-common\n  libqqwing2v5\nThe following NEW packages will be installed:\n  xul-ext-ubufox\nThe following packages have been kept back:\n  gir1.2-gtk-4.0 libcryptsetup12 libgtk-4-1 libgtk-4-bin libgtk-4-common\n  python3-software-properties software-properties-common\n  software-properties-gtk\nThe following packages will be upgraded:\n  thunderbird thunderbird-gnome-support thunderbird-locale-en\n  thunderbird-locale-en-us\nThe following packages will be DOWNGRADED:\n  firefox\n4 upgraded, 1 newly installed, 1 downgraded, 4 to remove and 8 not upgraded.\n", "stdout_lines": ["Reading package lists...", "Building dependency tree...", "Reading state information...", "Calculating upgrade...", "The following packages will be REMOVED:", "  guile-2.2-libs libgnome-games-support-1-3 libgnome-games-support-common", "  libqqwing2v5", "The following NEW packages will be installed:", "  xul-ext-ubufox", "The following packages have been kept back:", "  gir1.2-gtk-4.0 libcryptsetup12 libgtk-4-1 libgtk-4-bin libgtk-4-common", "  python3-software-properties software-properties-common", "  software-properties-gtk", "The following packages will be upgraded:", "  thunderbird thunderbird-gnome-support thunderbird-locale-en", "  thunderbird-locale-en-us", "The following packages will be DOWNGRADED:", "  firefox", "4 upgraded, 1 newly installed, 1 downgraded, 4 to remove and 8 not upgraded."]}
  ```

- Each container role should have role docker als dependency

- pihole FIXES:
   - idempotent data dir
   - Fix issue
     > dig google.com @fd00::40b3:8c93:9122:52c7
     ;; reply from unexpected source: fd00::8656:3dd3:f10e:116d#53, expected fd00::40b3:8c93:9122:52c7#53
    - by either configuring statically + disabling dhcpd (denyinterfaces; https://forums.raspberrypi.com/viewtopic.php?t=178387)
    - iptables ??

- traefik + filebrowser  restart container if config file has changed  ( https://raymii.org/s/tutorials/Ansible_-_Only-do-something-if-another-action-changed.html )


- packages `pxz` & `nala`
- ( FUTURE WORK 4 dyndns: Disable privacy extensions (i.e., derive global ipv6 address for eth0 iface from mac address, thus making sure fritzbox ipv6 permitted access works  (see also https://www.heise.de/ct/artikel/IPv6-DynDNS-klemmt-4785681.html)) )



## Prereq.
```bash
ansible-galaxy collection install community.docker
```

## Commands
### Playbook
* Initial setup   (see also: https://stackoverflow.com/questions/34333058/ansible-change-ssh-port-in-playbook):
  * ( (0.) Install ssh daemon, e.g., for Ubuntu: **`sudo apt install ssh`** )
  * (1.) Generate ssh key using custom script `ssh-key_generate` (add it automatically to `.ssh/config`)
  * (2.) Add `HostNamne <hostname>`
  * (3.) **`ssh-copy-id -i ~/.ssh/<identity-file>.pub <user>@<ip>`**
  * (4.) LATER (after initial ansible run): Add `Port 2233`
* Exec 4 specific client: **`ansible-playbook --ask-vault-pass run.yml`**
  * Flags:
    * **`-e "<key>=<value>"`: Overwrite vars**
    * **`--ask-become-pass`**  (required for first setup, not required afterwards due to passwordless sudo)
    * `--tags "<tag>,"`: Target only tagged tasks
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
