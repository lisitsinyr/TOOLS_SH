#!/bin/bash
# -----------------------------------------------
# SyncFilesServer.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN_01 ()
#--------------------------------------------------------------------------------
function MAIN_01 () {
#beginfunction
    LOCAL_DIR="/path/to/local/dir"

    # Удалённый сервер и директория
    REMOTE_USER="user"
    REMOTE_SERVER="server.com"
    REMOTE_DIR="/path/to/remote/dir"

    # Синхронизация с удалённым сервером
    rsync -avz $LOCAL_DIR $REMOTE_USER@$REMOTE_SERVER:$REMOTE_DIR

    # Вывод сообщения о завершении
    echo "Синхронизация завершена!"
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

