#
# -------------------------------------------------------------------
# lyrgit_mv.bat
# ----------------------------------------------------------------------------
# Переместить или переименовать файл, каталог или символическую ссылку
# ----------------------------------------------------------------------------
# usage: git mv [<options>] <source>... <destination>
# 
#     -v, --[no-]verbose    be verbose
#     -n, --[no-]dry-run    dry run
#     -f, --[no-]force      force move/rename even if target exists
#     -k                    skip move/rename errors
#     --[no-]sparse         allow updating entries outside of the sparse-checkout cone
# ----------------------------------------------------------------------------
#

# -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p source=source:
if "%source%" == "" goto Error_1
goto P2
:Error_1
echo Значение параметра source не установлено
goto Exit

# -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p destination=destination:
if "%destination%" == "" goto P2_Error
goto Begin
:P2_Error
echo Значение параметра не установлено
goto Exit
# -------------------------------------------------------------------

#:begin
git mv %source% %destination%

#:exit
