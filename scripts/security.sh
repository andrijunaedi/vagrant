#!/bin/bash

#############################################
# Installasi Keamanan Server
#############################################

# SSH Disable Root Login
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

# Firewall UFW Allow SSH, HTTP dan HTTPS
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp

# Enable Firewall
ufw enable

# Installasi Fail2Ban
apt-get install -y fail2ban

# Konfigurasi Fail2Ban
cat <<EOF > /etc/fail2ban/jail.local
[sshd]
enabled = true
port = 22
logpath = %(sshd_log)s
maxretry = 5
EOF

# Restart Fail2Ban
systemctl start fail2ban
systemctl enable fail2ban
