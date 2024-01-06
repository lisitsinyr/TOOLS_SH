#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_remote_set-url_origin.bat
# ----------------------------------------------------------------------------
# 
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

#:begin
echo "-----------------------------------------------------"
echo " git remote set-url origin %GlobalRepository%            "
echo "-----------------------------------------------------"
echo "Check 1 parametr"
if [ -n "$1" ]; then
    GlobalRepository=$1
else
    GlobalRepository=""
    read -p "GlobalRepository: " GlobalRepository
fi
if [ -z GlobalRepository ]; then
   echo "Parametr GlobalRepository not set"
fi

if [ ! -z $GlobalRepository ]; then
    git remote -v
    git remote set-url origin $GlobalRepository
    git remote -v
fi

#:exit