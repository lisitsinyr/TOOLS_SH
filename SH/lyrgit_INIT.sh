#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_INIT.sh
# ----------------------------------------------------------------------------
# Инициализация репозитария в текущем катологе или в заданном каталоге       
# ----------------------------------------------------------------------------
# usage: git init [-q | --quiet] [--bare] [--template=<template-directory>]
#                 [--separate-git-dir <git-dir>] [--object-format=<format>]
#                 [-b <branch-name> | --initial-branch=<branch-name>]
#                 [--shared[=<permissions>]] [<directory>]
# 
#     --[no-]template <template-directory>
#                           directory from which templates will be used
#     --[no-]bare           create a bare repository
#     --shared[=<permissions>]
#                           specify that the git repository is to be shared amongst several users
#     -q, --[no-]quiet      be quiet
#     --[no-]separate-git-dir <gitdir>
#                           separate git dir from working tree
#     -b, --[no-]initial-branch <name>
#                           override the name of the initial branch
#     --[no-]object-format <hash>
#                           specify the hash algorithm to use
# ----------------------------------------------------------------------------

#:begin
echo "---------------------------------------------"
echo "                                             "
echo "---------------------------------------------"

# -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
# -------------------------------------------------------------------
:P1_Input
set /p PathName=PathName:
if "%PathName%" == "" goto P1_Empty
goto Begin
# -------------------------------------------------------------------
:P1_Empty
# Значение параметра PathName не установлено
# Repository будет создан в текущем каталоге
goto GIT_create_Repository

# -------------------------------------------------------------------
:begin
echo Переход в каталог %PathName%
cd %PathName%
goto GIT_create_Repository

# -------------------------------------------------------------------
:GIT_create_Repository
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

#:Exit

