# Playbook for GNU/Linux machines

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
