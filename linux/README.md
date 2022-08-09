# Playbook for GNU/Linux machines


## TODOs
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
  * ( (0.) Install ssh daemon, e.g., for Ubuntu: `sudo apt install ssh` )
  * (1.) Generate ssh key using custom script `ssh-key_generate` (add it automatically to `.ssh/config`)
  * (2.) Add `HostNamne <hostname>`
  * (3.) `ssh-copy-id -i ~/.ssh/<identity-file>.pub <user>@<ip>`
  * (4.) LATER (after initial ansible run): Add `Port 2233`
* Exec 4 specific client: **`ansible-playbook --ask-vault-pass run.yml`**
  * Flags:
    * **`-e "<key>=<value>"`: Overwrite vars**
    * `--ask-become-pass`  (not required due to passwordless sudo)
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
