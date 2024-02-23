#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN.sh
# -----------------------------------------------

# -----------------------------------------------
# procedure MAIN_INIT (FULLFILENAME, DEBUG)
# -----------------------------------------------
function MAIN_INIT () {
#beginfunction
    # -------------------------------------------------------------------
    # DEBUG 1-включить DEBUG 0-выключить DEBUG
    DEBUG=$2
    #echo DEBUG: $DEBUG
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # -------------------------------------------------------------------
    # PROJECTS - проект
    PROJECTS='PROJECTS_UNIX'
    # -------------------------------------------------------------------
    # SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    SCRIPT_FULLFILENAME=$1
    #echo SCRIPT_FULLFILENAME: $SCRIPT_FULLFILENAME
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

    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_SET ()
# -----------------------------------------------
function MAIN_SET () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    __SET_VAR_DEFAULT $DEBUG
    __SET_VAR_SCRIPT "$SCRIPT_FULLFILENAME"
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

    return 0
}
#beginfunction

#--------------------------------------------------------------------------------
# procedure MAIN_CHECK_PARAMETR ()
#--------------------------------------------------------------------------------
function MAIN_CHECK_PARAMETR () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    P1=P1_default
    #Check_P P1 $1

    Check_P P1 TEST
    AddLog $loAll $TEXT P1: $P1
    AddLog $loAll $INFO P1: $P1

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure MAIN_SYNTAX ()
#--------------------------------------------------------------------------------
function MAIN_SYNTAX () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure MAIN ()
#--------------------------------------------------------------------------------
function MAIN () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
    MAIN_INIT "$0" 0
    MAIN_SET
    StartLogFile
    #DIR_SAVE=$CURRENT_DIR
    #MAIN_CHECK_PARAMETR
    #MAIN_SYNTAX
    MAIN
    StopLogFile
    #cd $DIR_SAVE

exit 0
#--------------------------------------------------------------------------------
