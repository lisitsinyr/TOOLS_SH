#
# -------------------------------------------------------------------
# lyrgit_rm_FileName.bat
# ----------------------------------------------------------------------------
# Удаление файла из отслеживаемых Git, а так же его физическое удаление из рабочего каталога
# ----------------------------------------------------------------------------
# usage: git rm [-f | --force] [-n] [-r] [--cached] [--ignore-unmatch]
#               [--quiet] [--pathspec-from-file=<file> [--pathspec-file-nul]]
#               [--] [<pathspec>...]
# 
#     -n, --[no-]dry-run    dry run
#     -q, --[no-]quiet      do not list removed files
#     --[no-]cached         only remove from the index
#     -f, --[no-]force      override the up-to-date check
#     -r                    allow recursive removal
#     --[no-]ignore-unmatch exit with a zero status even if nothing matched
#     --[no-]sparse         allow updating entries outside of the sparse-checkout cone
#     --[no-]pathspec-from-file <file>
#                           read pathspec from file
#     --[no-]pathspec-file-nul
#                           with --pathspec-from-file, pathspec elements are separated with NUL character
# ----------------------------------------------------------------------------
#

# -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p FileName=FileName:
if "%FileName%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра FileName не установлено
goto Exit
# -------------------------------------------------------------------

#:begin
git rm %FileName%

#:exit
