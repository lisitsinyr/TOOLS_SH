#!/bin/bash
# -----------------------------------------------
# __SET_LIB.sh
# -----------------------------------------------

# -------------------------------------------------------------------
# __SET_VAR_SCRIPT
# SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
#     SCRIPT_FULLFILENAME=
# SCRIPT_BASEFILENAME - Файл скрипта [имя+расширение]
#     SCRIPT_BASEFILENAME=
# SCRIPT_FILENAME - Файл скрипта [имя]
#     SCRIPT_FILENAME=
# -------------------------------------------------------------------
# __SET_SCRIPTS_DIR
# SCRIPTS_DIR - Каталог скриптов
#     SCRIPTS_DIR=
# -------------------------------------------------------------------
# __SET_VAR_DEFAULT
# LOG_FILENAME - Файл журнала [имя]
#     LOG_FILENAME=
# DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
#     DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
# LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DT,...]
#     LOG_FILENAME_FORMAT=FILENAME
# LOG_OPT - Параметры журнала [11]
#     LOG_OPT=11
# -------------------------------------------------------------------
# __SET_VAR_PROJECTS
# PROJECTS -
#     PROJECTS=
# CURRENT_SYSTEM -
#     CURRENT_SYSTEM=
# UNAME -
#     UNAME=
# USERNAME -
#     USERNAME=
# PROJECTS_LYR_DIR -
#     PROJECTS_LYR_DIR=
# PROJECTS_DIR -
#     PROJECTS_DIR=
# CURRENT_DIR - Текущий каталог
#     CURRENT_DIR=
# -------------------------------------------------------------------
# __SET_CHECK_REPO
# REPO_NAME - Имя репозитария
#     REPO_NAME=
# REPO_INI - Файл с параметрами репозитария
#     REPO_INI=REPO.ini
# -------------------------------------------------------------------
# __SET_LOG
# LOG_DIR - Каталог журнала
#     LOG_DIR=
# LOG_BASEFILENAME - Файл журнала [имя+расширение]
#     LOG_BASEFILENAME=
# LOG_FILENAME - Файл журнала [имя]
#     LOG_FILENAME=
# LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DT,...]
#     LOG_FILENAME_FORMAT=
# LOG_OPT - Параметры журнала [11]
#     LOG_OPT=11
# -------------------------------------------------------------------

# -------------------------------------------------------------------
# ФУНКЦИИ
#     function __SET_VAR_SCRIPT
#     function __SET_BAT_DIR
#     function __SET_VAR_DEFAULT
#     function __SET_VAR_PROJECTS
#     function __SET_CHECK_REPO
#     function __SET_LOG
# -------------------------------------------------------------------

# =================================================
# ФУНКЦИИ
# =================================================

# --------------------------------------------------------------------------------
# function __SET_VAR_SCRIPT [%1]
# --------------------------------------------------------------------------------
function __SET_VAR_SCRIPT { #
# beginfunction
    # echo ---------------------------------------------------------------
    # echo __SET_VAR_SCRIPT ...
    # echo ---------------------------------------------------------------
    # Файл скрипта: каталог+имя+расширение
    #SHFile="$1"
    #echo SHFile: $SHFile
    SCRIPT_FULLFILENAME="$1"
    echo SCRIPT_FULLFILENAME: $SCRIPT_FULLFILENAME

    # Файл скрипта: имя+расширение
    #SHFileName=$(ExtractFileName "$SHFile")
    #echo SHFileName: $SHFileName
    SCRIPT_BASEFILENAME=$(ExtractFileName "$SHFile")
    echo SCRIPT_BASEFILENAME: $SCRIPT_BASEFILENAME
    
    # Файл скрипта: имя
    #SHFileNameWithoutExt=$(ExtractFileNameWithoutExt "$SHFileName")
    #echo SHFileNameWithoutExt: $SHFileNameWithoutExt
    SCRIPT_FILENAME=$(ExtractFileNameWithoutExt "$SCRIPT_BASEFILENAME")
    echo SCRIPT_FILENAME: $SCRIPT_FILENAME
    
    # Файл скрипта: каталог
    #SHDir=$(ExtractFileDir "$SHFile")
    #echo SHDir: $SHDir
    SCRIPT_FILEDIR=$(ExtractFileDir "$SCRIPT_FULLFILENAME")
    echo SCRIPT_FILEDIR: $SCRIPT_FILEDIR

    # Файл скрипта: расширение
    #SHFileExt=$(ExtractFileExt "$SHFileName")
    #echo SHFileExt: $SHFileExt
    SCRIPT_FILEEXT=$(ExtractFileExt "$SCRIPT_BASEFILENAME")
    echo SCRIPT_FILEEXT: $SCRIPT_FILEEXT

    #exit 0
}
# endfunction

