#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_grub.sh
# -------------------------------------------------------------------

#:begin
echo '---------------------------------------------'
echo '                                             '
echo '---------------------------------------------'
sudo add-apt-repository ppa:danielrichter2007/grub-customizer

sudo apt-get update

sudo apt install grub-customizer

#:Exit

