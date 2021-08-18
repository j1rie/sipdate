# sipdate

sipdate inserts date stamps into SIP packets sent from germany’s popular router Fritz!Box
to attached IP phones. This is needed for certain Cisco models in order to be able to use the newest firmware.

See [1] for more details and network configuration.
libnetfilter_queue needs to be installed and  an iptables rule set.

make_sipdate.sh fetches, copies and patches needed files from libnetfilter_queue,
builds and installs binary and systemd service.

[1] https://www.ip-phone-forum.de/threads/korrekte-uhrzeit-auf-cisco-8961-9951-9971-an-fritzbox.289093
