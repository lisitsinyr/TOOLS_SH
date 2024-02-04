#!/bin/bash
# -----------------------------------------------
# lyrxxx_ШАБЛОН.sh
# -----------------------------------------------

# -------------------------------------------------------------------
# PROJECTS
# -------------------------------------------------------------------
PROJECTS='/d/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX'

# -------------------------------------------------------------------
# БИБЛИОТЕКА LYR
# -------------------------------------------------------------------
# . /d/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/LYR/LYRFileUtils.sh
source $PROJECTS/LYR/LYRFileUtils.sh
source $PROJECTS/LYR/LYRLog.sh
# -------------------------------------------------------------------

# -------------------------------------------------------------------
# LOG по умолчанию
# -------------------------------------------------------------------
SHFile=$0
SHDir=$(ExtractFileDir "$0")
SHFileName=$(ExtractFileName "$0")
SHFileNameWithoutExt=$(ExtractFileNameWithoutExt "$SHFileName")
SHFileExt=$(ExtractFileExt "$SHFileName")

LOG_DIR="$PROJECTS"
#LOG_DIR="$PROJECTS_UNIX/COMMANDS/00.[sh]SHELL/bash - Bourne Again Shell/3.3.Функции оболочки/fname"
LOG_FILE="$0.log"
LOG_SHFILENAME=$(basename "$0")
LOG_OPT="1 1"

# -------------------------------------------------------------------
# StartLogFile
# -------------------------------------------------------------------
StartLogFile "$LOG_FILE"
# -------------------------------------------------------------------

#:begin

# AddLog $loAll $TEXT '01.НАЗВАНИЕ'
# AddLog $loAll $TEXT '    *** - ***'
# AddLog $loAll $TEXT '02.СИНТАКСИС'
# AddLog $loAll $TEXT '    *** [параметры] ***'
# AddLog $loAll $TEXT '03.ОПИСАНИЕ'
# AddLog $loAll $TEXT '    ***'
# AddLog $loAll $TEXT '04.ПАРАМЕТРЫ'
# AddLog $loAll $TEXT '    [параметры]'
# AddLog $loAll $TEXT '05.ЗАМЕЧАНИЕ'
# AddLog $loAll $TEXT '    ***'
# AddLog $loAll $TEXT '06.НАСТРОЙКА'
# AddLog $loAll $TEXT '    ***'
# AddLog $loAll $TEXT '07.ФАЙЛЫ'
# AddLog $loAll $TEXT '    ***'
# AddLog $loAll $TEXT '08.ВОЗВРАЩАЕМЫЕ ЗНАЧЕНИЯ'
# AddLog $loAll $TEXT '    ***'
# AddLog $loAll $TEXT '09.СМОТРИТЕ ТАКЖЕ'
# AddLog $loAll $TEXT '    ***'
# AddLog $loAll $TEXT '10.ПРИМЕРЫ'
# AddLog $loAll $TEXT '    ***'
#-------------------------------------------------
# loStandard=0
# loTextFile=1
# loAll=2
#-------------------------------------------------
# AddLog $loAll $NOTSET 'NOTSET'
# AddLog $loAll $DEBUG 'DEBUG'
# AddLog $loAll $INFO 'INFO'
# AddLog $loAll $WARNING 'WARNING'
# AddLog $loAll $ERROR 'ERROR'
# AddLog $loAll $CRITICAL 'CRITICAL'
# AddLog $loAll $DEBUGTEXT 'DEBUGTEXT'
# AddLog $loAll $BEGIN 'BEGIN'
# AddLog $loAll $END 'END'
# AddLog $loAll $PROCESS 'PROCESS'
# AddLog $loAll $TEXT 'TEXT'

# AddLog $loAll $TEXT '--------------------------------------'
# str=''
# str=""
# result=$('')
# AddLog $loAll $TEXT 'str:'"$str"
# AddLog $loAll $TEXT 'result:'"$result"
# AddLog $loAll $TEXT '--------------------------------------'

#:end

# -------------------------------------------------------------------
# StopLogFile
# -------------------------------------------------------------------
StopLogFile
# -------------------------------------------------------------------
exit 0
#:Exit
