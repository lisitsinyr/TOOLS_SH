@echo off
rem -------------------------------------------------------------------
rem lyrgit_set_current.bat
rem ----------------------------------------------------------------------------"
rem ***SET_current
rem ----------------------------------------------------------------------------"
chcp 1251

:begin
git config user.name "lisitsinyr"

git config user.email "lisitsinyr@gmail.com"

git config --list > ./GIT_CONFIG_set_list_current


:Exit
