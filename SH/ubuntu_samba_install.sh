#!/bin/bash
# -------------------------------------------------------------------
# ubuntu_samba_install.sh
# -------------------------------------------------------------------

#:begin

# Установка samba
sudo apt-get install samba

# Разрешаем автостарт сервиса smbd
sudo systemctl enable smbd

#:Exit

