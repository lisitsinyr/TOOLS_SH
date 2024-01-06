#
# -------------------------------------------------------------------
# lyrgit_diff_Commit_cached.bat
# ----------------------------------------------------------------------------
# Просмотрите внесенные вами изменения по сравнению с последней фиксацией
# ----------------------------------------------------------------------------
# git diff [<options>] [<commit>] [--] [<path>...]
# git diff [<options>] --cached [--merge-base] [<commit>] [--] [<path>...]
# git diff [<options>] [--merge-base] <commit> [<commit>...] <commit> [--] [<path>...]
# git diff [<options>] <commit>...<commit> [--] [<path>...]
# git diff [<options>] <blob> <blob>
# git diff [<options>] --no-index [--] <path> <path>
# ----------------------------------------------------------------------------
#

# -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p Commit=Commit:
if "%Commit%" == "" goto Begin1
goto Begin2
# :P1_Error
# echo Значение параметра Commit не установлено
# goto Exit
# -------------------------------------------------------------------

#:begin1
git diff --cached
goto Exit

#:begin2
git diff --cached %Commit%
goto Exit

#:exit
