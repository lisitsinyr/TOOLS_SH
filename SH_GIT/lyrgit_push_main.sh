#!/bin/bash
# -----------------------------------------------
# lyrgit_push_main.sh.sh
# -----------------------------------------------

# -----------------------------------------------
# 01.MAIN_INIT ()
# -----------------------------------------------
function MAIN_INIT () {
#beginfunction
    #echo DEBUG: $DEBUG
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # -------------------------------------------------------------------
    # SCRIPTS_DIR - каталог скриптов
    # -------------------------------------------------------------------
    UNAME=$(uname -n)
    echo UNAME:$UNAME
    case "$UNAME" in
        'ASUS-W10P')
            PROJECTS_LYR_ROOT=/d
            PROJECTS_LYR_ROOT=/d/WORK/UBU
            PROJECTS_LYR_DIR=$PROJECTS_LYR_ROOT/PROJECTS_LYR
            SCRIPTS_DIR=$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
            SCRIPTS_DIR=/d/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM' | 'ASUS-U2310')
            PROJECTS_LYR_ROOT=/home/lyr
            PROJECTS_LYR_DIR=$PROJECTS_LYR_ROOT/PROJECTS_LYR
            SCRIPTS_DIR=$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
        ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac
    echo PROJECTS_LYR_ROOT:$PROJECTS_LYR_ROOT
    echo PROJECTS_LYR_DIR:$PROJECTS_LYR_DIR
    echo SCRIPTS_DIR:$SCRIPTS_DIR

    # -------------------------------------------------------------------
    # LIB_SH - каталог библиотеки скриптов
    # -------------------------------------------------------------------
    if [[ -z "$LIB_SH" ]] ; then
        LIB_SH="$SCRIPTS_DIR/LIB"
        echo LIB_SH: $LIB_SH
    fi
    if [[ ! -d "$LIB_SH" ]] ; then
        echo ERROR: Каталог библиотеки LYR $LIB_SH не существует...
        exit 1
    fi

    # -------------------------------------------------------------------
    # запуск скриптов БИБЛИОТЕКИ LYR
    # -------------------------------------------------------------------
    source "$LIB_SH/LYRFileUtils.sh"
    source "$LIB_SH/LYRConst.sh"
    source "$LIB_SH/LYRLog.sh"
    source "$LIB_SH/LYRConst.sh"
    source "$LIB_SH/LYRDateTime.sh"
    source "$LIB_SH/LYRSupport.sh"
    source "$LIB_SH/LYRParserINI.sh"
    source "$LIB_SH/LUConsole.sh"

    #PressAnyKey

    return 0
}
#endfunction

# -----------------------------------------------
# 02.MAIN_SET ()
# -----------------------------------------------
function MAIN_SET () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# 03.MAIN_CHECK_PARAMETR ()
#--------------------------------------------------------------------------------
function MAIN_CHECK_PARAMETR () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # -------------------------------------
    # OPTION
    # -------------------------------------
    O1=O1_default
    PN_CAPTION=O1
    Read_P O1 O1
    echo O1:$O1
    #AddLog $loAll $tlsTEXT O1:$O1
    #AddLog $loAll $tlsINFO O1:$O1
    if [[ ! -z "$O1" ]] ; then
        OPTION="$OPTION --O1 $O1"
    else
        echo INFO: O1 not defined ...
    fi

    # -------------------------------------
    # ARGS
    # -------------------------------------
    # Проверка на обязательные аргументы
    Comment="Git Bash commit update"
    #Comment=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    Comment=$(YYYYMMDDHHMMSS)
    PN_CAPTION=Comment
    Read_P Comment "$Comment"
    echo Comment:$Comment
    #AddLog $loAll $tlsTEXT Comment:$Comment
    #AddLog $loAll $INFO Comment:$Comment
    if [[ ! -z "$Comment" ]] ; then
        ARGS="$ARGS $Comment"
    else
        echo ERROR: Comment not defined ...
        OK=
    fi

    #PressAnyKey

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# 04.MAIN_FUNC ()
#--------------------------------------------------------------------------------
function MAIN_FUNC {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    AddLog $loAll $tlsTEXT '--------------------------------------'
    AddLog $loAll $tlsTEXT 'MAIN_FUNC ...'
    AddLog $loAll $tlsTEXT '--------------------------------------'

    # -------------------------------------------------------------------
    # запуск скриптов
    # -------------------------------------------------------------------
    echo ---------------------------------------------------------------
    echo ...git add --all
    echo ---------------------------------------------------------------
    git add --all
    
    echo ---------------------------------------------------------------
    echo ...git commit -m "$Comment"
    echo ---------------------------------------------------------------
    git commit -m "$Comment"

    echo ---------------------------------------------------------------
    echo ...git push -u origin main
    echo ---------------------------------------------------------------
    git push -u origin main

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

    BATNAME=$0
    echo Start $BATNAME ...

    DEBUG=0

    # -------------------------------------------------------------------
    # 01.MAIN_INIT
    # SCRIPTS_DIR - Каталог скриптов
    # LIB_BAT - каталог библиотеки скриптов
    # SCRIPTS_DIR_KIX - Каталог скриптов KIX
    # -------------------------------------------------------------------
    MAIN_INIT

    # Количество аргументов
    Read_N
    echo Read_N:$Read_N

    SET_LIB "$0"

    #echo CURRENT_DIR:$CURRENT_DIR
    #echo SCRIPT_FULLFILENAME:$SCRIPT_FULLFILENAME
    #PressAnyKey

    StartLogFile

    OK=yes
    # -------------------------------------------------------------------
    # 02.MAIN_SET
    # -------------------------------------------------------------------
    MAIN_SET

    # -------------------------------------------------------------------
    # 03.MAIN_CHECK_PARAMETR
    # -------------------------------------------------------------------
    if [[ ! -z "$OK" ]] ; then #if defined OK if not defined Read_N (
        MAIN_CHECK_PARAMETR
    fi

    OK=yes
    # -------------------------------------------------------------------
    # 04.MAIN_FUNC
    # -------------------------------------------------------------------
    if [[ ! -z "$OK" ]] ; then
        MAIN_FUNC
        #Pause "$SLEEP"
        #PressAnyKey
    fi

    StopLogFile

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
#begin
    MAIN
#end
#--------------------------------------------------------------------------------
