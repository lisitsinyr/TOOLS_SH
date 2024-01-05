@echo off
rem -------------------------------------------------------------------
rem lyrgit_init.bat
rem ----------------------------------------------------------------------------
rem Инициализация репозитария в текущем катологе или в заданном каталоге       
rem ----------------------------------------------------------------------------
rem usage: git init [-q | --quiet] [--bare] [--template=<template-directory>]
rem                 [--separate-git-dir <git-dir>] [--object-format=<format>]
rem                 [-b <branch-name> | --initial-branch=<branch-name>]
rem                 [--shared[=<permissions>]] [<directory>]
rem 
rem     --[no-]template <template-directory>
rem                           directory from which templates will be used
rem     --[no-]bare           create a bare repository
rem     --shared[=<permissions>]
rem                           specify that the git repository is to be shared amongst several users
rem     -q, --[no-]quiet      be quiet
rem     --[no-]separate-git-dir <gitdir>
rem                           separate git dir from working tree
rem     -b, --[no-]initial-branch <name>
rem                           override the name of the initial branch
rem     --[no-]object-format <hash>
rem                           specify the hash algorithm to use
rem ----------------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET PathName=%1
goto Begin
rem -------------------------------------------------------------------
:P1_Input
set /p PathName=PathName:
if "%PathName%" == "" goto P1_Empty
goto Begin
rem -------------------------------------------------------------------
:P1_Empty
echo Значение параметра PathName не установлено
echo Repository будет создан в текущем каталоге
goto GIT_create_Repository

rem -------------------------------------------------------------------
:begin
echo Переход в каталог %PathName%
cd %PathName%
goto GIT_create_Repository

rem -------------------------------------------------------------------
:GIT_create_Repository
echo %PathName%
touch .gitignore
attrib +A +H .gitignore

touch .gitmodules
attrib +A +H .gitmodules

touch .README.md
attrib +A +H .README.md
echo "*" >> .README.md

git init

git add --all

git commit -m "Git Bash commit update"

git branch -M main

:Exit
