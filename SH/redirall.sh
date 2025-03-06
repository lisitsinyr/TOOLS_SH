#!/bin/bash
# -----------------------------------------------
# redirall.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure ini ()
#--------------------------------------------------------------------------------
function ini () { echo '

#name    ssh_gate_ip     gate_port  ssh_user  dest_ip         dest_port  lo_port

Filial1  1xx.2xx.2xx.54  13527      u232sr    192.168.1.10    80         8080
Filial2  9y.1yy.1yy.66   13531      u232sr    192.168.1.18    5432       5432
Firma2   1zz.2zz.2zz.53  22         p183975   192.168.1.100   3389       3388

'
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

    declare -i MULTICOLUMN=0
    declare -i COLS=$(echo "cols"|tput -S)
    declare -i NUM=0
    clear
    [[ $MULTICOLUMN -eq 0 ]] && CMD='cat' || CMD='column -x -c$COLS'
    
    #autonum & print list
    ini |awk '!/^#/ && NF {print ++i, $1 }' |eval $CMD
    
    #protection
    declare -i MAX=$(ini |awk '!/^#/ && NF {++i}END{print i}')
    while [[ $NUM -le 0 ]] || [[ $NUM -gt $MAX ]];do
        read -p "select connection number = " NUM
    done

    #get default param for selected num
    read -r NAME GATE_IP GATE_PORT USR DEST_IP DEST_PORT LO_PORT <<< \
    $(ini | awk -v n="$NUM" '!/^#/ && NF {if(++i==n){print $0;exit}}') #'

    clear
    echo -e \\n"Connect to $NAME $GATE_IP"\\n

    #modify param
    read -e -p "DESTINATION_IP   " -i "$DEST_IP"  DEST_IP;echo
    read -e -p "DESTINATION_PORT " -i "$DEST_PORT" DEST_PORT;echo
    read -e -p "LOCAL PORT >1024 " -i "$LO_PORT" LO_PORT
    
    #prompt
    echo -e "127.0.0.1:$LO_PORT ~> $NAME" "$DEST_IP:$DEST_PORT"\\n\\n

    #connect
    #ssh -L ${LO_PORT}:${DEST_IP}:${DEST_PORT} -p ${GATE_PORT} ${USR}@${GATE_IP}

    return 0
}
#endfunction

#begin
    MAIN

    read -n 1 -s -r -p $'Press any key to continue ...\n'
#end


