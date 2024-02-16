#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN.sh
# -----------------------------------------------

# -------------------------------------------------------------------
# Каталог журнала: каталог
#     LOG_DIR=
# Файл журнала: имя+расширение
#     LOG_BASEFILENAME=
# Файл журнала: имя
#     LOG_FILENAME=
# Формат имени файлф журнала: FILENAME,DT,...
#     LOG_FILENAME_FORMAT=
# Параметры журнала
#     LOG_OPT=11
# -------------------------------------------------------------------

#====================================================================
PROJECTS='PROJECTS_UNIX'
# -------------------------------------------------------------------
UNAME=$(uname -n)
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
    #echo PROJECTS_DIR: $PROJECTS_DIR
    LIB_SH="$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/$PROJECTS/TOOLS_SH/LIB"
    #echo LIB_SH: $LIB_SH
fi

echo Каталог проектов LYR: $PROJECTS_DIR
echo Каталог библиотеки LYR: $LIB_SH

if [[ ! -d "$LIB_SH" ]] ; then
    echo Каталог библиотеки LYR $LIB_SH не существует...
    exit 1
fi
# -------------------------------------------------------------------
# запуск скриптов БИБЛИОТЕКИ LYR
# -------------------------------------------------------------------
source "$LIB_SH/__SET_LIB.sh"
source "$LIB_SH/LYRFileUtils.sh"
source "$LIB_SH/LYRLog.sh"
source "$LIB_SH/LYRConst.sh"
source "$LIB_SH/LYRDateTime.sh"
source "$LIB_SH/LYRDateTime.txt"
source "$LIB_SH/LYRSupport.sh"
#====================================================================

__SET_VAR_PROJECTS

echo ==================================================================
echo SET %0 ...
echo ==================================================================
# CURRENT_DIR - Текущий каталог
CURRENT_DIR=$(pwd)
echo CURRENT_DIR: $CURRENT_DIR
DIR_SAVE=$CURRENT_DIR
echo DIR_SAVE: $DIR_SAVE
# SH_DIR=D:\TOOLS\TOOLS_BAT
# __SET_BAT_DIR
# __SET_VAR_SCRIPT %0
# __SET_VAR_DEFAULT
# __SET_VAR_PROJECTS
# __SET_CHECK_REPO
# __SET_LOG
# __START_LOG


# -------------------------------------------------------------------
# StartLogFile
# -------------------------------------------------------------------
# StartLogFile "$0" "" ""
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
# StopLogFile
# -------------------------------------------------------------------

exit 0

#:Exit
