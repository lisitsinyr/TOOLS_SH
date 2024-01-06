#
# -------------------------------------------------------------------
# lyrgit_remote_show_GlobalRepository.bat
# ----------------------------------------------------------------------------
# Инспекция удаленного репозитария
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
goto P1_Error
:P1_Input
set /p GlobalRepository=GlobalRepository:
if "%GlobalRepository%" == "" goto P1_Error
goto Begin1
:P1_Error
echo Значение параметра GlobalRepository не установлено
goto Exit
# -------------------------------------------------------------------

#:begin1
git remote show %GlobalRepository%

#:exit
