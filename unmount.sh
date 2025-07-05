read -p "Ingrese el nombre del archivo VHDX: " vhdx_file
read -p "Ingrese el numero de disco: " disk_number

sudo umount /mnt/vhdx_mount/"$vhdx_file"
sudo qemu-nbd --disconnect /dev/nbd$disk_number
sudo rm -rf /mnt/vhdx_mount/"$vhdx_file"
sudo rm -rf /dev/nbd$disk_number
sudo rm -rf /dev/nbd${disk_number}p2
sudo rm -rf /dev/nbd${disk_number}p1
sudo rm -rf /dev/nbd${disk_number}p0