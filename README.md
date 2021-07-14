# sc
# Cara memperbarui kernel di debian 10 ke 5.10

daftar edit:
nano /etc/apt/sources.list
lalu, tambahkan ini:
deb https://deb.debian.org/debian buster-backports main
ctrl+x
kamu
memasukkan
kemudian, perbarui repo:
pembaruan yang tepat
pergi ke daftar pencarian:
pencarian apt-cache linux-image
Install:
apt install linux-image-blablabla
pilih versi kernel yang Anda inginkan, tetapi saya tidak merekomendasikan untuk versi cloud dan rt.
setelah instal, lalu reboot.
mulai ulang
login lagi ke vps Anda dan ketik
uname -r
Jika kernel diubah maka berfungsi.
setelah ini Anda dapat menginstal autoscript
