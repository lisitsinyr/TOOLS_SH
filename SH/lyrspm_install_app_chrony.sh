﻿#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_app_chrony.sh
# -------------------------------------------------------------------

#:begin
echo "------------------------------------"
echo " Установка chrony                   "
echo "------------------------------------"
sudo apt-get install chrony

echo "------------------------------------"
echo " Разрешим автозапуск сервиса chrony "
echo "------------------------------------"
sudo systemctl enable chrony

#:Exit
