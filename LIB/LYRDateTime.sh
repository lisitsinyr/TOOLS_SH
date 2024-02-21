#!/bin/bash
# -----------------------------------------------
# LYRDateTime.sh
# -----------------------------------------------

#:begin
# echo '01.НАЗВАНИЕ'
# echo '    *** - ***'

# echo '02.СИНТАКСИС'
# echo '    *** [параметры] ***'

# echo '03.ОПИСАНИЕ'
# echo '    ***'

#--------------------------------------------------------------------------------
# procedure LYRDateTime ()
#--------------------------------------------------------------------------------
function LYRDateTime () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: LYRDateTime ... >$(tty)
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function YYYYMMDDHHMMSS ()
#--------------------------------------------------------------------------------
function YYYYMMDDHHMMSS () {
#beginfunction
    printf "%(%Y%m%d%H%M%S)T"

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function DateTime (FORMAT)
#--------------------------------------------------------------------------------
function DateTime () {
#beginfunction
    FORMAT="$1"
    printf "%($FORMAT)T"

    return 0
}
#endfunction

#:Exit
