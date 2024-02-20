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
function ExtractFileDir {
#beginfunction
    local LResult=
    LPath=$1
    # fspec=/path/to/some/file.txt
    # echo ${fspec%/*}
    # fspec=/path/to/some/

    LResult=${LPath%/*}

    #echo $(( $LResult ))       # работает, если LResult 0..255
    #return $(( $LResult ))     # работает, если LResult 0..255
    #return $LResult            # работает, если LResult 0..255
    echo $LResult               # работает всегда

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function ExtractFileName APath
#--------------------------------------------------------------------------------
function ExtractFileName {
#beginfunction
    local LResult=
    LPath=$1
    # fspec=/path/to/some/file.txt
    # echo ${fspec##*/}
    # file.txt
    LResult=${LPath##*/}

    #echo $(( $LResult ))       # работает, если LResult 0..255
    #return $(( $LResult ))     # работает, если LResult 0..255
    #return $LResult            # работает, если LResult 0..255
    echo $LResult               # работает всегда

    return 0
}
#endfunction


#-------------------------------------------------------------------------------
# function ExtractFileNameWithoutExt AFileName
#-------------------------------------------------------------------------------
function ExtractFileNameWithoutExt {
#beginfunction
    local LResult=
    LFileName=$1
    LResult=${LFileName%%.*}
    
    #echo $(( $LResult ))       # работает, если LResult 0..255
    #return $(( $LResult ))     # работает, если LResult 0..255
    #return $LResult            # работает, если LResult 0..255
    echo $LResult               # работает всегда

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function ExtractFileExt AFileName
#--------------------------------------------------------------------------------
function ExtractFileExt {
#beginfunction
    local LResult=
    LFileName=$1
    LResult=${LFileName#*.}

    #echo $(( $LResult ))       # работает, если LResult 0..255
    #return $(( $LResult ))     # работает, если LResult 0..255
    #return $LResult            # работает, если LResult 0..255
    echo $LResult               # работает всегда

    return 0
}
#endfunction

#:Exit
