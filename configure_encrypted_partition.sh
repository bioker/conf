device=$1
sudo cryptsetup luksFormat $device
sudo cryptsetup luksOpen $device crypto
sudo pv -tpreb /dev/zero | sudo dd of=/dev/mapper/crypto bs=128M
sudo mkfs.ext4 /dev/mapper/crypto
