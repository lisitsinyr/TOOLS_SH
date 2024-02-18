#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN.sh
# -----------------------------------------------

# -------------------------------------------------------------------
# PROJECTS - проект
PROJECTS='PROJECTS_UNIX'
# -------------------------------------------------------------------
# SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
SCRIPT_FULLFILENAME=$0
# echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
# -------------------------------------------------------------------
# PROJECTS_LYR_DIR - каталог проектов
# -------------------------------------------------------------------
# PROJECTS_DIR - каталог проекта
# -------------------------------------------------------------------
# SCRIPTS_DIR - каталог скриптов
# -------------------------------------------------------------------
# LIB_SH - каталог библиотеки скриптов
# -------------------------------------------------------------------
UNAME=$(uname -n)
if [[ -z "$LIB_SH" ]] ; then
    case "$UNAME" in
        'ASUS-W10P')
            PROJECTS_LYR_DIR='/d/PROJECTS_LYR'
            SCRIPTS_DIR='/d/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SH'
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2310-VB' | 'ASUS-U2310-VB' | 'ASUS-U2310')
            PROJECTS_LYR_DIR='/home/lyr/PROJECTS_LYR'
            SCRIPTS_DIR='/home/lyr/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SH'
            ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac
    PROJECTS_DIR="$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/$PROJECTS"
    LIB_SH="$SCRIPTS_DIR/LIB"
fi
#echo PROJECTS_LYR_DIR: $PROJECTS_LYR_DIR
#echo PROJECTS_DIR: $PROJECTS_DIR
#echo SCRIPTS_DIR: $SCRIPTS_DIR
#echo LIB_SH: $LIB_SH
if [[ ! -d "$LIB_SH" ]] ; then
    echo ERROR: Каталог библиотеки LYR $LIB_SH не существует...
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
source "$LIB_SH/LYRSupport.sh"
#====================================================================

echo ==================================================================
echo SET $SCRIPT_FULLFILENAME ...
echo ==================================================================
__SET_VAR_SCRIPT $SCRIPT_FULLFILENAME
__SET_VAR_DEFAULT
__SET_VAR_PROJECTS
__SET_CHECK_REPO
# -------------------------------------------------------------------
# LOG_DT_FORMAT -
LOG_DT_FORMAT=
# -------------------------------------------------------------------
# LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
LOG_FILENAME_FORMAT=
# -------------------------------------------------------------------
# LOG_FILE_ADD - Параметры журнала [1]
LOG_FILE_ADD=1
# -------------------------------------------------------------------
# LOG_FILE_DT - Параметры журнала [0]
LOG_FILE_DT=0
# -------------------------------------------------------------------
# LOG_DIR - Каталог журнала [каталог]
LOG_DIR=
# -------------------------------------------------------------------
# LOG_FILENAME - Файл журнала [имя]
LOG_FILENAME=

__SET_LOG

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
function MAIN_01 { #
#beginfunction
    echo MAIN_01, hello!
    return 0
}
#endfunction

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
function MAIN { #
#beginfunction
    echo MAIN, hello!
    MAIN_01
    return 0
}
#endfunction

# -------------------------------------------------------------------
# StartLogFile
# -------------------------------------------------------------------
# StartLogFile "$0" "" ""
# -------------------------------------------------------------------

#echo ================================================================= >> $LOG_FULLFILENAME
#echo START $SCRIPT_BASEFILENAME ... >> $LOG_FULLFILENAME
#echo ================================================================== >> $LOG_FULLFILENAME
# CURRENT_DIR - Текущий каталог
CURRENT_DIR=$(pwd)
echo CURRENT_DIR: $CURRENT_DIR
DIR_SAVE=$CURRENT_DIR
echo DIR_SAVE: $DIR_SAVE

MAIN

#echo ================================================================= >> $LOG_FULLFILENAME
#echo STOP $SCRIPT_BASEFILENAME ... >> $LOG_FULLFILENAME
#echo ================================================================== >> $LOG_FULLFILENAME

cd $DIR_SAVE

# -------------------------------------------------------------------
# StopLogFile
# -------------------------------------------------------------------
# StopLogFile
# -------------------------------------------------------------------

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

exit 0

#:Exit
