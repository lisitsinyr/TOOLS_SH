#!/bin/bash
# -----------------------------------------------
# LYRLog.sh
# -----------------------------------------------

#:begin
# echo '01.НАЗВАНИЕ'
# echo '    *** - ***'

# echo '02.СИНТАКСИС'
# echo '    *** [параметры] ***'

# echo '03.ОПИСАНИЕ'
# echo '    ***'

# -------------------------------------------------------------------
# Redirect stdout and stderr to the log file
# -------------------------------------------------------------------
#0, STDIN - стандартный поток ввода
#1, STDOUT - стандартный поток вывода
#2, STDERR - стандартный поток ошибок
#3, 3 - поток вывода
#4, 4 - поток вывода
#5, 5 - поток вывода
#6, 6 - поток вывода
#7, 7 - поток вывода
#8, 8 - поток вывода
#9, 9 - поток вывода

# -------------------------------------------------------------------
#   echo "This is normal output" >&1
#   echo "This is an error"      >&2
# -------------------------------------------------------------------

# -------------------------------------------------------------------
#   echo 1> data.txt  # STDOUT
#   echo 2> error.txt # STDERR

#   ls data 1> data.txt 2> error.txt # STDOUT STDERR

#Если надо, STDERR и STDOUT можно перенаправить в один и тот же файл, воспользовавшись &>:
#   ls data &> data-error.txt
#Устаревшая форма записи:
#   ls data > data-error.txt 2>&1
# -------------------------------------------------------------------

# -------------------------------------------------------------------
#   exec $> "$LOG_FILE"  # STDOUT и STDERR
#   exec 1> "$LOG_FILE"  # STDOUT
# -------------------------------------------------------------------


LOG_File=''
LOG_SHFileName=''
LOG_Str=''

format='%Y-%m-%d %H:%M:%S %N'

loStandard=0
loTextFile=1
loAll=2

# ДОБАВИТЬ LEVEL
NOTSET=0
DEBUG=1
INFO=2
WARNING=3
ERROR=4
CRITICAL=5
DEBUGTEXT=11
BEGIN=21
END=22
PROCESS=23
TEXT=24
ctlsNOTSET=' '
ctlsDEBUG='D'
ctlsINFO='I'
ctlsWARNING='W'
ctlsERROR='E'
ctlsCRITICAL='C'
ctlsBEGIN='<'
ctlsEND='>'
ctlsPROCESS='P'
ctlsDEBUGTEXT='T'
ctlsTEXT=''

#--------------------------------------------------------------------------------
# FormatStr
#--------------------------------------------------------------------------------
function FormatStr { # Anamesh: str, Alevel: int, Amessage: str
#beginfunction
    #echo 'FormatStr...'
    Lnamesh=$1
    Llevel=$2
    Lmessage=$3

    #15/01/2024 14:48:36 [TEST_LUStrUtils] INFO       ssssssssssssssssssssssssssssssssssssssssss
    printf -v asctime '%(%Y/%m/%d %H:%M:%S)T' -1

    # if [ $Llevel -eq $NOTSET ] ; then
    #     Linfo='NOTSET'
    #     printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    # elif [ $Llevel -eq $DEBUG ] ; then
    #     Linfo='DEBUG'
    #     printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    # elif [ $Llevel -eq $INFO ] ; then
    #     Linfo='INFO'
    #     printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    # elif [ $Llevel -eq $WARNING ] ; then
    #     Linfo='WARNING'
    #     printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    # elif [ $Llevel -eq $ERROR ] ; then
    #     Linfo='ERROR'
    #     printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    # elif [ $Llevel -eq $CRITICAL ] ; then
    #     Linfo='CRITICAL'
    #     printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    # elif [ $Llevel -eq $DEBUGTEXT ] ; then
    #     Linfo='DEBUGTEXT'
    #     printf -v LOG_Str "%-s" "$Lmessage"
    # elif [ $Llevel -eq $BEGIN ] ; then
    #     Linfo='BEGIN'
    #     printf -v LOG_Str "%-s" "$Lmessage"
    # elif [ $Llevel -eq $END ] ; then
    #     Linfo='END'
    #     printf -v LOG_Str "%-s" "$Lmessage"
    # elif [ $Llevel -eq $PROCESS ] ; then
    #     Linfo='PROCESS'
    #     printf -v LOG_Str "%-s" "$Lmessage"
    # elif [ $Llevel -eq $TEXT ] ; then
    #     Linfo='TEXT'
    #     printf -v LOG_Str "%-s" "$Lmessage"
    # else
    #     Linfo=''
    # fi

    case "$Llevel" in
    $NOTSET)
        Linfo='NOTSET'
        printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $DEBUG)
        Linfo='DEBUG'
        printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $INFO)
        Linfo='INFO'
        printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $WARNING)
        Linfo='WARNING'
        printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $ERROR)
        Linfo='ERROR'
        printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $CRITICAL)
        Linfo='CRITICAL'
        printf -v LOG_Str "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $DEBUGTEXT)
        Linfo='DEBUGTEXT'
        printf -v LOG_Str "%-s" "$Lmessage"
        ;;
    $BEGIN)
        Linfo='BEGIN'
        printf -v LOG_Str "%-s" "$Lmessage"
        ;;
    $END)
        Linfo='END'
        printf -v LOG_Str "%-s" "$Lmessage"
        ;;
    $PROCESS)
        Linfo='PROCESS'
        printf -v LOG_Str "%-s" "$Lmessage"
        ;;
    $TEXT)
        Linfo='TEXT'
        printf -v LOG_Str "%-s" "$Lmessage"
        ;;
    *)
        Linfo=''
        ;;
    esac

}
#endfunction

