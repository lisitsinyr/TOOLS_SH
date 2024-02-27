#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN_FUNC.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure FUNC_01 ()
#--------------------------------------------------------------------------------
function FUNC_01 () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    AddLog $loAll $INFO Вызов FUNC_01 ...

    return 0
}
#endfunction
