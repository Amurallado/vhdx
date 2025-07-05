read -p "Ingrese el nombre del archivo VHDX: " vhdx_file
read -p "Ingrese el numero del disco: " disk_number
vhdx_file="$vhdx_file.vhdx"
disk_number="nbd$disk_number"

if [ -f "/media/canelo/SD/$vhdx_file" ]; then
    echo "El archivo VHDX existe."
else
    echo "El archivo VHDX no existe."
    exit 1
fi

echo "Montando el archivo VHDX..."
sudo modprobe nbd max_part=8
sudo qemu-nbd --connect=/dev/$disk_number /media/canelo/SD/"$vhdx_file"
sudo partprobe /dev/$disk_number
sudo mkdir /mnt/vhdx_mount/"$vhdx_file"
sudo mount /dev/$disk_numberp2 /mnt/vhdx_mount/"$vhdx_file"

echo "El archivo VHDX se ha montado correctamente."
echo "El punto de montaje es /mnt/vhdx_mount/$vhdx_file"
echo "Para desmontar el archivo VHDX, ejecute el script unmount.sh"