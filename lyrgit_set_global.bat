@echo off
rem -------------------------------------------------------------------
rem lyrgit_set_global.bat
rem ----------------------------------------------------------------------------
rem ***SET_global
rem ----------------------------------------------------------------------------
chcp 1251

:begin
git config --global user.name "lisitsinyr"

git config --global user.email "lisitsinyr@gmail.com"

git config --list --global > ./GIT_CONFIG_set_list_global

:Exit
