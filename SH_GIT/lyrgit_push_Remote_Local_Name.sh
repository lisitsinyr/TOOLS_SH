#
# -------------------------------------------------------------------
# lyrgit_push_Remote_Local_Name.bat
# ----------------------------------------------------------------------------
# Отправьте ветку в удаленный репозитарий с другим именем
# ----------------------------------------------------------------------------
# usage: git push [<options>] [<repository> [<refspec>...]]
# 
#     -v, --verbose         be more verbose
#     -q, --quiet           be more quiet
#     --repo <repository>   repository
#     --all                 push all refs
#     --mirror              mirror all refs
#     -d, --delete          delete refs
#     --tags                push tags (can't be used with --all or --mirror)
#     -n, --dry-run         dry run
#     --porcelain           machine-readable output
#     -f, --force           force updates
#     --force-with-lease[=<refname>:<expect>]
#                           require old value of ref to be at this value
#     --force-if-includes   require remote updates to be integrated locally
#     --recurse-submodules (check|on-demand|no)
#                           control recursive pushing of submodules
#     --thin                use thin pack
#     --receive-pack <receive-pack>
#                           receive pack program
#     --exec <receive-pack>
#                           receive pack program
#     -u, --set-upstream    set upstream for git pull/status
#     --progress            force progress reporting
#     --prune               prune locally removed refs
#     --no-verify           bypass pre-push hook
#     --follow-tags         push missing but relevant tags
#     --signed[=(yes|no|if-asked)]
#                           GPG sign the push
#     --atomic              request atomic transaction on remote side
#     -o, --push-option <server-specific>
#                           option to transmit
#     -4, --ipv4            use IPv4 addresses only
#     -6, --ipv6            use IPv6 addresses only
# -------------------------------------------------------------------
#

# -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p Remote=Remote:
if "%Remote%" == "" goto Error_1
goto P2
:Error_1
echo Значение параметра Remote не установлено
goto Exit

# -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p Local=Local:
if "%Local%" == "" goto P2_Error
goto P3
:P2_Error
echo Значение параметра Local не установлено
goto Exit
# -------------------------------------------------------------------

# -------------------------------------------------------------------
:P3
if "%3" == "" goto P3_Input
goto Begin
:P3_Input
set /p Name=Name:
if "%Name%" == "" goto P3_Error
goto Begin
:P3_Error
echo Значение параметра Name не установлено
goto Exit
# -------------------------------------------------------------------

#:begin
echo git Name --track %Remote% %Local%:%Name%

#:exit
