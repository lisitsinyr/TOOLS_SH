@echo off
rem -------------------------------------------------------------------
rem lyrgit_create_new_TOOLS_SH.bat
rem -------------------------------------------------------------------
chcp 1251

:begin
echo "# TOOLS" > README.md
git init

git add --all

git commit -m "Git Bash commit update"

git branch -M main

rem git remote add origin https://github.com/lisitsinyr/TOOLS_SH.git
git remote add origin git@github.com:lisitsinyr/TOOLS_SH.git

git push -u origin main

:Exit