#--------------------------------------------------
#
#--------------------------------------------------
function AddLog { # Aout: int, Alevel: int, Value: str
#beginfunction
    #echo 'AddLog...'
    Lout=$1
    Llevel=$2
    LValue=$3
    FormatStr "$LOG_SHFileName" "$Llevel" "$LValue"

    #if self.LogEnabled:
    #    self._Execute(T)
    if [ $Lout -eq 0 ] ; then
        echo "$LOG_Str"
    elif [ $Lout -eq 1 ] ; then
        #echo "$LOG_Str" >&3
        echo "$LOG_Str" >> "$LOG_File"
    elif [ $Lout -eq 2 ] ; then
        #echo "$LOG_Str"
        #echo "$LOG_Str" >&3
        echo "$LOG_Str" | tee -a "$LOG_File"
    else
        echo 'ERROR' $Lout
    fi
}
#endfunction

#--------------------------------------------------
#
#--------------------------------------------------
function AddLogFile { # Aout: int, AFileName: str
#beginfunction
    echo 'AddLogFile...'
    Lout=$1
    LFileName="$2"

    if [ -r "$LFileName" ] ; then
        # чтения файла построчно
        #while IFS= read -r LValue; do
        #    AddLog $Lout $TEXT "$LValue"
        #done < "$LFileName"

        # Использование дескриптора файла
        # Вы также можете предоставить ввод в цикл, используя дескриптор файла:
        while IFS= read -r -u9 LValue; do
            AddLog $Lout $TEXT "$LValue"
        done 9< "$LFileName"
        exec 9>&-
    else
        echo 'ERROR' "$LFileName"
    fi
}
#endfunction

#--------------------------------------------------------------------------------
# StartLogFile (AFileName: str):
#--------------------------------------------------------------------------------
function StartLogFile { # (AFileName: str):
#beginfunction
    #echo 'StartLogFile...'
    LFileName=$1
    if [ -r "$LFileName" ] ; then
        echo "$LFileName"
        rm "$LFileName"
    fi
    touch "$LFileName"
    exec 3>>"$LFileName"
    # -------------------------------------------------------------------
    AddLog $loAll $INFO "Старт: $(date +"$format")"
}
#endfunction

#--------------------------------------------------------------------------------
# StopLogFile ():
#--------------------------------------------------------------------------------
function StopLogFile { # ():
#beginfunction
    #echo 'StopLogFile...'
    # -------------------------------------------------------------------
    AddLog $loAll $INFO "Стоп: $(date +"$format")"
    exec 3>&-
}
#endfunction

#:Exit