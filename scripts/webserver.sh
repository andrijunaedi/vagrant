#!/bin/bash

#############################################
# Installasi Webserver Nginx
#############################################

# Update dan instalasi Nginx
apt-get install -y nginx

# Start dan enable Nginx
systemctl start nginx
systemctl enable nginx

# Konfigurasi Nginx
cat <<EOF > /etc/nginx/sites-available/default
server {
    listen 80;
    server_name andrijunaedi.io;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

# Edit file index.html
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to andrijunaedi.io</title>
</head>
<body>
    <h1>Welcome to andrijunaedi.io</h1>
    <p>This page is served by Nginx.</p>
</body>
</html>
EOF

# Restart Nginx
systemctl restart nginx

