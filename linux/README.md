# Playbook for GNU/Linux machines


## TODOs
- GENERAL:
  - new role:
    #- name: Install media tools
    #  ansible.builtin.apt:
    #    name:
    #      - celluloid
    #      - vlc
    #    state: present
    # TODO: yt-dlp + shell aliases

- *dev-workstation*:
  - Firefox setup:
    - https://galaxy.ansible.com/staticdev/firefox / https://github.com/staticdev/ansible-role-firefox
    - https://github.com/pyllyukko/user.js/blob/master/user.js
  - dconf issues: Firefox dock app icon
  - Debian: always show dock  (like Ubuntu --> dash-to-dock)
  - Consider switching all apps to flatpak (Brave, Codium & EVENTUALLY firefox)

- *home_server*:
	- **SECURITY: https://christitus.com/linux-security-mistakes/**
  - Containers:
    - Add traefik allowed ip range 4 vault (https://doc.traefik.io/traefik/middlewares/http/forwardauth/)
    - ( Each container role should have role docker als dependency )
    - traefik + filebrowser  restart container if config file has changed  ( https://raymii.org/s/tutorials/Ansible_-_Only-do-something-if-another-action-changed.html )
    - pihole idempotent data dir
  - Fix issue: **2 ipv6 addresses**
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
         time="2022-08-14T01:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:54125->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T01:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T02:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T02:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:54412->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T02:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T02:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:35685->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T02:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T02:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:42936->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T02:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T02:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:44965->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T02:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T02:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:57582->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T02:05:46+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T03:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T03:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:49784->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T03:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T03:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:58244->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T03:05:03+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T03:05:03+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:56734->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T03:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T03:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:42938->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T03:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T03:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:59551->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T03:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T04:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T04:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:41188->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T04:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T04:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:55173->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T04:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T04:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:40236->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T04:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T04:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:49085->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T04:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T04:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:46541->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T04:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T05:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T05:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:53372->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T05:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T05:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:58603->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T05:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T05:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:49094->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T05:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T05:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:37932->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T05:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T05:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:47990->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T05:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T06:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T06:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:46282->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T06:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T06:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:43206->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T06:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T06:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:55194->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T06:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T06:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:54920->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T06:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T06:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:54390->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T06:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T07:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T07:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:50312->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T07:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T07:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:45913->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T07:05:03+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T07:05:03+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:57315->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T07:05:25+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T07:05:25+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:35542->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T07:05:46+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T07:05:46+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:52299->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T07:05:49+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T08:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T08:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:34510->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T08:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T08:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:59375->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T08:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T08:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:51846->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T08:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T08:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:53649->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T08:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T08:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:56859->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T08:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T09:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T09:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:60539->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T09:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T09:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:48024->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T09:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T09:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:50978->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T09:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T09:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:60137->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T09:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T09:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:50544->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T09:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T10:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T10:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:36285->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T10:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T10:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:45030->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T10:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T10:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:49851->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T10:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T10:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:39761->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T10:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T10:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:41825->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T10:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T11:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T11:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:40398->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T11:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T11:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:48585->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T11:05:03+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T11:05:03+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:42547->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T11:05:25+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T11:05:25+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:46271->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T11:05:47+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T11:05:47+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:35825->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T11:05:48+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T12:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T12:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:38213->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T12:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T12:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:53600->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T12:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T12:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:58006->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T12:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T12:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:50679->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T12:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T12:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:54936->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T12:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T13:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T13:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:36758->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T13:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T13:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:33274->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T13:05:03+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T13:05:03+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:33812->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T13:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T13:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:50517->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T13:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T13:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:51003->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T13:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T14:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T14:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:46028->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T14:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T14:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:35146->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T14:05:03+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T14:05:03+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:55225->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T14:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T14:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:39725->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T14:05:46+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T14:05:46+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:38544->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T14:05:48+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T15:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T15:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:39173->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T15:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T15:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:47648->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T15:05:03+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T15:05:03+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:49835->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T15:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T15:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:34405->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T15:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T15:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:57504->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T15:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T16:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T16:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:54044->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T16:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T16:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:38583->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T16:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T16:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:37986->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T16:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T16:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:47706->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T16:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T16:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:36786->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T16:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T17:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T17:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:34513->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T17:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T17:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:45549->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T17:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T17:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:40572->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T17:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T17:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:43132->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T17:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T17:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:44261->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T17:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T18:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T18:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:42004->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T18:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T18:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:49734->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T18:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T18:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:53283->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T18:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T18:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:36152->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T18:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T18:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:53723->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T18:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T19:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T19:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:54016->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T19:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T19:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:52766->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T19:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T19:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:44418->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T19:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T19:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:37195->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T19:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T19:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:34066->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T19:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T20:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T20:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:42969->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T20:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T20:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:43632->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T20:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T20:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:37613->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T20:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T20:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:53173->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T20:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T20:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:55666->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T20:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T21:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T21:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:46160->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T21:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T21:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:46331->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T21:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T21:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:33731->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T21:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T21:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:59350->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T21:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T21:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:49655->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T21:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T22:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T22:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:60950->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T22:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T22:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:58221->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T22:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T22:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:45119->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T22:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T22:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:54425->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T22:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T22:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:44973->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T22:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         time="2022-08-14T23:04:20+02:00" level=warning msg="Could not do a head request for \"traefik:latest\", falling back to regular pull." container=/traefik image="traefik:latest"
         time="2022-08-14T23:04:20+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:43678->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/traefik image="traefik:latest"
         time="2022-08-14T23:04:41+02:00" level=warning msg="Could not do a head request for \"vaultwarden/server:latest\", falling back to regular pull." container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T23:04:41+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:48676->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/bitwarden image="vaultwarden/server:latest"
         time="2022-08-14T23:05:02+02:00" level=warning msg="Could not do a head request for \"dperson/samba:latest\", falling back to regular pull." container=/samba image="dperson/samba:latest"
         time="2022-08-14T23:05:02+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:50388->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/samba image="dperson/samba:latest"
         time="2022-08-14T23:05:24+02:00" level=warning msg="Could not do a head request for \"haugene/transmission-openvpn:latest\", falling back to regular pull." container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T23:05:24+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:33155->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/transmission image="haugene/transmission-openvpn:latest"
         time="2022-08-14T23:05:45+02:00" level=warning msg="Could not do a head request for \"portainer/portainer-ce:latest\", falling back to regular pull." container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T23:05:45+02:00" level=warning msg="Reason: Get \"https://index.docker.io/v2/\": dial tcp: lookup index.docker.io on [fd00::40b3:8c93:9122:52c7]:53: read udp [2001:db8:1::4]:50832->[fd00::40b3:8c93:9122:52c7]:53: i/o timeout" container=/portainer image="portainer/portainer-ce:latest"
         time="2022-08-14T23:05:47+02:00" level=info msg="Session done" Failed=0 Scanned=5 Updated=0 notify=no
         ```
      - by either configuring statically + disabling dhcpd (denyinterfaces; https://forums.raspberrypi.com/viewtopic.php?t=178387)
      - iptables ??
  -FUTURE WORK:
    - SSO service 4 which allows authenticating all services
    - dyndns:
      - CURRENTLY: https://dynv6.com/  /  http://garygee.dynv6.net/
      - Disable privacy extensions (i.e., derive global ipv6 address for eth0 iface from mac address, thus making sure fritzbox ipv6 permitted access works  (see also https://www.heise.de/ct/artikel/IPv6-DynDNS-klemmt-4785681.html))


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
