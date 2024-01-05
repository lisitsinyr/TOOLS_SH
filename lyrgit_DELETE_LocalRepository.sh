#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_delete_LocalRepository.sh
# ----------------------------------------------------------------------------
# Удаление локального репозитария в текущей папке
# ----------------------------------------------------------------------------

#:begin
echo "---------------------------------------------"
echo "                                             "
echo "---------------------------------------------"
RD /s/q .git

attrib +A -H .gitignore
del .gitignore

attrib +A -H .gitmodules
del .gitmodules

attrib +A -H .README.md
del .README.md

#:Exit