# --------------------------------------------------------------------------------
# function __SET_VAR_DEFAULT
# --------------------------------------------------------------------------------
function __SET_VAR_DEFAULT { #
# beginfunction
    # echo ---------------------------------------------------------------
    # echo __SET_VAR_DEFAULT
    # echo ---------------------------------------------------------------
    # LOG_FILENAME - Файл журнала [имя]
    LOG_FILENAME="$REPO_NAME_xxxxxxxxxxxxxxxxxx"
    LOG_FILENAME=""
    echo LOG_FILENAME: $LOG_FILENAME
    # -------------------------------------------------------------------
    # DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
    DATETIME_STAMP=$(printf "%(%Y%m%d%H%M%S)T")
    echo DATETIME_STAMP [YYYYMMDDHHMMSS]: $DATETIME_STAMP
    # -------------------------------------------------------------------
    # LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    # set LOG_FILENAME_FORMAT=
    if [ -z $LOG_FILENAME_FORMAT ] ; then
        LOG_FILENAME_FORMAT=FILENAME
        rem LOG_FILENAME_FORMAT=DATETIME
    fi
    echo LOG_FILENAME_FORMAT [FILENAME,DATETIME,...]: $LOG_FILENAME_FORMAT
    # -------------------------------------------------------------------
    # LOG_OPT - Параметры журнала [11]
    if [ -z $LOG_OPT ] ; then
        LOG_OPT=11
    fi
    echo LOG_OPT [11]: $LOG_OPT

    #exit 0
}
# endfunction

# --------------------------------------------------------------------------------
# function __SET_VAR_PROJECTS
# --------------------------------------------------------------------------------
function __SET_VAR_PROJECTS { #
# beginfunction
    # echo ---------------------------------------------------------------
    # echo __SET_VAR_PROJECTS
    # echo ---------------------------------------------------------------
    # PROJECTS - проект
    #PROJECTS=
    #echo PROJECTS: $PROJECTS
    # -------------------------------------------------------------------
    # PROJECTS_LYR_DIR -
    #PROJECTS_LYR_DIR=
    #echo PROJECTS_LYR_DIR: $PROJECTS_LYR_DIR
    # -------------------------------------------------------------------
    # PROJECTS_DIR -
    #PROJECTS_DIR=
    #echo PROJECTS_DIR: $PROJECTS_DIR
    # -------------------------------------------------------------------
    # CURRENT_SYSTEM -
    CURRENT_SYSTEM=$(uname -a)
    #echo CURRENT_SYSTEM: $CURRENT_SYSTEM
    # -------------------------------------------------------------------
    # UNAME - COMPUTERNAME
    UNAME=$(uname -n)
    #echo UNAME: $UNAME
    # -------------------------------------------------------------------
    # USERNAME - USERNAME
    USERNAME=$(whoami)
    #echo USERNAME: $USERNAME
    # CURRENT_DIR - Текущий каталог
    CURRENT_DIR=$(pwd)
    #echo CURRENT_DIR: CURRENT_DIR
    #exit 0
}
# endfunction

