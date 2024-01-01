#!/bin/bash
# -------------------------------------------------------------------
# ubuntu_install_chrony.sh
# -------------------------------------------------------------------

#:begin

# Установка chrony
sudo apt-get install chrony

# Разрешим автозапуск сервиса chrony
sudo systemctl enable chrony

#:Exit

