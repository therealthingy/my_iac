# Playbook for GNU/Linux machines


## TODOs
- pihole non root user
- tranmsission container
- bring back samba
- package `pxz` & `nala`
- restart container after changing docker-compose file
- Revise task dependency workaround (which sets the user vars)
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
* Exec 4 specific client: **`ansible-playbook --ask-become-pass --ask-vault-pass run.yml`**
  * Flags:
    * **`-e "<key>=<value>"`: Overwrite vars**
    * `--tags "<tag>,"`: Target only tagged tasks
    * `--limit "host1,host2,host3,host4"`: Only specified hosts
    * `-i "xxx.xxx.xxx.xxx,"`: Inventory

### Dev
* Validate playbook: `ansible-playbook run.yml --syntax-check`

### ( Ad-hoc commands )
* `ansible <group>  -m <module>`
  * `--key-file ~/.ssh/rpi`
  * `-i inventory`
  * `--list-hosts`
  * `--become --ask-become-pass`: Privelege escalation
  * Useful modules: `ping` (not ICMP ping !!), `gather_facts`
