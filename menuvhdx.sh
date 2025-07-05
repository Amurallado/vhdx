sudo modprobe nbd max_part=8
read -p "Ingrese el nombre del archivo VHDX (sin extensión): " vhdx_file
read -p "Ingrese el numero del disco: " disk_number
read -p "Ingrese su usuario y medio de montaje (ejemplo: `usuario/USB`): " mount_point
vhdx_disk="$vhdx_file.vhdx"
device_number="nbd$disk_number"

if [ -f "/media/$mount_point/$vhdx_disk" ]; then
    echo "El archivo VHDX existe."
else
    echo "El archivo VHDX no existe."
    exit 1
fi

sudo qemu-nbd --connect=/dev/$device_number /media/"$mount_point"/"$vhdx_disk"
sudo partprobe /dev/$device_number
lsblk
read -p "Ingrese el numero de la particion que desea montar (ejemplo: 1, 2, etc.): " number_partition
sudo mkdir -p /mnt/vhdx_mount/"$vhdx_file"
sudo mount /dev/${device_number}p$number_partition /mnt/vhdx_mount/"$vhdx_file"

echo "Montando el archivo VHDX..."
echo "El archivo VHDX se ha montado correctamente."
echo "El punto de montaje es /mnt/vhdx_mount/$vhdx_file"
echo "Para desmontar el archivo VHDX, ejecute el script unmount.sh"