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
# ExtractFileDir APath:
#--------------------------------------------------------------------------------
function ExtractFileDir { # APath:
#beginfunction
    LPath=$1
    # fspec=/path/to/some/file.txt
    # echo ${fspec%/*}
    # fspec=/path/to/some/
    LDir=${LPath%/*}
    #echo $(( $LDir ))
    echo $LDir
    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# ExtractFileName (APath: str) -> str:
#--------------------------------------------------------------------------------
function ExtractFileName { # APath:
#beginfunction
    LPath=$1
    # fspec=/path/to/some/file.txt
    # echo ${fspec##*/}
    # file.txt
    LFileName=${LPath##*/}
    # echo $(( $LFileName ))
    echo $LFileName
    return 0
}
#endfunction


#-------------------------------------------------------------------------------
# ExtractFileNameWithoutExt (AFileName: str) -> str:
#-------------------------------------------------------------------------------
function ExtractFileNameWithoutExt { # AFileName:
#beginfunction
    LFileName=$1
    LResult=${LFileName%%.*}
    # echo $(( $LResult ))
    echo $LResult
    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# ExtractFileExt (AFileName: str) -> str:
#--------------------------------------------------------------------------------
function ExtractFileExt { #(AFileName: str) -> str:
#beginfunction
    LFileName=$1
    LFileExt=${LFileName#*.}
    # echo $(( $LFileExt ))
    echo $LFileExt
    return 0
}
#endfunction

#:Exit
