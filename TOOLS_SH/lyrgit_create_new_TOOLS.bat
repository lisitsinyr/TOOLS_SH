@echo off
rem -------------------------------------------------------------------
rem lyrgit_create_new_TOOLS.bat
rem -------------------------------------------------------------------
chcp 1251

:begin
echo "# TOOLS" > README.md
git init

git add --all
git commit -m "Git Bash commit update"

git branch -M main
rem git remote add origin https://github.com/lisitsinyr/TOOLS.git
git remote add origin git@github.com:lisitsinyr/TOOLS.git

git push -u origin main

:Exit
