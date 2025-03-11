#!/bin/bash
# -------------------------------------------------------------------
# lyrnet_samba_install.sh
# -------------------------------------------------------------------

#begin
    # --------------------------------------------
    #  Установка выполняется из репозитория samba
    # --------------------------------------------
    #sudo apt-get update && sudo apt-get install samba
    sudo apt update && sudo apt install samba

    # --------------------------------------------
    #  Разрешаем автостарт сервиса smbd
    # --------------------------------------------
    sudo systemctl enable smbd

    # --------------------------------------------
    #  Проверка, что сервис smbd запустился
    # --------------------------------------------
    sudo systemctl status smbd

    # --------------------------------------------
    #  Установка autofs
    # --------------------------------------------
    #sudo apt-get update && sudo apt-get install autofs
    sudo apt update && sudo apt install autofs

    # --------------------------------------------
    # Установим набор утилит для монтирования SMB
    # Установка cifs-utils
    # --------------------------------------------
    #sudo apt-get update && sudo apt-get install cifs-utils
    sudo apt update && sudo apt install cifs-utils

    # После установки, демон autofs запустится автоматически,
    # но на время конфигурирования его нужно отключить:
    sudo /etc/init.d/autofs stop

#end

#--------------------------------------------------------------------------------
