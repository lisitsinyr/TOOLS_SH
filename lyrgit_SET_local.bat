@echo off
rem -------------------------------------------------------------------
rem lyrgit_set_local.bat
rem ----------------------------------------------------------------------------
rem ***SET_local
rem ----------------------------------------------------------------------------
chcp 1251

:begin
git config --local user.name "lisitsinyr"

git config --local user.email "lisitsinyr@gmail.com"

git config --list --local > ./GIT_CONFIG_set_list_local

:Exit
