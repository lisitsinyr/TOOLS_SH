﻿#!/bin/bash
# -------------------------------------------------------------------
# lyrnet_samba_crony.sh
# -------------------------------------------------------------------

#:begin
    # --------------------------------------------
    # синхронизации времени
    # --------------------------------------------
    # Установка демона chrony
    # --------------------------------------------
    sudo apt-get install chrony

    # --------------------------------------------
    # Разрешение автозапуска сервиса chrony
    # --------------------------------------------

    sudo systemctl enable chrony

#:Exit

#--------------------------------------------------------------------------------
