@echo off
rem -------------------------------------------------------------------
rem lyrgit_config.bat
rem -------------------------------------------------------------------
chcp 1251

:begin
git config --list --show-origin --show-scope > config

:Exit
