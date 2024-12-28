apt update
apt upgrade
echo "net.ipv4.ip_forward = 1" > /etc/sysctl.d/00-amnezia.conf
reboot

# use the following repository for ubuntu sources with deb and deb-src types
# http://archive.ubuntu.com/ubuntu

add-apt-repository -y ppa:amnezia/ppa
apt install -y amneziawg
awg --version

lsmod | grep amnezia
modinfo amneziawg | grep ver

apt install -y curl wget python3 python3-pip python3-qrcode

wget -O awgcfg.py https://gist.githubusercontent.com/remittor/8c3d9ff293b2ba4b13c367cc1a69f9eb/raw/awgcfg.py

python3 awgcfg.py --make /etc/amnezia/amneziawg/awg0.conf -i 10.8.8.1/24 -p 49017
python3 awgcfg.py --create

python3 awgcfg.py -a "client-1"
python3 awgcfg.py -c -q


awg-quick up awg0
awg showconf awg0
awg show


awg-quick down awg0

systemctl enable --now awg-quick@awg0
systemctl restart awg-quick@awg0.service
