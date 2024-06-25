﻿#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_STORE.sh
# -------------------------------------------------------------------

#begin
    echo ---------------------------------------------
    echo create /home/lyr/STORE
    echo ---------------------------------------------

    # ------------------------------------------------------------------
    # Создаем каталог /home/lyr/STORE
    # ------------------------------------------------------------------
    sudo mkdir -p /home/lyr/STORE
    cd /home/lyr/STORE

    # ------------------------------------------------------------------
    # Задаем права на созданный каталог
    # ------------------------------------------------------------------
    sudo chmod -R 770 /home/lyr/STORE

    # ------------------------------------------------------------------
    # Задаем владельца на созданный каталог
    # ------------------------------------------------------------------
    sudo chown -R lyr:lyr /home/lyr/STORE

#end
