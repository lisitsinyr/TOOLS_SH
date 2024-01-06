#
# -------------------------------------------------------------------
# lyrgit_diff_Commit_Commit.bat
# ----------------------------------------------------------------------------
# Просмотр изменений между двумя произвольными коммитами
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
set /p Commit_1=Commit_1:
if "%Commit_1%" == "" goto Error_1
goto P2
:Error_1
echo Значение параметра Commit_1 не установлено
goto Exit

# -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p Commit_2=Commit_2:
if "%Commit_2%" == "" goto P2_Error
goto Begin
:P2_Error
echo Значение параметра Commit_2 не установлено
goto Exit
# -------------------------------------------------------------------

#:begin
git diff %Commit_1% %Commit_2%

#:exit
