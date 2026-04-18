@echo off
chcp 65001 >nul
cls
title Tools Windows
:main
title Tools Windows
cls
echo  _____________________________________________________________________________________
echo "                                                                                     "
echo "   _________  ________  ___       ___       ________                                 "                           
echo "  |\___   ___\\   __  \|\  \     |\  \     |\   ____\                                "                   
echo "  \|___ \  \_\ \  \|\  \ \  \    \ \  \    \ \  \___|_                               "                      
echo "       \ \  \ \ \  \\\  \ \  \    \ \  \    \ \_____  \                              "                       
echo "        \ \  \ \ \  \\\  \ \  \____\ \  \____\|____|\  \                             "                       
echo "         \ \__\ \ \_______\ \_______\ \_______\____\_\  \                            "                         
echo "          \|__|  \|_______|\|_______|\|_______|\_________\                           "                         
echo "                                              \|_________|                           "                                                                                                    
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
echo "     Update: V0.3                                                                  "
echo "                                                                                     "
echo "  1)  Backup drivers Windows                                                         "
echo "  2)  Restaurar Backup Drivers Windows.                                              "
echo "  3)  Reiniciar the PC into BIOS.                                                    "
echo "  4)  Install gpedit (group policy editor).                                          "
echo "  5)  Bypass criação usuario.                                                        "
echo "  6)  Ver BitLocker status.                                                          "
echo "  7)  Desabilitar BitLocker on a disk.                                               "
echo "  8)  Remover AI do Windows.                                                         "
echo "  9)  Ativiar Windows e Office.                                                      "
echo "  10) Instalar o winget.                                                             "
echo "  11) Ver status da compressão de memoria.                                           "
echo "  12) Ativar compressão de memoria.                                                  "
echo "  13) Desativar compressão de memoria.                                               "
echo "  14) Desativar controle inteligente de aplicativo.                                  "
echo "  15) Ativar controle inteligente de aplicativo.                                     "
echo "  16) Ver ponto de restauração.                                                      "
echo "  17) Criar ponto de restauração.                                                    "
echo "  18) Desabilitar limitação de criação de ponto de restauração.                      "
echo "  19) Christitus ferramenta windows.                                                 "
echo "  20) Winhance ferramenta windows.                                                   "
echo "  21) Adicionar usuario.                                                             "
echo "  22) Remover usuario.                                                               "
echo "                                                                                     "
echo "  0) Fechar.                                                                         "
echo "                                                                                     "
echo "_____________________________________________________________________________________"
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
    echo Finalizado
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
) else if "%opcao%" == "11" (
    echo Iniciando...
    powershell -ExecutionPolicy Bypass -Command "Get-MMAgent"
    echo(
    pause
    goto main
) else if "%opcao%" == "12" (
    echo Iniciando...
    powershell -ExecutionPolicy Bypass -Command "Enable-MMAgent -mc"
    cls
    goto main
) else if "%opcao%" == "13" (
    echo Iniciando...
    powershell -ExecutionPolicy Bypass -Command "Disable-MMAgent -mc"
    cls
    goto main
) else if "%opcao%" == "14" (
    echo Iniciando...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Policy" /v VerifiedAndReputablePolicyState /t REG_DWORD /d 0 /f
    powershell -ExecutionPolicy Bypass -Command "Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\CI\Policy -Name VerifiedAndReputablePolicyState -Value 0"
    cls
    goto main
) else if "%opcao%" == "15" (
    echo Iniciando...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Policy" /v VerifiedAndReputablePolicyState /t REG_DWORD /d 1 /f
    powershell -ExecutionPolicy Bypass -Command "Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\CI\Policy -Name VerifiedAndReputablePolicyState -Value 1"
    cls
    goto main
) else if "%opcao%" == "16" (
    echo Iniciando... Caso não mostre nada e por que não tem nenhum ponto criado
    powershell -ExecutionPolicy Bypass -Command "Get-ComputerRestorePoint | Format-Table -AutoSize"
    pause
    goto main
) else if "%opcao%" == "17" (
    echo Iniciando...
    set /p ponto=Digite o nome do ponto de restauração "sem espeaços":
    echo  ________________________________________
    echo " Escolha a opção de restauração a criar "
    echo " 1) APPLICATION_INSTALL                 "
    echo " 2) APPLICATION_UNINSTALL               "
    echo " 3) CANCELLED_OPERATION                 "
    echo " 4) DEVICE_DRIVER_INSTALL               "
    echo " 5) MODIFY_SETTINGS                     "
    echo "________________________________________"
    set /p tprc=Digite o tipo de ponto de recuperação: 
    if "%tprc%" == "1" (
        powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description %ponto% -RestorePointType APPLICATION_INSTALL"
        pause
    ) else if "%tprc%" == "2" (
        powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description %ponto% -RestorePointType APPLICATION_UNINSTALL"
        pause
    ) else if "%tprc%" == "3" (
        powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description %ponto% -RestorePointType CANCELLED_OPERATION"
        pause
    ) else if "%tprc%" == "4" (
        powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description %ponto% -RestorePointType DEVICE_DRIVER_INSTALL"
        pause
    ) else if "%tprc%" == "5" (
        powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description %ponto% -RestorePointType MODIFY_SETTINGS"
        pause
    ) else (
        echo "Escolha uma opção valida! "
        pause
        cls
        goto main
    )
    cls
    goto main
) else if "%opcao%" == "18" (
    echo Iniciando...
    REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F
    cls
    goto main
) else if "%opcao%" == "19" (
    echo Iniciando...
    powershell -ExecutionPolicy Bypass -Command "irm christitus.com/win | iex"
    cls
    goto main
) else if "%opcao%" == "20" (
    echo Iniciando...
    powershell -ExecutionPolicy Bypass -Command "irm https://get.winhance.net | iex"
    cls
    goto main
) else if "%opcao%" == "21" (
    echo Iniciando...
    set /p nome_user=Digite o nome do usuario: 
    set /p tp_usuario="O usuario vai ser admin (y/n): "
    net user %nome_user% 123 /active:yes /expires:never /add
    if "%tp_usuario%" == "y" (
        net localgroup administrators %nome_usuario% /add
    ) else if "%tp_usuario%" == "Y" (
        net localgroup administrators %nome_usuario% /add
    )
    echo O usuario %nome_user% foi criado com as senha 123
    pause
    cls
    goto main
) else if "%opcao%" == "22" (
    echo Iniciando...
    set /p nome_user=Digite o nome do usuario: 
    net user %nome_user% /delete
    pause
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