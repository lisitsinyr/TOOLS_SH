#!/bin/bash
# -----------------------------------------------
# user-password-expiry.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN_01 ()
#--------------------------------------------------------------------------------
function MAIN_01 () {
#beginfunction
    file1=/tmp/user-expiry-1.txt
    file2=/tmp/user-expiry.txt
    echo -------------------------------------------------
    echo UserName Количество дней, в течение которых истекает пароль.
    echo -------------------------------------------------
    for usern in u1 u2 u3 u4
    do
        today=$(date +%s)
        userexpdate=$(chage -l $usern | grep 'Password expires' |cut -d: -f2)
        passexp=$(date -d "$userexpdate" "+%s")
        exp=`expr \( $passexp - $today \)`
        expday=`expr \( $exp / 86400 \)`
        echo "$usern $expday" >> /tmp/user-expiry.txt
    done
    cat /tmp/user-expiry.txt | awk '$2 <= 10' > /tmp/user-expiry-1.txt
    cat /tmp/user-expiry-1.txt | column -t

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

