#!/bin/bash
# -----------------------------------------------
# user-password-expiry-mail.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN_01 ()
#--------------------------------------------------------------------------------
function MAIN_01 () {
#beginfunction
    SUBJECT="Information About User Password Expiration on "`date`""
    MESSAGE="/tmp/user-expiry.txt"
    MESSAGE1="/tmp/user-expiry-1.txt"
    TO="your_email@domain.com"
    echo "-------------------------------------------------" >> $MESSAGE1
    echo "UserName Количество дней, в течение которых истекает пароль" >> $MESSAGE1
    echo "-------------------------------------------------" >> $MESSAGE1
    for usern in u1 u2 u3 u4
    do
        today=$(date +%s)
        userexpdate=$(chage -l $usern | grep 'Password expires' |cut -d: -f2)
        passexp=$(date -d "$userexpdate" "+%s")
        exp=`expr \( $passexp - $today \)`
        expday=`expr \( $exp / 86400 \)`
        echo "$usern $expday" >> $MESSAGE
    done
    cat $MESSAGE | awk '$2 <= 10' >> $MESSAGE1
    mail -s "$SUBJECT" "$TO" < $MESSAGE1
    rm $MESSAGE
    rm $MESSAGE1
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

