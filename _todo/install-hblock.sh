#!/usr/bin/env bash

# --- Variables
CUSTOM_HOSTS_RULES_FOLDER='/etc/hblock.d'
CUSTOM_HOSTS_RULES_FILE='header'

HBLOCK_FLAGS="-H ${CUSTOM_HOSTS_RULES_FOLDER}/${CUSTOM_HOSTS_RULES_FILE} -q"

CRON_TIME='0 18 */2 * *'                    # Every 2nd day of week at 18 'o clock




# - Confirm installation
echo "This script will install hblock via Homebrew and set it up to automatically update the hosts-file via a cron-job."

read -p "Continue installing at your own risk. [yes/no] "
if [ "$REPLY" != "yes" ]; then
   exit 0
fi



# - Install hblock
command -v brew >/dev/null 2>&1 || { echo "Do you have Homebrew installed? Aborting..." >&2; exit 1; }
brew install hblock
command -v hblock >/dev/null 2>&1 || { echo "Couldn't install hblock. Aborting..." >&2; exit 1; }

echo "> Installed hbock."



# - Copy original hosts-file (only if not installed yet)
if [ ! -f "${CUSTOM_HOSTS_RULES_FOLDER}/${CUSTOM_HOSTS_RULES_FILE}" ]; then
    sudo mkdir -p ${CUSTOM_HOSTS_RULES_FOLDER} && sudo cp /etc/hosts ${CUSTOM_HOSTS_RULES_FOLDER}
fi



# - Setup CRON-job
HBLOCK_COMMAND="$(command -v hblock) ${HBLOCK_FLAGS}"
sudo crontab -l -u root | awk '!/hblock/' | { cat; echo "${CRON_TIME}  ${HBLOCK_COMMAND}"; } | sudo crontab -u root -

echo "> Setup cron-job."



# - Execute commmand
printf "\n\n> Executing hblock for the first time...\n Note: Custom rules can be added in the file ${CUSTOM_HOSTS_RULES_FOLDER}/${CUSTOM_HOSTS_RULES_FILE}, which will be considered in the next update.\n\n\n"
eval $HBLOCK_COMMAND

exit 0
