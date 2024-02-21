#!/bin/bash
# -----------------------------------------------
# LYRSupport.sh
# -----------------------------------------------

#:begin
# echo '01.НАЗВАНИЕ'
# echo '    *** - ***'

# echo '02.СИНТАКСИС'
# echo '    *** [параметры] ***'

# echo '03.ОПИСАНИЕ'
# echo '    ***'

#--------------------------------------------------------------------------------
# procedure LYRSupport ()
#--------------------------------------------------------------------------------
function LYRSupport () {
#beginfunction
    echo LYRSupport

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure Check_P (P_Name P_Value)
#--------------------------------------------------------------------------------
function Check_P () {
#beginfunction
    P_Name=$1
    echo P_Name: $P_Name
    P_Value=$2
    echo P_Value: $P_Value

    if [ -z $P_Value ] ; then
        Input=
        echo ${P_Name}[${!P_Name}]:
        read Input
    else
        eval ${P_Name}=$P_Value
        return 0
    fi
    echo Input: $Input
    if [ -z $Input ] ; then
        eval ${P_Name}=${!P_Name}
    else
        eval ${P_Name}=$Input
    fi

    return 0
}
#endfunction

#:Exit
