@echo off
rem -------------------------------------------------------------------
rem lyrgit_clon_LocalRepository.bat
rem ----------------------------------------------------------------------------
rem Клонировать GlobalRepository в заданный каталог
rem ----------------------------------------------------------------------------
rem usage: git clone [<options>] [--] <repo> [<dir>]
rem 
rem     -v, --[no-]verbose    be more verbose
rem     -q, --[no-]quiet      be more quiet
rem     --[no-]progress       force progress reporting
rem     --[no-]reject-shallow don't clone shallow repository
rem     -n, --no-checkout     don't create a checkout
rem     --checkout            opposite of --no-checkout
rem     --[no-]bare           create a bare repository
rem     --[no-]mirror         create a mirror repository (implies bare)
rem     -l, --[no-]local      to clone from a local repository
rem     --no-hardlinks        don't use local hardlinks, always copy
rem     --hardlinks           opposite of --no-hardlinks
rem     -s, --[no-]shared     setup as shared repository
rem     --[no-]recurse-submodules[=<pathspec>]
rem                           initialize submodules in the clone
rem     --[no-]recursive[=<pathspec>]
rem                           alias of --recurse-submodules
rem     -j, --[no-]jobs <n>   number of submodules cloned in parallel
rem     --[no-]template <template-directory>
rem                           directory from which templates will be used
rem     --[no-]reference <repo>
rem                           reference repository
rem     --[no-]reference-if-able <repo>
rem                           reference repository
rem     --[no-]dissociate     use --reference only while cloning
rem     -o, --[no-]origin <name>
rem                           use <name> instead of 'origin' to track upstream
rem     -b, --[no-]branch <branch>
rem                           checkout <branch> instead of the remote's HEAD
rem     -u, --[no-]upload-pack <path>
rem                           path to git-upload-pack on the remote
rem     --[no-]depth <depth>  create a shallow clone of that depth
rem     --[no-]shallow-since <time>
rem                           create a shallow clone since a specific time
rem     --[no-]shallow-exclude <revision>
rem                           deepen history of shallow clone, excluding rev
rem     --[no-]single-branch  clone only one branch, HEAD or --branch
rem     --no-tags             don't clone any tags, and make later fetches not to follow them
rem     --tags                opposite of --no-tags
rem     --[no-]shallow-submodules
rem                           any cloned submodules will be shallow
rem     --[no-]separate-git-dir <gitdir>
rem                           separate git dir from working tree
rem     -c, --[no-]config <key=value>
rem                           set config inside the new repository
rem     --[no-]server-option <server-specific>
rem                           option to transmit
rem     -4, --ipv4            use IPv4 addresses only
rem     -6, --ipv6            use IPv6 addresses only
rem     --[no-]filter <args>  object filtering
rem     --[no-]also-filter-submodules
rem                           apply partial clone filters to submodules
rem     --[no-]remote-submodules
rem                           any cloned submodules will use their remote-tracking branch
rem     --[no-]sparse         initialize sparse-checkout file to include only files at root
rem     --[no-]bundle-uri <uri>
rem                           a URI for downloading bundles before fetching from origin remote
rem ----------------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
echo Проверка 1 параметра
if "%1" == "" goto P1_Input
SET GlobalRepository=%1
goto P2
:P1_Input
echo Ввод 1 параметра
set /p GlobalRepository=GlobalRepository:
if "%GlobalRepository%" == "" goto P1_Error
goto P2
:P1_Error
echo Значение параметра GlobalRepository не установлено
goto Exit
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
:P2
echo Проверка 2 параметра
if "%2" == "" goto P2_Input
SET LocalRepository=%2
goto Begin2
:P2_Input
echo Ввод 2 параметра
set /p LocalRepository=LocalRepository:
if "%LocalRepository%" == "" goto Begin1
goto Begin2
rem -------------------------------------------------------------------

:Begin1
git clone %GlobalRepository%
goto Exit

:Begin2
echo %GlobalRepository%
echo %LocalRepository%
git clone %GlobalRepository% %LocalRepository%
goto Exit

:Exit
