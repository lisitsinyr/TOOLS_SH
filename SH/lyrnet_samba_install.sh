﻿#!/bin/bash
# -------------------------------------------------------------------
# lyrnet_samba_install.sh
# -------------------------------------------------------------------

#:begin
echo "---------------------------------"
echo " Установка samba                 "
echo "---------------------------------"
sudo apt-get install samba

echo "---------------------------------"
echo " Разрешаем автостарт сервиса smbd"
echo "---------------------------------"
sudo systemctl enable smbd

#:Exit
