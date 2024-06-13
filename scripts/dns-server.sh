#!/bin/bash

#############################################
# Installasi DNS Server BIND9
#############################################

# Instalasi BIND9
apt-get install -y bind9

# Konfigurasi BIND9
cat <<EOF > /etc/bind/named.conf.local
zone "andrijunaedi.io" {
type master;
file "/etc/bind/db.andrijunaedi.io";
};
EOF

# Buat file zona
cat <<EOF > /etc/bind/db.andrijunaedi.io
\$TTL 604800
@ IN SOA andrijunaedi.io. root.andrijunaedi.io. (
1 ; Serial
604800 ; Refresh
86400 ; Retry
2419200 ; Expire
604800 ) ; Negative Cache TTL
;
@ IN NS andrijunaedi.io.
ns1 IN A 192.168.201.10
@ IN A 192.168.201.10
EOF

# Konfigurasi Resolusi DNS
cat <<EOF > /etc/resolv.conf
nameserver 127.0.0.1
options edns0 trust-ad
search localdomain
EOF

# Test Konfigurasi BIND9
named-checkconf
named-checkzone andrijunaedi.io /etc/bind/db.andrijunaedi.io

# Restart BIND9
systemctl restart bind9