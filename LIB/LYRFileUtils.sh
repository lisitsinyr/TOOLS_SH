#!/bin/bash
# -----------------------------------------------
# LYRFileUtils.sh
# -----------------------------------------------

#:begin
# echo '01.НАЗВАНИЕ'
# echo '    *** - ***'

# echo '02.СИНТАКСИС'
# echo '    *** [параметры] ***'

# echo '03.ОПИСАНИЕ'
# echo '    ***'

#--------------------------------------------------------------------------------
# function ExtractFileDir APath
#--------------------------------------------------------------------------------
function ExtractFileDir () {
#beginfunction
    local LResult=
    LPath=$1
    # fspec=/path/to/some/file.txt
    # echo ${fspec%/*}
    # fspec=/path/to/some/

    LError=0
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi
    return $(( $LError ))
    #echo $(( $LResult ))       # работает, если LResult 0..255
    #return $(( $LResult ))     # работает, если LResult 0..255
    #return $LResult            # работает, если LResult 0..255
}
#endfunction

#--------------------------------------------------------------------------------
# function ExtractFileName APath
#--------------------------------------------------------------------------------
function ExtractFileName () {
#beginfunction
    local LResult=
    LPath=$1
    # fspec=/path/to/some/file.txt
    # echo ${fspec##*/}
    # file.txt
    LResult=${LPath##*/}

    LError=0
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi
    return $(( $LError ))
}
#endfunction


#-------------------------------------------------------------------------------
# function ExtractFileNameWithoutExt AFileName
#-------------------------------------------------------------------------------
function ExtractFileNameWithoutExt () {
#beginfunction
    local LResult=
    LFileName=$1
    LResult=${LFileName%%.*}
    
    LError=0
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi
    return $(( $LError ))
}
#endfunction

#--------------------------------------------------------------------------------
# function ExtractFileExt AFileName
#--------------------------------------------------------------------------------
function ExtractFileExt () {
#beginfunction
    local LResult=
    LFileName=$1
    LResult=${LFileName#*.}

    LError=0
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi
    return $(( $LError ))
}
#endfunction

#:Exit
