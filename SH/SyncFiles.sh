#!/bin/bash
# -----------------------------------------------
# SyncFiles.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN_01 ()
#--------------------------------------------------------------------------------
function MAIN_01 () {
#beginfunction
    SOURCE_DIR="$HOME/source_directory"
    DEST_DIR="$HOME/destination_directory"

    # Синхронизация файлов
    rsync -av --delete "$SOURCE_DIR/" "$DEST_DIR/"

    # Уведомление о завершении
    echo "Синхронизация завершена: $SOURCE_DIR -> $DEST_DIR"
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

