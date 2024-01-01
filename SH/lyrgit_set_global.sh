#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_set_global.sh
# -------------------------------------------------------------------

#:begin
echo "---------------------------------------------"
echo "                                             "
echo "---------------------------------------------"
git config --global user.name "lisitsinyr"

git config --global user.email "lisitsinyr@gmail.com"

git config --list > ~/DATA/GIT/git_config_set_global

#:Exit
