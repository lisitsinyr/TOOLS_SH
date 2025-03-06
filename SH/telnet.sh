#!/bin/bash
# -----------------------------------------------
# telnet.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN_01 ()
#--------------------------------------------------------------------------------
function MAIN_01 () {
    set -x
    
    #Входные данные:
    USER="admin"
    PASSWD="123456"
    LOG="telnnet_conn.log"
    HOSTS="
    192.168.10.10
    192.168.10.12
    192.168.10.11
    "
    
    for H in $HOSTS
    do
        echo START SCRIPT: >> $LOG
        date +%x-%R >> $LOG
        (
        sleep 1;
        echo -en "$USER\r";
        sleep 1;
        echo -en "$PASSWD\r";
        sleep 1;
        echo -en "show ver | include IOS\r";
        sleep 1;
        echo -en "exit\r";
        sleep 1;
        ) | telnet $H >> $LOG
        echo =================================== >> $LOG
    done
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

    MAIN_01

    return 0
}
#endfunction

#begin
    MAIN

    read -n 1 -s -r -p $'Press any key to continue ...\n'
#end

