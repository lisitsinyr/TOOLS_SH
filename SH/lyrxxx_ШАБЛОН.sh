#!/bin/bash
# -----------------------------------------------
# lyrxxx_ШАБЛОН.sh
# -----------------------------------------------

#====================================================================
PROJECTS='PROJECTS_UNIX'
# -------------------------------------------------------------------
CURRENT_SYSTEM=$(uname -a)
UNAME=$(uname -n)
USERNAME=$(whoami)
# -------------------------------------------------------------------
# БИБЛИОТЕКА LYR
# -------------------------------------------------------------------
UNAME=$(uname -n)
if [[ -z "$LIB_SH" ]] ; then
    case "$UNAME" in
        'ASUS-W10P')
            PROJECTS_LYR_DIR='/d/PROJECTS_LYR'
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2310-VB' | 'ASUS-U2310-VB' | 'ASUS-U2310')
            PROJECTS_LYR_DIR='/home/lyr/PROJECTS_LYR'
            ;;
        *)
            echo "Компьютер не определен...!"
            exit 1
            ;;
    esac
    PROJECTS_DIR="$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/$PROJECTS"
    LIB_SH="$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/$PROJECTS/LIB"
fi
# echo "Каталог проектов LYR: $PROJECTS_DIR"
# echo "Каталог библиотеки LYR: $LIB_SH"
if [[ ! -d "$LIB_SH" ]] ; then
    echo 'Каталог библиотеки LYR'"$LIB_SH"' не существует...'
    exit 1
fi
# -------------------------------------------------------------------
# запуск скриптов БИБЛИОТЕКИ LYR
# -------------------------------------------------------------------
source "$LIB_SH/LYRFileUtils.sh"
source "$LIB_SH/LYRLog.sh"
source "$LIB_SH/LYRConst.sh"
source "$LIB_SH/LYRDateTime.sh"
source "$LIB_SH/LYRDateTime.txt"
source "$LIB_SH/LYRSupport.sh"
#====================================================================

# -------------------------------------------------------------------
# StartLogFile
# -------------------------------------------------------------------
StartLogFile "$0" "" ""
# -------------------------------------------------------------------

#:begin
#=================================================
# AddLog $loAll $NOTSET 'NOTSET'
# AddLog $loAll $DEBUG 'DEBUG'
# AddLog $loAll $INFO 'INFO'
# AddLog $loAll $WARNING 'WARNING'
# AddLog $loAll $ERROR 'ERROR'
# AddLog $loAll $CRITICAL 'CRITICAL'
# AddLog $loAll $DEBUGTEXT 'DEBUGTEXT'
# AddLog $loAll $BEGIN 'BEGIN'
# AddLog $loAll $END 'END'
# AddLog $loAll $PROCESS 'PROCESS'
# AddLog $loAll $TEXT 'TEXT'
#=================================================

#=================================================
# AddLog $loAll $TEXT '--------------------------------------'
# str=''
# str=""
# result=$('')
# AddLog $loAll $TEXT 'str:'"$str"
# AddLog $loAll $TEXT 'result:'"$result"
# AddLog $loAll $TEXT '--------------------------------------'
#=================================================
#:end

# -------------------------------------------------------------------
# StopLogFile
# -------------------------------------------------------------------
StopLogFile
# -------------------------------------------------------------------

exit 0

#:Exit
