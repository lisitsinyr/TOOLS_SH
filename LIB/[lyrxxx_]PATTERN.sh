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

#====================================================================
echo SET $SCRIPT_FULLFILENAME ...
__SET_VAR_DEFAULT 0
__SET_VAR_SCRIPT $SCRIPT_FULLFILENAME
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
# procedure MAIN_SYNTAX ()
#--------------------------------------------------------------------------------
function MAIN_SYNTAX () {
#beginfunction
    echo 'procedure MAIN_SYNTAX ...' >$(tty)

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure MAIN ()
#--------------------------------------------------------------------------------
function MAIN () { #
#beginfunction
    echo 'procedure MAIN ...' >$(tty)

    P1=P1_default
    # Check_P P1 $1
    Check_P P1 TEST
    AddLog $loAll $TEXT P1: $P1
    AddLog $loAll $INFO P1: $P1
    # F=LYRLog.txt
    # AddLogFile $loAll $F

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
DIR_SAVE=$CURRENT_DIR
StartLogFile
MAIN_SYNTAX
MAIN
StopLogFile

#--------------------------------------------------------------------------------
# Выход из сценария
#--------------------------------------------------------------------------------
cd $DIR_SAVE
exit 0
#:Exit
