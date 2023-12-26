#!/bin/bash
# -------------------------------------------------------------------
# ubuntu_set_keyboard.sh
# -------------------------------------------------------------------

#:begin

# <Ctrl>Shift_R
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Ctrl>Shift_R']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Ctrl>Shift_R']"

# <Shift>Alt_L
# gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
# gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"

#:Exit

