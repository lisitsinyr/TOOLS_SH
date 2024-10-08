#!/bin/bash
# -----------------------------------------------
# LYRINIT.sh
# -----------------------------------------------

# =================================================
# ФУНКЦИИ
# =================================================

#--------------------------------------------------------------------------------
# procedure LYRINIT ()
#--------------------------------------------------------------------------------
function LYRINIT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
#begin
    if [[ -z $INIT_LIB ]] ; then
        # -------------------------------------------------------------------
        # запуск скриптов БИБЛИОТЕКИ LYR
        # -------------------------------------------------------------------
        source "$LIB_SH/LYRConst.sh"
        source "$LIB_SH/LYRFileUtils.sh"
        source "$LIB_SH/LYRLog.sh"
        source "$LIB_SH/LYRConst.sh"
        source "$LIB_SH/LYRDateTime.sh"
        source "$LIB_SH/LYRSupport.sh"
        source "$LIB_SH/LYRParserINI.sh"
        source "$LIB_SH/LYRConsole.sh"
        SET_LIB "$1"

        INIT_LIB=1
    fi

#end
#--------------------------------------------------------------------------------
