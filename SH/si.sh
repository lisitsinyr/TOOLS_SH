#!/bin/bash
# -----------------------------------------------
# si.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN_01 ()
#--------------------------------------------------------------------------------
function MAIN_01 () {
#beginfunction
    # Порог свободного места (в процентах)
    THRESHOLD=10

    # Получение процента свободного места на корневом разделе
    FREE_SPACE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

    # Если свободное место меньше порога, отправить уведомление
    if [ "$FREE_SPACE" -lt "$THRESHOLD" ]; then
        echo "Свободного места на диске менее $THRESHOLD%. Осталось: $FREE_SPACE%" | mail -s "Disk Space Alert" your_email@example.com
    fi
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

