#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_branch_Oldbranch_Newbranch_m.bat
# ----------------------------------------------------------------------------
# Переименовать ветку
# ----------------------------------------------------------------------------
# usage: git branch [<options>] [-r | -a] [--merged] [--no-merged]
#    or: git branch [<options>] [-f] [--recurse-submodules] <branch-name> [<start-point>]
#    or: git branch [<options>] [-l] [<pattern>...]
#    or: git branch [<options>] [-r] (-d | -D) <branch-name>...
#    or: git branch [<options>] (-m | -M) [<old-branch>] <new-branch>
#    or: git branch [<options>] (-c | -C) [<old-branch>] <new-branch>
#    or: git branch [<options>] [-r | -a] [--points-at]
#    or: git branch [<options>] [-r | -a] [--format]
# 
# Generic options
#     -v, --[no-]verbose    show hash and subject, give twice for upstream branch
#     -q, --[no-]quiet      suppress informational messages
#     -t, --[no-]track[=(direct|inherit)]
#                           set branch tracking configuration
#     -u, --[no-]set-upstream-to <upstream>
#                           change the upstream info
#     --[no-]unset-upstream unset the upstream info
#     --[no-]color[=<when>] use colored output
#     -r, --remotes         act on remote-tracking branches
#     --contains <commit>   print only branches that contain the commit
#     --no-contains <commit>
#                           print only branches that don't contain the commit
#     --[no-]abbrev[=<n>]   use <n> digits to display object names
# 
# Specific git-branch actions:
#     -a, --all             list both remote-tracking and local branches
#     -d, --[no-]delete     delete fully merged branch
#     -D                    delete branch (even if not merged)
#     -m, --[no-]move       move/rename a branch and its reflog
#     -M                    move/rename a branch, even if target exists
#     --[no-]omit-empty     do not output a newline after empty formatted refs
#     -c, --[no-]copy       copy a branch and its reflog
#     -C                    copy a branch, even if target exists
#     -l, --[no-]list       list branch names
#     --[no-]show-current   show current branch name
#     --[no-]create-reflog  create the branch's reflog
#     --[no-]edit-description
#                           edit the description for the branch
#     -f, --[no-]force      force creation, move/rename, deletion
#     --merged <commit>     print only branches that are merged
#     --no-merged <commit>  print only branches that are not merged
#     --[no-]column[=<style>]
#                           list branches in columns
#     --[no-]sort <key>     field name to sort on
#     --[no-]points-at <object>
#                           print only branches of the object
#     -i, --[no-]ignore-case
#                           sorting and filtering are case insensitive
#     --[no-]recurse-submodules
#                           recurse through submodules
#     --[no-]format <format>
#                           format to use for the output
# --------------------------------------------------------------------------------------

#begin
    echo '--------------------------------------------------'
    echo ' git branch -m $OldBranch $NewBranch'
    echo '--------------------------------------------------'
    echo 'Check 1 parametr'
    if [ -n "$1" ]; then
        OldBranch="$1"
    else
        OldBranch=""
        read -p "OldBranch: " OldBranch
    fi
    if [ -z "$Remote" ]; then
       echo 'Parametr $OldBranch not specified'
    fi
    echo 'Check 2 parametr'
    if [ -n "$2" ]; then
        NewBranch="$2"
    else
        NewBranch=""
        read -p "Newbranch: " NewBranch
    fi
    if [ -z "$NewBranch" ]; then
       echo 'Parametr $NewBranch not specified'
    fi

    if [ ! -z "$OldBranch" && ! -z "$NewBranch" ]; then
        git branch -m "$OldBranch" "$NewBranch"
    fi

    exit 0
#end
