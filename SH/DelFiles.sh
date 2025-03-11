#!/bin/bash
# -----------------------------------------------
# DelFiles.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN_01 ()
#--------------------------------------------------------------------------------
function MAIN_01 () {
#beginfunction
    # массив, в котором мы храним ключевые слова для поиска, например:
    search_arr=(WetTrains LedForm WyChart)

    # информируем о своих действиях                                                                               
    echo Find and delete files and folders contains $search_arr

    # для каждого ключевого слова
    for item in ${search_arr[*]}
    do
        echo Find and remove *$item*
        # найдем все файлы и папки, которые это слово содержат,
        # не обращая внимания на регистр, и удалим их рекурсивно
        sudo find / -iname -name "*$item*" -exec rm -rv {} \;
    done
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

