#!/bin/bash
# -------------------------------------------------------------------
# ubuntu_create_DATA.sh
# -------------------------------------------------------------------

#:begin

# Создаем каталог 
sudo mkdir /DATA
# Задаем права на созданный каталог
sudo chmod 777 /DATA

# Создаем каталог 
sudo mkdir -p /DATA/public
# Задаем права на созданный каталог
sudo chmod 777 /DATA/public

# Создаем каталог 
sudo mkdir -p /DATA/lyrs
# Задаем права на созданный каталог
sudo chmod 777 /DATA/lyrs

# Создаем каталог 
sudo mkdir /DATA/private
# Задаем права на созданный каталог
sudo chmod 777 /DATA/private

# Создаем каталог 
sudo mkdir /home/lyr/PROJECTS_LYR
# Задаем права на созданный каталог
sudo chmod 777 /home/lyr/PROJECTS_LYR

#:Exit

