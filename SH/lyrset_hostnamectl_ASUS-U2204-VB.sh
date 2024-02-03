#!/bin/bash
# -------------------------------------------------------------------
# lyrsi_hostnamectl_ASUS-U2204-VB.sh
# -------------------------------------------------------------------

#:begin
echo '01.НАЗВАНИЕ'
echo '    lyrsi_hostnamectl_ASUS-U2204-VB.sh'
echo '02.СИНТАКСИС'
echo '    lyrsi_hostnamectl_ASUS-U2204-VB.sh'
echo '03.ОПИСАНИЕ'
echo '    ***'

echo '---------------------------------------------'
echo ' set-hostname ASUS-U2204-VB '
echo '---------------------------------------------'
hostnamectl set-hostname ASUS-U2204-VB --static
hostnamectl set-hostname 'ASUS-U2204-VB' --pretty

#:Exit

