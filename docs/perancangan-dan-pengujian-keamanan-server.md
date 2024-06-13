# Perancangan dan Pengujian Keamanan Server

## Konfigurasi Dasar Keamanan Server

- Buat pengguna baru untuk adminitrator dan non-root akses

  ```
  sudo adduser devops
  sudo usermod -aG sudo devops
  ```

- Nonaktifkan login root dan ganti port default (optional jika diperlukan).

  ```
  PermitRootLogin no
  Port 2222
  ```

- Restart SSH

  ```
  sudo systemctl restart ssh
  ```

## Konfigurasi Firewall (UFW)

- Atur aturan dasar UFW untuk mengizinkan SSH, HTTP, dan HTTPS.

  Jika port default SSH diganti ke 2222

  ```
  sudo ufw allow 2222/tcp
  ```

  Jika port default SSH

  ```
  sudo ufw allow 2222/tcp
  ```

  Allow HTTP (80) dan HTTPS (443)

  ```
  sudo ufw allow 80/tcp
  sudo ufw allow 443/tcp
  sudo ufw enable
  ```

## Instalasi dan Konfigurasi Fail2Ban

- Instalasi Fail2Ban
  ```
  sudo apt install fail2ban -y
  ```
- Konfigurasi Fail2Ban

  ```
  sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
  sudo nano /etc/fail2ban/jail.local
  ```

- Sesuaikan konfigurasi untuk melindungi SSH dan layanan lainnya
  ```
  [sshd]
  enabled = true
  port = 2222
  filter = sshd
  logpath = /var/log/auth.log
  maxretry = 5
  ```
- Mulai dan Aktifkan Fail2Ban
  ```
  sudo systemctl start fail2ban
  sudo systemctl enable fail2ban
  ```

## Pengujian Keamanan Server

- Pengujian Firewall (NMAP)

  ```
  sudo apt install nmap -y
  nmap -p 1-65535 localhost
  ```

- Pengujian SSH

  Coba login dengan akun root untuk memastikan bahwa login root ditolak.

  ```
  ssh root@localhost -p 2222
  ```

- Pengujian Fail2Ban

  Lakukan beberapa percobaan login gagal untuk memastikan bahwa Fail2Ban memblokir IP setelah batas maksimal percobaan.
