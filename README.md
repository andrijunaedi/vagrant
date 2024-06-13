# Pengelolaan Server dengan Vagrant

Vagrant adalah alat yang memungkinkan Anda membuat dan mengelola mesin virtual dengan mudah. Dokumentasi ini akan menjelaskan langkah-langkah untuk menginstal Vagrant dan beberapa perintah dasar yang dapat digunakan.

## Instalasi Vagrant

Berikut adalah langkah-langkah untuk menginstal Vagrant di sistem Anda:

1. Kunjungi situs web resmi Vagrant di [https://www.vagrantup.com/](https://www.vagrantup.com/) dan unduh versi terbaru Vagrant sesuai dengan sistem operasi Anda.
2. Setelah selesai mengunduh, buka file instalasi dan ikuti petunjuk yang diberikan oleh wizard instalasi.
3. Setelah instalasi selesai, buka terminal atau command prompt dan ketik `vagrant --version` untuk memastikan Vagrant telah terinstal dengan benar.

## Perintah Dasar Vagrant

Berikut adalah beberapa perintah dasar yang dapat Anda gunakan dengan Vagrant:

- `vagrant up`: Menggunakan file konfigurasi `Vagrantfile` untuk membuat dan mengatur mesin virtual.
- `vagrant ssh`: Masuk ke dalam mesin virtual melalui SSH.
- `vagrant halt`: Mematikan mesin virtual yang sedang berjalan.
- `vagrant destroy`: Menghapus mesin virtual yang sedang berjalan.

## Struktur File dan Folder

Berikut adalah struktur file dan folder yang digunakan:

- `Vagrantfile`: Digunakan sebagai file konfigurasi Vagrant.
- `settings.yaml`: Digunakan sebagai wrapper konfigurasi Vagrant dalam format YAML.
- `scripts`: Folder yang berisi shell scripts yang digunakan untuk otomatisasi provisioning.
- `docs`: Folder yang berisi dokumentasi pengelolaan server.

## Migrations

Dengan menggunakan Vagrant, semua konfigurasi server disimpan dalam bentuk Infrastructure as Code sehingga kode ini dapat disimpan dalam repositori git dan digunakan berulang kali untuk melakukan provision server baru.

## Vagrant Snapshots

Vagrant menyediakan fitur snapshot yang memungkinkan untuk melakukan backup dan restore terhadap mesin virtual yang sedang berjalan. Berikut adalah langkah-langkah untuk menggunakan fitur snapshot pada Vagrant:

### Membuat Snapshot

1. Pastikan mesin virtual sedang berjalan dengan menjalankan perintah `vagrant up`.
2. Setelah mesin virtual berjalan, buka terminal atau command prompt dan masuk ke direktori proyek Vagrant.
3. Untuk membuat snapshot, jalankan perintah `vagrant snapshot save <nama_snapshot>`. Gantilah `<nama_snapshot>` dengan nama yang ingin diberikan pada snapshot tersebut.

### Menggunakan Snapshot

1. Untuk melihat daftar snapshot yang tersedia, jalankan perintah `vagrant snapshot list`.
2. Untuk mengembalikan mesin virtual ke snapshot tertentu, jalankan perintah `vagrant snapshot restore <nama_snapshot>`. Gantilah `<nama_snapshot>` dengan nama snapshot yang ingin digunakan.

### Menghapus Snapshot

1. Untuk menghapus snapshot tertentu, jalankan perintah `vagrant snapshot delete <nama_snapshot>`. Gantilah `<nama_snapshot>` dengan nama snapshot yang ingin dihapus.
2. Jika Anda ingin menghapus semua snapshot yang ada, jalankan perintah `vagrant snapshot delete --all`.

Dengan menggunakan fitur snapshot pada Vagrant, Anda dapat dengan mudah melakukan backup dan restore terhadap mesin virtual sesuai kebutuhan.
