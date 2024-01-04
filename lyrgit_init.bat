@echo off
rem -------------------------------------------------------------------
rem lyrgit_init.bat
rem -------------------------------------------------------------------
chcp 1251

:begin

git init

touch .gitignore
attrib +A +H .gitignore

touch .gitmodules
attrib +A +H .gitmodules

touch .README.md
attrib +A +H .README.md

:Exit

