#!/bin/bash
# -----------------------------------------------
# LYRConst.sh
# -----------------------------------------------
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
    SHFile="$1"
    echo SHFile: $SHFile
    SHDir=$(ExtractFileDir "$SHFile")
    echo SHDir: $SHDir
    SHFileName=$(ExtractFileName "$SHFile")
    echo SHFileName: $SHFileName
    SHFileNameWithoutExt=$(ExtractFileNameWithoutExt "$SHFileName")
    echo SHFileNameWithoutExt: $SHFileNameWithoutExt
    SHFileExt=$(ExtractFileExt "$SHFileName")
    echo SHFileExt: $SHFileExt

    # Файл скрипта: каталог+имя+расширение
    SCRIPT_FULLFILENAME="$1"
    echo SCRIPT_FULLFILENAME: $SCRIPT_FULLFILENAME
    # Файл скрипта: имя+расширение
    set SCRIPT_BASEFILENAME=$(ExtractFileName "$SHFile")
    echo SCRIPT_BASEFILENAME: $SCRIPT_BASEFILENAME
    # Файл скрипта: имя
    set SCRIPT_FILENAME==$(ExtractFileNameWithoutExt "$SHFileName")
    echo SCRIPT_FILENAME: $SCRIPT_FILENAME
}
# endfunction

# --------------------------------------------------------------------------------
# function __SET_BAT_DIR
# --------------------------------------------------------------------------------
function __SET_BAT_DIR { #
# beginfunction
    # echo ---------------------------------------------------------------
    # echo __SET_BAT_DIR
    # echo ---------------------------------------------------------------
    # Каталог BAT_DIR: каталог
    BAT_DIR=
    #if "%BAT_DIR%" == "" (
    #    set BAT_DIR=D:\TOOLS\TOOLS_BAT
    #    set BAT_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
    #)
    echo BAT_DIR: $BAT_DIR
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
    # echo -------------------------------------------------------
    # echo 1.Переменные по умолчанию
    # echo    %LOG_DIR%
    # echo    %LOG_FILENAME%
    # echo    %DATETIME_STAMP%
    # echo    %LOG_FILENAME_FORMAT%
    # echo    %LOG_OPT%
    # echo -------------------------------------------------------
    # LOG_FILENAME - Файл журнала [имя]
    LOG_FILENAME=
    echo LOG_FILENAME: $LOG_FILENAME

    # DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
    DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    #DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    echo DATETIME_STAMP [YYYYMMDDHHMMSS]: $DATETIME_STAMP
    
    # LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DT,...]
    LOG_FILENAME_FORMAT=
    #if "%LOG_FILENAME_FORMAT%"=="" (
    #LOG_FILENAME_FORMAT='FILENAME'
    #LOG_FILENAME_FORMAT='DATETIME'
    #)
    echo LOG_FILENAME_FORMAT [FILENAME,DT,...]: $LOG_FILENAME_FORMAT

    # LOG_OPT - Параметры журнала [11]
    LOG_OPT=
    #if "%LOG_OPT%"=="" (
    #    LOG_OPT=11
    #)
    echo LOG_OPT [11]: $LOG_OPT
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
    # echo -------------------------------------------------------
    # echo 2.Проект [PROJECTS]
    # echo    %PROJECTS%
    # echo    %UNAME%
    # echo    %USERNAME%
    # echo    %PROJECTS_LYR_DIR%
    # echo    %PROJECTS_DIR%
    # echo -------------------------------------------------------
    #PROJECTS='PROJECTS_BAT'
    echo PROJECTS: $PROJECTS
    # -------------------------------------------------------------------
    set CURRENT_SYSTEM=$(uname -a)
    echo CURRENT_SYSTEM: $CURRENT_SYSTEM
    # -------------------------------------------------------------------
    UNAME=$(uname -n)
    echo UNAME: $UNAME
    # -------------------------------------------------------------------
    USERNAME=$(whoami)
    echo USERNAME: $USERNAME
    # -------------------------------------------------------------------
    PROJECTS_LYR_DIR='D:\PROJECTS_LYR'
    echo PROJECTS_LYR_DIR: $PROJECTS_LYR_DIR
    # -------------------------------------------------------------------
    PROJECTS_DIR='%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%'
    echo PROJECTS_DIR: $PROJECTS_DIR
}
# endfunction

# --------------------------------------------------------------------------------
# function __SET_CHECK_REPO { #
# --------------------------------------------------------------------------------
function __SET_CHECK_REPO
# beginfunction
    # echo ---------------------------------------------------------------
    # echo __SET_CHECK_REPO
    # echo ---------------------------------------------------------------
    # echo -------------------------------------------------------
    # echo 3.Наличие репозитария
    # echo    %REPO_NAME%
    # echo -------------------------------------------------------
    # REPO_NAME - Имя репозитария
    REPO_NAME=
    # -------------------------------------------------------------------
    # REPO_INI - Файл с параметрами репозитария
    REPO_INI='REPO.ini'
    echo REPO_INI [REPO.ini]: $REPO_INI
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
    echo REPO_NAME: $REPO_NAME
}
# endfunction

# --------------------------------------------------------------------------------
# function __SET_LOG
# --------------------------------------------------------------------------------
function __SET_LOG { #
# beginfunction
    # echo ---------------------------------------------------------------
    # echo __SET_LOG
    # echo ---------------------------------------------------------------
    # echo -------------------------------------------------------
    # echo 4.Настройка Каталога журналов и имени журнала 
    # echo    %LOG_DIR%
    # echo    %LOG_FILENAME%
    # echo    %LOG_OPT1%
    # echo    %LOG_OPT2%
    # echo -------------------------------------------------------

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
}
# endfunction

# ===================================================================

#:Exit
