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
# 
#--------------------------------------------------------------------------------
function LYRSupport { #
#beginfunction
    echo LYRSupport
    #exit 0
}
#endfunction

function Check_P {
#echo ---------------------------------------------------------------
#echo Check_P [P_Name,P_Value]
#echo ---------------------------------------------------------------
    P_Name=%1
    echo P_Name: $P_Name
    P_Value=%2
    echo P_Value: $P_Value

#if $P_Value%=="" (
#    set /p Input=%P_Name%[!%P_Name%!]:
#) else (
#    set %P_Name%=%P_Value%
#    exit 0
#)
#if "%Input%"=="" (
#    set %P_Name%=!%P_Name%!
#) else (
#    set %P_Name%=%Input%
#)
    #exit 0
}
#endfunction

#:Exit
