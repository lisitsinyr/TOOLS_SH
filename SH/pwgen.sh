#!/bin/bash
# -----------------------------------------------
# pwgen.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN_01 ()
#--------------------------------------------------------------------------------
function MAIN_01 () {
#beginfunction
    declare -r PWGEN_OPT='-1 --symbols --ambiguous --capitalize'
    declare -r PASSLEN=15
    declare -r PASSNUM=5
    declare -r KEYFILE=${0%/*}/'1.jpg'
    declare -l HIDDENMOD=0
    declare -r PWGEN=$(which pwgen)
    declare LOGIN
    declare MOD MOD1

    if [[ ! "$PWGEN" ]];then
        echo pwgen not installed
        exit 1
    fi
    if [[ ! -s "$KEYFILE" ]];then
        echo keyfile "$KEYFILE" not found
        exit 2
    fi
    read -p "Input login:" LOGIN
    if [[ "1y" =~ "$HIDDENMOD" ]];then
        read -s -p "Input modificator:" MOD;echo
        read -s -p "Confirm modificator:" MOD1;echo
        if [[ "$MOD" != "$MOD1" ]];then
            echo "Modificator not confirmed"
            exit 3
        fi
    else
        read -p "Input modificator:" MOD;echo
    fi
    echo pwgen options: $PWGEN_OPT
    echo  "Login: $LOGIN" 
    $PWGEN $PWGEN_OPT  -H"${KEYFILE}#${LOGIN}${MOD}" $PASSLEN $PASSNUM
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

    MAIN_01

    return 0
}
#endfunction

#begin
    MAIN

    read -n 1 -s -r -p $'Press any key to continue ...\n'
#end

