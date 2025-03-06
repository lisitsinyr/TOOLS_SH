#!/bin/bash
# -----------------------------------------------
# backup.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN_01 ()
#--------------------------------------------------------------------------------
function MAIN_01 () {
#beginfunction
    backup_dirs=("/etc" "/home" "/boot")
    dest_dir="/backup"
    dest_server="server1"
    backup_date=$(date +%b-%d-%y)

    echo "Starting backup of: ${backup_dirs[@]}"

    for i in "${backup_dirs[@]}"; do
        sudo tar -Pczf /tmp/$i-$backup_date.tar.gz $i
        if [ $? -eq 0 ]; then
            echo "$i backup succeeded."
        else
            echo "$i backup failed."
        fi
        scp /tmp/$i-$backup_date.tar.gz $dest_server:$dest_dir
        if [ $? -eq 0 ]; then
            echo "$i transfer succeeded."
        else
            echo "$i transfer failed."
        fi
    done

    sudo rm /tmp/*.gzecho "Backup is done."
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

