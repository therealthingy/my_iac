# Playbook for GNU/Linux machines

## Commands
* Initial setup   (see also: https://stackoverflow.com/questions/34333058/ansible-change-ssh-port-in-playbook):
  1. Generate ssh key using custom script `ssh-key_generate` (add it automatically to `.ssh/config`)
  2. Make sure port is 22 in config file
  3. LATER: Change it to 2233 in config file
* Exec 4 specific client: `ansible-playbook --ask-become-pass run.yml`
  * Flags:
    * `--limit "host1,host2,host3,host4"`: Only specified hosts
    * `-i "xxx.xxx.xxx.xxx,"`: Inventory
    * `-e "user_name=user"`: Overwrite vars
    * `--tags "base,"`: Target only tagged tasks
