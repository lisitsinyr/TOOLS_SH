#!/bin/bash
# -------------------------------------------------------------------
# lyrset_set_LIB_SH.sh
# -------------------------------------------------------------------

# Сохраните результат команды в переменной
CURRENT_SYSTEM=$(uname -a)
# echo "CURRENT_SYSTEM: $CURRENT_SYSTEM"
UNAME=$(uname -n)
# echo "UNAME: $UNAME"
USERNAME=$(whoami)
# echo "USERNAME: $USERNAME"

#:begin
echo '---------------------------------------------'
echo 'set_LIB_SH'
echo '---------------------------------------------'

# if [[ "$UNAME" = 'ASUS-W10P' ]] ; then
#     # . /d/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/LYR/LYRFileUtils.sh
#     # lyrset_set_LIB_SH="D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\SCRIPTS\99.[lyr]SET\lyrset_set_LIB_SH.sh"
#     lyrset_set_LIB_SH='/d/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/SCRIPTS/99.[lyr]SET/lyrset_set_LIB_SH.sh'
# else
#     echo "Компьютер не определен..."
#     exit 1
# fi

case "$UNAME" in
    'ASUS-W10P')
        LIB_SH='/d/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/TOOLS_SH/LYR'
        ;;
    'ASUS-U2204-VB')
        LIB_SH='/home/lyr/TOOLS_SH/LYR'
        ;;
    *)
        echo "Компьютер $UNAME не определен...!"
        exit 1
        ;;
esac

echo "Каталог библиотеки: $LIB_SH"

#:Exit

