#
# -------------------------------------------------------------------
# lyrgit_reset_remote_branch.bat
# ----------------------------------------------------------------------------
# Сбросьте локальное репо и рабочее дерево, чтобы они соответствовали ветке удаленного отслеживания [git reset %remote% %branch%]
# ----------------------------------------------------------------------------
# usage: git reset [--mixed | --soft | --hard | --merge | --keep] [-q] [<commit>]
#    or: git reset [-q] [<tree-ish>] [--] <pathspec>...
#    or: git reset [-q] [--pathspec-from-file [--pathspec-file-nul]] [<tree-ish>]
#    or: git reset --patch [<tree-ish>] [--] [<pathspec>...]
#    or: DEPRECATED: git reset [-q] [--stdin [-z]] [<tree-ish>]
# 
#     -q, --[no-]quiet      be quiet, only report errors
#     --no-refresh          skip refreshing the index after reset
#     --refresh             opposite of --no-refresh
#     --mixed               reset HEAD and index
#     --soft                reset only HEAD
#     --hard                reset HEAD, index and working tree
#     --merge               reset HEAD, index and working tree
#     --keep                reset HEAD but keep local changes
#     --[no-]recurse-submodules[=<reset>]
#                           control recursive updating of submodules
#     -p, --[no-]patch      select hunks interactively
#     -N, --[no-]intent-to-add
#                           record only the fact that removed paths will be added later
#     --[no-]pathspec-from-file <file>
#                           read pathspec from file
#     --[no-]pathspec-file-nul
#                           with --pathspec-from-file, pathspec elements are separated with NUL character
#     -z                    DEPRECATED (use --pathspec-file-nul instead): paths are separated with NUL character
#     --[no-]stdin          DEPRECATED (use --pathspec-from-file=- instead): read paths from <stdin>
# ----------------------------------------------------------------------------"
#

# -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p remote=remote:
if "%remote%" == "" goto Error_1
goto P2
:Error_1
echo Значение параметра remote не установлено
goto Exit

# -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p branch=branch:
if "%branch%" == "" goto P2_Error
goto Begin
:P2_Error
echo Значение параметра branch не установлено
goto Exit
# -------------------------------------------------------------------

#:begin
git reset %remote% %branch%

#:exit
