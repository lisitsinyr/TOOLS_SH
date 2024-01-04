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

git config --list > ~/DATA/GIT/GIT_CONFIG_set_global

#:Exit
