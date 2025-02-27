#!/bin/bash
# -----------------------------------------------
# tits.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure TITS ()
#--------------------------------------------------------------------------------
function TITS () {
  declare N P T=${1:-21}
  case "${T:0:1}" in
    1) N='(.)';;
    2) N='(o)';;
    *) N='(*)';;
  esac
  case "${T:1:1}" in
    1) P=${N}${N}' ';;
    2) P=${N}' '${N};;
    *) P=' '${N}${N};;
  esac
  echo -n "$P"
}

#--------------------------------------------------------------------------------
# procedure MAIN ()
#--------------------------------------------------------------------------------
function MAIN () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    BASHNAME=$0
    echo Start $BASHNAME ...

    declare -r LOG=$(mktemp)
    declare -r BS='\b\b\b\b\b\b\b'
    declare -r SPC='       '
    trap 'echo
        tput cnorm
        test -f "$LOG" && cat "$LOG" && rm "$LOG"
        exit ' INT TERM HUP QUIT EXIT ERR
    tput civis
    CMD="$@"
    test -z "$CMD" && CMD='sleep 10'

    $CMD > "$LOG" 2>&1 &
    PID=$!
    echo -n "$SPC"
    while :;do
        for i in 21 12 23 33 23 12 21 31;do
            echo -en $BS 
            TITS  $i
            ps -q "$PID" > /dev/null 2>&1 ||  exit
            sleep .3
        done
    done

    return 0
}
#endfunction

#begin
    MAIN

    read -n 1 -s -r -p $'Press any key to continue ...\n'
#end

