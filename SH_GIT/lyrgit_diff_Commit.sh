#
# -------------------------------------------------------------------
# lyrgit_diff_Commit.bat
# ----------------------------------------------------------------------------
# Просмотр изменения, которые у вас есть в вашей рабочей области относительно коммита
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
if "%Commit%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра Commit не установлено
goto Exit
# -------------------------------------------------------------------

#:begin
git diff %Commit%

#:exit
