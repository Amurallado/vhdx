# Montar Archivos VHDX en Linux

Este repositorio contiene scripts para montar y desmontar archivos VHDX (Virtual Hard Disk v2) en sistemas Linux, facilitando el acceso a discos virtuales usados en plataformas como Hyper-V.

## Requisitos
- Linux con soporte para NBD (Network Block Device)
- `qemu-utils` instalado (`sudo apt install qemu-utils`)
- Permisos de superusuario (sudo)

## Archivos
- `menuvhdx.sh`: Script interactivo para montar un archivo VHDX.
- `unmount.sh`: Script para desmontar el archivo VHDX previamente montado.

## Uso

### Montar un archivo VHDX
1. Copie el archivo `.vhdx` a la ruta `/media/<usuario>/<medio>/`.
2. Ejecute el script de montaje:
   ```bash
   bash menuvhdx.sh
   ```
3. Siga las instrucciones:
   - Ingrese el nombre del archivo VHDX (ejemplo: `mi_disco.vhdx`)
   - Ingrese el número de disco NBD (ejemplo: `0` para `/dev/nbd0`)
   - Ingrese ruta donde se encuentra el archivo (ejemplo: `usuario/USB`)
4. El script montará la partición 2 del VHDX en `/mnt/vhdx_mount/<nombre_vhdx>`.

### Desmontar el archivo VHDX
1. Ejecute el script de desmontaje:
   ```bash
   bash unmount.sh
   ```
2. Ingrese el nombre del archivo VHDX (sin la extensión `.vhdx`).
3. El script desmontará y limpiará los recursos asociados.

## Notas
- El script asume que la partición a montar es la número 2 (`p2`). Modifique si su VHDX tiene otra estructura.
- Si tiene varios VHDX montados, ajuste el número de disco NBD para evitar conflictos.
- Para ver los dispositivos NBD disponibles: `ls /dev/nbd*`

## Solución de problemas
- Si recibe errores de permisos, asegúrese de ejecutar los scripts con `sudo` o como usuario con privilegios.
- Si el archivo no se monta, verifique que el archivo `.vhdx` exista en la ruta indicada y que el número de disco NBD esté libre.

