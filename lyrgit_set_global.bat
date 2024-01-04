@echo off
rem -------------------------------------------------------------------
rem lyrgit_set_global.bat
rem -------------------------------------------------------------------
chcp 1251

:begin
git config --global user.name "lisitsinyr"

git config --global user.email "lisitsinyr@gmail.com"

rem git config --list > ~/DATA/GIT/GIT_CONFIG_set_global

:Exit
