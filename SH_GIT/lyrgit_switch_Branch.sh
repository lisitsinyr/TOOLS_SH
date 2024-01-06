#
# -------------------------------------------------------------------
# lyrgit_switch_Branch.bat
# ----------------------------------------------------------------------------
# Переключает ветви, обновляя индекс и рабочую область
# ----------------------------------------------------------------------------
# usage: git switch [<options>] [<branch>]
# 
#     -c, --[no-]create <branch>
#                           create and switch to a new branch
#     -C, --[no-]force-create <branch>
#                           create/reset and switch to a branch
#     --[no-]guess          second guess 'git switch <no-such-branch>'
#     --[no-]discard-changes
#                           throw away local modifications
#     -q, --[no-]quiet      suppress progress reporting
#     --[no-]recurse-submodules[=<checkout>]
#                           control recursive updating of submodules
#     --[no-]progress       force progress reporting
#     -m, --[no-]merge      perform a 3-way merge with the new branch
#     --[no-]conflict <style>
#                           conflict style (merge, diff3, or zdiff3)
#     -d, --[no-]detach     detach HEAD at named commit
#     -t, --[no-]track[=(direct|inherit)]
#                           set branch tracking configuration
#     -f, --[no-]force      force checkout (throw away local modifications)
#     --[no-]orphan <new-branch>
#                           new unparented branch
#     --[no-]overwrite-ignore
#                           update ignored files (default)
#     --[no-]ignore-other-worktrees
#                           do not check if another worktree is holding the given ref
# ----------------------------------------------------------------------------
#

# -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p branch=branch:
if "%branch%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра branch не установлено
goto Exit
# -------------------------------------------------------------------

#:begin
git switch %branch%

#:exit
