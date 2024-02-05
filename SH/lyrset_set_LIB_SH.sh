#!/bin/bash
# -------------------------------------------------------------------
# lyrset_set_LIB_SH.sh
# -------------------------------------------------------------------

#:begin
echo '---------------------------------------------'
echo 'set_LIB_SH'
echo '---------------------------------------------'

case "$UNAME" in
    'ASUS-W10P')
        LIB_SH='/d/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/TOOLS_SH'
        ;;
    'ASUS-U2204-VB')
        LIB_SH='/home/lyr/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/TOOLS_SH'
        ;;
    *)
        echo "Компьютер не определен...!"
        exit 1
        ;;
esac


echo "$LIB_SH"

#:Exit

