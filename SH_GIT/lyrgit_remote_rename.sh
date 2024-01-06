#
# -------------------------------------------------------------------
# lyrgit_remote_rename.bat
# ----------------------------------------------------------------------------
# Переименование удаленных репозитариев (по существу переименование локальной ссылки на удаленный репозитарий)
# ----------------------------------------------------------------------------
# usage: git remote [-v | --verbose]
#    or: git remote add [-t <branch>] [-m <master>] [-f] [--tags | --no-tags] [--mirror=<fetch|push>] <name> <url>
#    or: git remote rename [--[no-]progress] <old> <new>
#    or: git remote remove <name>
#    or: git remote set-head <name> (-a | --auto | -d | --delete | <branch>)
#    or: git remote [-v | --verbose] show [-n] <name>
#    or: git remote prune [-n | --dry-run] <name>
#    or: git remote [-v | --verbose] update [-p | --prune] [(<group> | <remote>)...]
#    or: git remote set-branches [--add] <name> <branch>...
#    or: git remote get-url [--push] [--all] <name>
#    or: git remote set-url [--push] <name> <newurl> [<oldurl>]
#    or: git remote set-url --add <name> <newurl>
#    or: git remote set-url --delete <name> <url>
# 
#     -v, --[no-]verbose    be verbose; must be placed before a subcommand
# ----------------------------------------------------------------------------
#

# -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto P2
:P1_Input
set /p Repository_old=Repository_old:
if "%Repository_old%" == "" goto P1_Error
goto P2
:P1_Error
echo Значение параметра Repository_old не установлено
goto Exit
# -------------------------------------------------------------------

# -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p Repository_new=Repository_new:
if "%Repository_new%" == "" goto P2_Error
goto Begin
:P2_Error
echo Значение параметра Repository_new не установлено
goto Exit
# -------------------------------------------------------------------

#:begin
git remote rename %Repository_old% %Repository_new%

#:exit
