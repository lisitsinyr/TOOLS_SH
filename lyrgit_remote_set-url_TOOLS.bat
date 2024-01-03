@echo off
rem -------------------------------------------------------------------
rem lyrgit_remote_set-url_TOOLS.bat
rem -------------------------------------------------------------------
chcp 1251

:begin
git remote -v

rem git remote set-url origin https://github.com/lisitsinyr/TOOLS.git
git remote set-url origin git@github.com:lisitsinyr/TOOLS.git

git remote -v

:Exit
