#
# -------------------------------------------------------------------
# lyrgit_diff_Branch.bat
# ----------------------------------------------------------------------------
# Просмотр изменения, которые у вас есть в вашей рабочей области относительно ветки
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
set /p branch=branch:
if "%branch%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра branch не установлено
goto Exit
# -------------------------------------------------------------------

#:begin
git diff %branch%

#:exit
