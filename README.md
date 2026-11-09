# Mantenimiento del Sistema (Bash)

Script en Bash con menú interactivo que automatiza tres tareas de mantenimiento en Linux.
Trabajo Final de Sistemas Operativos — Tecnicatura Superior en Desarrollo de Software, Instituto Superior IDRA.
Integrantes: D'arino Agustin, Zampino Facundo y Mungiello Gonzalo

## Tareas automatizadas
1. **Backup**: comprime un directorio en `.tar.gz` con fecha y hora, y elimina backups antiguos.
2. **Informe de recursos**: registra uso de CPU, memoria y disco en un log.
3. **Control de disco**: alerta en el log cuando una partición supera un umbral configurable.

## Uso
```bash
git clone https://github.com/USUARIO/mantenimiento-so.git
cd mantenimiento-so
chmod +x mantenimiento.sh
./mantenimiento.sh
```

Ejemplo: elegí `1`, presioná Enter para usar el directorio de `config.conf` (o escribí otra ruta) y se crea
`~/backups/backup_<carpeta>_<fecha>_<hora>.tar.gz`.

### Configuración
Editá `config.conf` para cambiar rutas, días de retención y umbral de disco, sin tocar el código.

### Logs
Se guardan en `logs/` (`mantenimiento.log` e `informe_recursos.log`).

## Cómo colaborar
1. Hacé un fork del repositorio.
2. Creá una rama: `git checkout -b mi-mejora`.
3. Hacé tus cambios y commit con un mensaje claro.
4. Subí la rama y abrí un Pull Request.

## Licencia
MIT. Ver el archivo [LICENSE](LICENSE).
