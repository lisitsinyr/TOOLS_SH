#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN_EMPTY.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure LYRConst ()
#--------------------------------------------------------------------------------
function PATTERN_EMPTY () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    AddLog $loAll $INFO Вызов PATTERN_EMPTY ...

    return 0
}
#endfunction
