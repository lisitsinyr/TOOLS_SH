#!/bin/bash
# -------------------------------------------------------------------
# ubuntu_update_app_git.sh
# -------------------------------------------------------------------

#:begin

#
git --version
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y
git --version

#:Exit

