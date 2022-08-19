# Playbook for GNU/Linu (Debian) machines


## TODOs
- *dev-workstation*:
  - Firefox: After restart  --> not indempotent  ???
    ```
    ok: [ansible-test] => (item={'key': 'browser.toolbars.bookmarks.visibility', 'value': 'always'})
    changed: [ansible-test] => (item={'key': 'browser.startup.page', 'value': 1})
    ok: [ansible-test] => (item={'key': 'browser.startup.homepage', 'value': 'https://ipleak.net/'})
    changed: [ansible-test] => (item={'key': 'browser.newtabpage.enabled', 'value': True})
    ok: [ansible-test] => (item={'key': 'browser.newtab.preload', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.newtabpage.activity-stream.feeds.telemetry', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.newtabpage.activity-stream.telemetry', 'value': False})
    changed: [ansible-test] => (item={'key': 'browser.newtabpage.activity-stream.feeds.snippets', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.newtabpage.activity-stream.feeds.section.topstories', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.newtabpage.activity-stream.section.highlights.includePocket', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.newtabpage.activity-stream.showSponsored', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.newtabpage.activity-stream.feeds.discoverystreamfeed', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.newtabpage.activity-stream.showSponsoredTopSites', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.newtabpage.activity-stream.default.sites', 'value': ''})
    ok: [ansible-test] => (item={'key': 'browser.newtabpage.activity-stream.feeds.section.topstories.options', 'value': ''})
    ok: [ansible-test] => (item={'key': 'dom.gamepad.enabled', 'value': False})
    changed: [ansible-test] => (item={'key': 'dom.vr.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'dom.vibrator.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'extensions.pocket.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'extensions.pocket.api', 'value': ''})
    ok: [ansible-test] => (item={'key': 'extensions.pocket.oAuthConsumerKey', 'value': ''})
    ok: [ansible-test] => (item={'key': 'extensions.pocket.site', 'value': "''"})
    ok: [ansible-test] => (item={'key': 'geo.provider.network.url', 'value': 'https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%'})
    ok: [ansible-test] => (item={'key': 'geo.provider.ms-windows-location', 'value': False})
    ok: [ansible-test] => (item={'key': 'geo.provider.use_corelocation', 'value': False})
    ok: [ansible-test] => (item={'key': 'geo.provider.use_gpsd', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.region.network.url', 'value': ''})
    ok: [ansible-test] => (item={'key': 'browser.region.update.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'intl.accept_languages', 'value': 'en-US, en'})
    ok: [ansible-test] => (item={'key': 'javascript.use_us_english_locale', 'value': True})
    ok: [ansible-test] => (item={'key': 'extensions.getAddons.showPane', 'value': False})
    ok: [ansible-test] => (item={'key': 'extensions.htmlaboutaddons.recommendations.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'datareporting.policy.dataSubmissionEnabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'datareporting.healthreport.uploadEnabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'toolkit.telemetry.unified', 'value': False})
    changed: [ansible-test] => (item={'key': 'toolkit.telemetry.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'toolkit.telemetry.server', 'value': 'data:,'})
    ok: [ansible-test] => (item={'key': 'toolkit.telemetry.archive.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'toolkit.telemetry.newProfilePing.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'toolkit.telemetry.shutdownPingSender.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'toolkit.telemetry.updatePing.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'toolkit.telemetry.bhrPing.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'toolkit.telemetry.firstShutdownPing.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'toolkit.telemetry.coverage.opt-out', 'value': True})
    ok: [ansible-test] => (item={'key': 'toolkit.coverage.opt-out', 'value': True})
    ok: [ansible-test] => (item={'key': 'toolkit.coverage.endpoint.base', 'value': ''})
    ok: [ansible-test] => (item={'key': 'browser.ping-centre.telemetry', 'value': False})
    ok: [ansible-test] => (item={'key': 'app.shield.optoutstudies.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'app.normandy.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'app.normandy.api_url', 'value': ''})
    ok: [ansible-test] => (item={'key': 'breakpad.reportURL', 'value': ''})
    ok: [ansible-test] => (item={'key': 'browser.tabs.crashReporting.sendReport', 'value': False})
    changed: [ansible-test] => (item={'key': 'browser.crashReports.unsubmittedCheck.autoSubmit2', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.safebrowsing.downloads.remote.enabled', 'value': False})
    changed: [ansible-test] => (item={'key': 'browser.fixup.alternate.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.search.suggest.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.urlbar.suggest.searches', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.urlbar.speculativeConnect.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.urlbar.suggest.quicksuggest.nonsponsored', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.urlbar.suggest.quicksuggest.sponsored', 'value': False})
    ok: [ansible-test] => (item={'key': 'browser.formfill.enable', 'value': False})
    ok: [ansible-test] => (item={'key': 'extensions.formautofill.addresses.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'extensions.formautofill.available', 'value': 'off'})
    ok: [ansible-test] => (item={'key': 'extensions.formautofill.creditCards.available', 'value': False})
    ok: [ansible-test] => (item={'key': 'extensions.formautofill.creditCards.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'extensions.formautofill.heuristics.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'signon.rememberSignons', 'value': False})
    ok: [ansible-test] => (item={'key': 'signon.autofillForms', 'value': False})
    ok: [ansible-test] => (item={'key': 'beacon.enabled', 'value': False})
    ok: [ansible-test] => (item={'key': 'privacy.sanitize.sanitizeOnShutdown', 'value': True})
    changed: [ansible-test] => (item={'key': 'privacy.clearOnShutdown.cache', 'value': True})
    changed: [ansible-test] => (item={'key': 'privacy.clearOnShutdown.downloads', 'value': True})
    changed: [ansible-test] => (item={'key': 'privacy.clearOnShutdown.formdata', 'value': True})
    changed: [ansible-test] => (item={'key': 'privacy.clearOnShutdown.history', 'value': True})
    changed: [ansible-test] => (item={'key': 'privacy.clearOnShutdown.sessions', 'value': True})
    changed: [ansible-test] => (item={'key': 'privacy.clearOnShutdown.offlineApps', 'value': False})
    ok: [ansible-test] => (item={'key': 'privacy.resistFingerprinting', 'value': True})
    ```


  - (  Debian: Use Ubuntu dock  (dash-to-dock)  )
  - Consider switching all apps to flatpak  (Brave, Codium, EVENTUALLY firefox, vlc & celluloid)

