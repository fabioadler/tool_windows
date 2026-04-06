@echo off
chcp 65001 >nul
cls
title Tools Windows
:main
cls
echo "                                                                                     "
echo "   _________  ________  ___       ___       ________                                 "                           
echo "  |\___   ___\\   __  \|\  \     |\  \     |\   ____\                                "                   
echo "  \|___ \  \_\ \  \|\  \ \  \    \ \  \    \ \  \___|_                               "                      
echo "       \ \  \ \ \  \\\  \ \  \    \ \  \    \ \_____  \                              "                       
echo "        \ \  \ \ \  \\\  \ \  \____\ \  \____\|____|\  \                             "                       
echo "         \ \__\ \ \_______\ \_______\ \_______\____\_\  \                            "                         
echo "          \|__|  \|_______|\|_______|\|_______|\_________\                           "                         
echo "                                              \|_________|                           "                                                                                                    
echo "                                                                                     "
echo "   ___       __   ___  ________   ________  ________  ___       __   ________        "     
echo "  |\  \     |\  \|\  \|\   ___  \|\   ___ \|\   __  \|\  \     |\  \|\   ____\       "    
echo "  \ \  \    \ \  \ \  \ \  \\ \  \ \  \_|\ \ \  \|\  \ \  \    \ \  \ \  \___|_      " 
echo "   \ \  \  __\ \  \ \  \ \  \\ \  \ \  \ \\ \ \  \\\  \ \  \  __\ \  \ \_____  \     " 
echo "    \ \  \|\__\_\  \ \  \ \  \\ \  \ \  \_\\ \ \  \\\  \ \  \|\__\_\  \|____|\  \    " 
echo "     \ \____________\ \__\ \__\\ \__\ \_______\ \_______\ \____________\____\_\  \   " 
echo "      \|____________|\|__|\|__| \|__|\|_______|\|_______|\|____________|\_________\  "
echo "                                                                       \|_________|  "
echo "                                                                                     "
echo "     By: https://github.com/fabioadler   |  Name: Fábio Adler de L. Gomes            "
echo "                                                                                     "
echo "                                                                                     "
echo "  1) Backup drivers Windows.                                                         "
echo "  2) Restaurar Backup Drivers Windows.                                               "
echo "  3) Reiniciar the PC into BIOS.                                                     "
echo "  4) Install gpedit (group policy editor).                                           "
echo "  5) Bypass criação usuario.                                                         "
echo "  6) Ver BitLocker status.                                                           "
echo "  7) Desabilitar BitLocker on a disk.                                                "
echo "  8) Remover AI do Windows.                                                          "
echo "  9) Ativiar Windows e Office.                                                       "
echo "  10) Instalar o winget.                                                             "
echo "                                                                                     "
echo "  0) Fechar.                                                                         "
echo "                                                                                     "                                                                     "
echo(
echo(
set /p opcao=Digite o numero da opção desejada: 
if "%opcao%" == "0" (
    cls
    exit
) else if "%opcao%" == "1" (
    echo(
    set /p dir=Caminho onde vai ser feito o backup: 
    if exist "%dir%" (
        echo Iniciando Backup...
        dism /online /export-driver /destination:"%dir%"
        echo(
        echo Backup finalizado.
        pause
        goto main
    ) else (
        echo Iniciando Backup...
        mkdir "%dir%"
        dism /online /export-driver /destination:"%dir%"
        echo(
        echo Backup finalizado.
        pause
        goto main
    )
) else if "%opcao%" == "2" (
    echo(
    set /p dir=Digite o caminho do backup: 
    if exist "%dir%" (
        echo Iniciando a restauração do backup...
        pnputil /add-driver "%dir%\*.inf" /subdirs /install
        echo(
        echo Restauração finalizada
        pause
        goto main
    ) else (
        echo O caminho não foi encontrado
        pause
        goto main
    )
) else if "%opcao%" == "3" (
    shutdown -r -fw -t 0
) else if "%opcao%" == "4" (
    echo(
    echo Iniciando...
    pushd "%~dp0"
    dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
    dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt
    for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"
    echo(
    echo Finalizado.
    pause 
    goto main
) else if "%opcao%" == "5" (
    echo(
    echo Iniciando...
    start ms-cxh:localonly
    pause
    goto main
) else if "%opcao%" == "6" (
    manage-bde -status
    pause
    goto main
) else if "%opcao%" == "7" (
    echo(
    echo Começando...
    set /p letra=Digite a letra da unidade desejada: 
    manage-bde -off %letra%
    echo(
    echo Finalizado...
    pause
    goto main
) else if "%opcao%" == "8" (
    echo Iniciando...
    powershell -ExecutionPolicy Bypass -Command "& ([scriptblock]::Create((irm https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1)))"
    cls
    goto main
) else if "%opcao%" == "9" (
    echo Iniciando...
    powershell -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex"
    cls
    goto main
) else if "%opcao%" == "10" (
    echo Iniciando...
    powershell -ExecutionPolicy Bypass -Command "Install-Module -Name Microsoft.WinGet.Client"
    cls
    goto main
) else (
    echo(
    echo A opção digitada não existe!
    echo Tente novamente.
    echo(
    pause
    goto main
)