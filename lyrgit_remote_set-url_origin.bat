@echo off
rem -------------------------------------------------------------------
rem lyrgit_remote_set-url_origin.bat
rem ----------------------------------------------------------------------------
rem 
rem ----------------------------------------------------------------------------
rem usage: git remote [-v | --verbose]
rem    or: git remote add [-t <branch>] [-m <master>] [-f] [--tags | --no-tags] [--mirror=<fetch|push>] <name> <url>
rem    or: git remote rename [--[no-]progress] <old> <new>
rem    or: git remote remove <name>
rem    or: git remote set-head <name> (-a | --auto | -d | --delete | <branch>)
rem    or: git remote [-v | --verbose] show [-n] <name>
rem    or: git remote prune [-n | --dry-run] <name>
rem    or: git remote [-v | --verbose] update [-p | --prune] [(<group> | <remote>)...]
rem    or: git remote set-branches [--add] <name> <branch>...
rem    or: git remote get-url [--push] [--all] <name>
rem    or: git remote set-url [--push] <name> <newurl> [<oldurl>]
rem    or: git remote set-url --add <name> <newurl>
rem    or: git remote set-url --delete <name> <url>
rem 
rem     -v, --[no-]verbose    be verbose; must be placed before a subcommand
rem ----------------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
echo Check 1 parametr
if "%1" == "" goto P1_Input
set /p GlobalRepository="%1"
goto Begin1
:P1_Input
set /p GlobalRepository=GlobalRepository:
if "%GlobalRepository%" == "" goto P1_Error
goto Begin1
:P1_Error
echo Parametr GlobalRepository not set
rem -------------------------------------------------------------------

:begin1
echo %GlobalRepository%
git remote -v
git remote set-url origin %GlobalRepository%

git remote -v

:Exit
