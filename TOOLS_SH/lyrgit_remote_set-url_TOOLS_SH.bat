@echo off
rem -------------------------------------------------------------------
rem lyrgit_remote_set-url_TOOLS_SH.bat
rem -------------------------------------------------------------------
chcp 1251

:begin
git remote -v

rem git remote set-url origin https://github.com/lisitsinyr/TOOLS_SH.git
git remote set-url origin git@github.com:lisitsinyr/TOOLS_SH.git

git remote -v

:Exit
