#!/bin/bash
# -------------------------------------------------------------------
# lyr_create_DATA.sh
# -------------------------------------------------------------------

#:begin

# ------------------------------------------------------------------
# Создаем каталог /DATA
sudo mkdir -p /DATA
# Задаем права на созданный каталог
sudo chmod 770 /DATA

# ------------------------------------------------------------------
# Создаем каталог /DATA/public
sudo mkdir -p /DATA/public
cd /DATA/public
# Задаем права на созданный каталог
sudo chmod -R 777 /DATA/public
# Создать группу пользователей
sudo groupadd DATA-public-w
# Создать группу пользователей
sudo groupadd DATA-public-r
# Задаем владельца на созданный каталог
sudo chown -R root:root /DATA/public
# Добавить ранее созданного пользователя в эту группу:
#sudo usermod -a -G DATA-public-w lyr
# Добавить ранее созданного пользователя в эту группу:
#sudo usermod -a -G DATA-public-r lyr

# ------------------------------------------------------------------
# Создаем каталог /DATA/lyrs
sudo mkdir -p /DATA/lyrs
cd /DATA/lyrs
# Задаем права на созданный каталог
sudo chmod 770 /DATA/lyrs
# Создать группу пользователей
sudo groupadd DATA_lyrs_w
# Создать группу пользователей
sudo groupadd DATA_lyrs_r
# Задаем владельца на созданный каталог
sudo chown -R lyr:DATA_lyrs_w /DATA/lyrs
# Добавить ранее созданного пользователя в эту группу:
sudo usermod -a -G DATA_lyrs_w lyr
# Добавить ранее созданного пользователя в эту группу:
sudo usermod -a -G DATA_lyrs_r lyr
# Добавить ранее созданного пользователя в эту группу:
sudo usermod -a -G DATA_lyrs_w lyr2
# Добавить ранее созданного пользователя в эту группу:
sudo usermod -a -G DATA_lyrs_r lyr2

# ------------------------------------------------------------------
# Создаем каталог /DATA/lyr
sudo mkdir -p /DATA/lyr
cd /DATA/lyr
# Задаем права на созданный каталог
sudo chmod -R 770 /DATA/lyr
# Создать группу пользователей
sudo groupadd DATA_lyr_w
# Создать группу пользователей
sudo groupadd DATA_lyr_r
# Задаем владельца на созданный каталог
sudo chown -R lyr:DATA_lyr_w /DATA/lyr
# Добавить ранее созданного пользователя в эту группу:
sudo usermod -a -G DATA_lyr_w lyr
# Добавить ранее созданного пользователя в эту группу:
sudo usermod -a -G DATA_lyr_r lyr
# Добавить ранее созданного пользователя в эту группу:
sudo usermod -a -G DATA_lyr_w lyr2
# Добавить ранее созданного пользователя в эту группу:
sudo usermod -a -G DATA_lyr_r lyr2

#:Exit
