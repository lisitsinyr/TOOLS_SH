#!/bin/bash
# -----------------------------------------------
# validate_ip.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure validate_ip ()
#--------------------------------------------------------------------------------
function validate_ip () () {
#beginfunction
    local ip=$1
    local stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi

    return $stat
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

    echo -n "Enter IPv4 address: "
    read ip_address

    if validate_ip $ip_address; then
        echo "${ip_address} is a valid IPv4 address."
    else
        echo "${ip_address} is a invalid IPv4 address."
    fi

    return 0
}
#endfunction

#begin
    MAIN

    read -n 1 -s -r -p $'Press any key to continue ...\n'
#end


