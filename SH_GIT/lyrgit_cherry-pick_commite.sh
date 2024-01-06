#
# -------------------------------------------------------------------
# lyrgit_cherry-pick_commite.bat
# ----------------------------------------------------------------------------
# Интегрировать изменения в данном коммите в текущую ветку. [git cherry-pick <commit>]
# ----------------------------------------------------------------------------
# usage: git cherry-pick [--edit] [-n] [-m <parent-number>] [-s] [-x] [--ff]
#                        [-S[<keyid>]] <commit>...
#    or: git cherry-pick (--continue | --skip | --abort | --quit)
# 
#     --quit                end revert or cherry-pick sequence
#     --continue            resume revert or cherry-pick sequence
#     --abort               cancel revert or cherry-pick sequence
#     --skip                skip current commit and continue
#     --[no-]cleanup <mode> how to strip spaces and #comments from message
#     -n, --no-commit       don't automatically commit
#     --commit              opposite of --no-commit
#     -e, --[no-]edit       edit the commit message
#     -s, --[no-]signoff    add a Signed-off-by trailer
#     -m, --[no-]mainline <parent-number>
#                           select mainline parent
#     --[no-]rerere-autoupdate
#                           update the index with reused conflict resolution if possible
#     --[no-]strategy <strategy>
#                           merge strategy
#     -X, --[no-]strategy-option <option>
#                           option for merge strategy
#     -S, --[no-]gpg-sign[=<key-id>]
#                           GPG sign commit
#     -x                    append commit name
#     --[no-]ff             allow fast-forward
#     --[no-]allow-empty    preserve initially empty commits
#     --[no-]allow-empty-message
#                           allow commits with empty messages
#     --[no-]keep-redundant-commits
#                           keep redundant, empty commits
# ----------------------------------------------------------------------------
#

# -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p commite=commite:
if "%branch%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра commite не установлено
goto Exit
# -------------------------------------------------------------------

#:begin
git cherry-pick %commite%

#:exit
