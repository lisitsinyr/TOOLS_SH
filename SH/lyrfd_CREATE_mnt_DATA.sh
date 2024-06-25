﻿#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_mnt_DATA.sh
# -------------------------------------------------------------------

#begin
    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA
    # ------------------------------------------------------------------
    if [[ ! -d "/mnt/DATA" ]] ; then
        sudo mkdir -p /mnt/DATA
        cd /mnt/DATA
        # Задаем права на созданный каталог
        sudo chmod -R 770 /mnt/DATA
        # Задаем владельца на созданный каталог
        sudo chown -R lyr:lyr /mnt/DATA
    fi
#end
