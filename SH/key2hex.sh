#!/bin/bash
# -----------------------------------------------
# key2hex.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure GET_KEY ()
#--------------------------------------------------------------------------------
function GET_KEY () {
#beginfunction
    declare K1 K2 K=
    declare -i i
    read -rsn1 K1;read -rsn4 -t 0.001 K2
    if [[ "$K1" != $'\x1b' ]];then
        K2=
    fi
    K1="${K1}${K2}"
    i=${#K1}
    while ((i--));do
        printf -v K2 "%02X" \"${K1:$i:1}\"
        K=${K2}${K} 
    done
    printf "%s" $K
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

    BASHNAME=$0
    echo Start $BASHNAME ...

    clear
    echo "TERMINAL="$TERM
    KEY=1
    while [ "$KEY" != "" ] ; do
        KEY=$(GET_KEY)
        echo $KEY
        # echo -e "\x$KEY"
    done

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
#begin
    MAIN

    read -n 1 -s -r -p $'Press any key to continue ...\n'
#end
#--------------------------------------------------------------------------------
