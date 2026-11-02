# Memoria técnica — Mantenimiento del Sistema

> Esqueleto: completen cada sección con sus palabras. Esta memoria es lo que van a defender en la exposición.

## 1. Introducción
<!-- Qué es el proyecto, qué problema resuelve, cuáles son las 3 tareas y por qué las eligieron. -->

## 2. Requisitos técnicos
<!-- Sistema (Debian en VirtualBox), Bash, herramientas usadas (tar, find, top, free, df, awk), cómo instalarlas. -->

## 3. Desarrollo
### 3.1 Estructura del proyecto
### 3.2 Configuración (`config.conf`) y utilidades (`lib/utils.sh`)
### 3.3 Menú principal y validación de entrada
### 3.4 Módulo de backup
### 3.5 Módulo de informe de recursos
### 3.6 Módulo de control de disco
<!-- En cada punto: pegar fragmentos de código y explicar línea por línea qué hace y por qué. -->

## 4. Pruebas y validación
<!-- Tabla: caso de prueba | resultado esperado | resultado obtenido. Con capturas de pantalla. -->

| Caso | Esperado | Obtenido |
|---|---|---|
| Opción inválida en el menú | Mensaje de error y vuelve al menú | |
| Backup de directorio existente | Se crea el .tar.gz | |
| Backup de directorio inexistente | Error claro, sin crear nada | |
| Rotación de backups viejos | Se borran solo los `backup_*` viejos | |
| Informe de recursos | Se agrega un informe al log | |
| Alerta de disco con umbral bajo | Aparece ALERTA y WARN en el log | |

## 5. Reflexiones finales
<!-- Dificultades encontradas, qué aprendieron, mejoras posibles (cron, rsync, usuarios, etc.). -->