- *home_server*:
  - Containers:
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
          ```
    - traefik + filebrowser  restart container if config file has changed  ( https://raymii.org/s/tutorials/Ansible_-_Only-do-something-if-another-action-changed.html )
    - pihole idempotent data dir
      - by either configuring statically + disabling dhcpd (denyinterfaces; https://forums.raspberrypi.com/viewtopic.php?t=178387)
      - iptables ??
	- **SECURITY: https://christitus.com/linux-security-mistakes/**
  -FUTURE WORK:
    - **EMail** notifications  (transmission: check whether execution flag is required for `postprocess.sh`)
    - **Backup** via Borgbackup
    - containers:
      - Heimdall
      - Add traefik allowed ip range 4 vault (https://doc.traefik.io/traefik/middlewares/http/forwardauth/)
      - **SSO service** 4 which allows authenticating all services   (https://goauthentik.io/, https://github.com/authelia/authelia)
        - REQUIREMENT: [oauth2, etc. support (also for protected application necessary)](https://www.reddit.com/r/selfhosted/comments/s9ky8f/pass_credentials_from_authelia_to_protected/)
        - [Guide: 2 Factor Auth and Single Sign On with Authelia](https://piped.kavin.rocks/watch?v=u6H-Qwf4nZA)
      - ( Each container role should have role docker als dependency )
    - dyndns:
      - CURRENTLY: https://dynv6.com/  /  http://garygee.dynv6.net/
      - Disable privacy extensions (i.e., derive global ipv6 address for eth0 iface from mac address, thus making sure fritzbox ipv6 permitted access works  (see also https://www.heise.de/ct/artikel/IPv6-DynDNS-klemmt-4785681.html))


## Not automated steps
* *Home servers*:
  * traefik: SSL certs gen
  * transmission & samba: Directory structure (e.g., on (encrypted luks) sparse file)
* *Dev workstations*:
  * Apps setup
    * *VSCod~~e~~ium*: Install extension 'Settings Sync' & follow instructions
    * *Firefox*:
      * Go to [about:profiles](about:profiles) and *Launch profile in new browser* for 'default'
      * Open [about:profiles](about:profiles) again in a new browser window & delete the other profile, including data
      * Allow extensions
      * Right click on Bookmarks bar &rarr; *Manage bookmarks* &rarr; *Import and Backup* &rarr; *Restore* &rarr; *Choose File* &rarr; Select the hidden firefox default bookmarks file
      * Cleanup &rarr;


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
