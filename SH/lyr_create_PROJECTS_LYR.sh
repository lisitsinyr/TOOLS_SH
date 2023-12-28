#!/bin/bash
# -------------------------------------------------------------------
# lyr_create_PROJECTS_LYR.sh
# -------------------------------------------------------------------

#:begin

# ------------------------------------------------------------------
# Создаем каталог /home/lyr/PROJECTS_LYR
sudo mkdir -p /home/lyr/PROJECTS_LYR
cd /home/lyr/PROJECTS_LYR
# Задаем права на созданный каталог
sudo chmod -R 770 /home/lyr/PROJECTS_LYR
# Задаем владельца на созданный каталог
sudo chown -R lyr:lyr /home/lyr/PROJECTS_LYR

#:Exit
