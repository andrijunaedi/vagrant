# Perancangan dan Pengujian Webserver

## Perancangan

- Update konfigurasi nginx pada `/etc/nginx/sites-available/default` berikut:

  ```
  server {
      listen 80;
      server_name andrijunaedi.io;

      root /var/www/html;
      index index.html index.htm index.nginx-debian.html;

      location / {
          try_files \$uri \$uri/ =404;
      }
  }
  ```

  Note: Konfigurasi ini sudah termasuk di provision `scripts/webserver.sh` line `15-27`

- Test Konfigurasi Nginx

  ```
  sudo nginx -t
  ```

- Restart Nginx
  ```
  sudo systemctl restart nginx
  ```

## Pengujian

- Pengujian dengan terminal menggunakan curl

  ```
  curl http://andrijunaedi.io
  ```

- Periksa Log Access dan Error Nginx

  ```
  sudo tail -f /var/log/nginx/access.log /var/log/nginx/error.log

  ```
