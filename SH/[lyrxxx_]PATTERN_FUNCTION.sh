#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN_FUNCTION.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure FUNC_01 ()
#--------------------------------------------------------------------------------
function FUNC_01 () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    AddLog $loALL $INFO Вызов $FUNCNAME ...

    return 0
}
#endfunction

#end
#--------------------------------------------------------------------------------
