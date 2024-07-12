@echo off
setlocal enabledelayedexpansion

:: Define el archivo de salida
set output_file=estructura.txt

:: Limpia el archivo de salida si ya existe
if exist %output_file% del %output_file%

:: Recorre los archivos y carpetas en el directorio actual
for /r %%i in (*) do (
    set "filepath=%%i"
    set "relpath=!filepath:%cd%\=!"
    echo !relpath! >> %output_file%
)

:: Muestra un mensaje de finalización
echo Estructura del proyecto guardada en %output_file%
pause
