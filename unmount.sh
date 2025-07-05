read -p "Ingrese el nombre del archivo VHDX: " vhdx_file
vhdx_file="$vhdx_file.vhdx"

sudo umount /mnt/vhdx_mount/"$vhdx_file"
sudo qemu-nbd --disconnect /dev/nbd0
sudo rm -rf /mnt/vhdx_mount/"$vhdx_file"
sudo rm -rf /dev/nbd0
sudo rm -rf /dev/nbd0p2
sudo rm -rf /dev/nbd0p1
sudo rm -rf /dev/nbd0p0