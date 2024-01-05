@echo off
rem -------------------------------------------------------------------
rem lyrgit_set_system.bat
rem ----------------------------------------------------------------------------
rem ***SET_system
rem ----------------------------------------------------------------------------
chcp 1251

:begin
git config --system user.name "lisitsinyr"

git config --system user.email "lisitsinyr@gmail.com"

git config --list --system > ./GIT_CONFIG_set_list_system

:Exit