# --------------------------------------------------------------------------------
# function __SET_CHECK_REPO { #
# --------------------------------------------------------------------------------
function __SET_CHECK_REPO { #
# beginfunction
    # echo ---------------------------------------------------------------
    # echo __SET_CHECK_REPO
    # echo ---------------------------------------------------------------
    # echo -------------------------------------------------------
    # echo 3.Наличие репозитария
    # echo    %REPO_NAME%
    # echo -------------------------------------------------------
    # REPO_NAME - Имя репозитария
    REPO_NAME=""
    # -------------------------------------------------------------------
    # REPO_INI - Файл с параметрами репозитария
    REPO_INI='REPO.ini'
    #echo REPO_INI [REPO.ini]: $REPO_INI
    # -------------------------------------------------------------------
    # Проверка существования файла REPO.ini
    #if not exist %REPO_INI% (
    #    echo INFO: File %REPO_INI% not exist
    #    # exit /b 1
    #) else (
    #    for /f "eol=# delims== tokens=1,2" %%i in (%REPO_INI%) do (
    #        # В переменной i - ключ
    #        # В переменной j - значение
    #        set %%i=%%j
    #        # echo %%i: %%%j%
    #    )
    #)
    #echo REPO_NAME: $REPO_NAME
    #exit 0
}
# endfunction

# --------------------------------------------------------------------------------
# function __SET_LOG
# --------------------------------------------------------------------------------
function __SET_LOG { #
# beginfunction
    echo ---------------------------------------------------------------
    echo __SET_LOG
    echo ---------------------------------------------------------------

    #if "%__SET_LOG__%"=="1" (echo __SET_LOG__: %__SET_LOG__% && exit /b 0) else (set __SET_LOG__=1)

    # LOG_DIR - Каталог журнала [каталог]
    #if "%LOG_DIR%"=="" (
    #    set LOG_DIR=%PROJECTS_LYR_DIR%\LOGS
    #)
    # echo LOG_DIR: %LOG_DIR%
    #if not exist %LOG_DIR% (
    #    echo ERROR: Dir %LOG_DIR% not exist
    #    exit /b 1
    #)
    # LOG_FILENAME - Файл журнала [имя]
    #if "%LOG_FILENAME%"=="" (
    #    if "%LOG_FILENAME_FORMAT%"=="FILENAME" (
    #        set LOG_FILENAME=%SCRIPT_FILENAME%
    #    ) else (
    #        if "%LOG_FILENAME_FORMAT%"=="DATETIME" (
    #            set LOG_FILENAME=%DATETIME_STAMP%
    #        ) else (
    #            echo ERROR: LOG_FILENAME not set 
    #            exit /b 1
    #        )
    #    )
    #)
    # echo LOG_FILENAME: %LOG_FILENAME%
    # -------------------------------------------------------------------
    # LOG_FULLFILENAME - Файл журнала [каталог+имя+расширение]
    #if "%REPO_NAME%"=="" (
    #    set LOG_FULLFILENAME=%LOG_DIR%\%LOG_FILENAME%.log
    #) else (
    #    set LOG_FULLFILENAME=%LOG_DIR%\%REPO_NAME%_%LOG_FILENAME%.log
    #)
    # echo LOG_FULLFILENAME: %LOG_FULLFILENAME%
    # -------------------------------------------------------------------
    # LOG_OPT1 - Параметр журнала [1]
    #set LOG_OPT1=%LOG_OPT:~0,1%
    #if "%LOG_OPT1%"=="" (
    #    set LOG_OPT1=1
    #)
    # echo LOG_OPT1 [1]: %LOG_OPT1%
    # -------------------------------------------------------------------
    # LOG_OPT2 - Параметры журнала [1]
    #set LOG_OPT2=%LOG_OPT:~1,1%
    #if "%LOG_OPT2%"=="" (
    #    set LOG_OPT2=1
    #)
    # echo LOG_OPT2 [1]: %LOG_OPT2%
    #exit 0
}
# endfunction

# ===================================================================

#:Exit
