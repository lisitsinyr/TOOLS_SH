﻿#!/bin/bash
# -------------------------------------------------------------------
# lyrnet_samba_mount.sh
# -------------------------------------------------------------------

#:begin
echo '---------------------------------'
echo ' mount -t cifs '
echo '---------------------------------'
sudo mount -t cifs -o username=lyr,password=Lozudasa100 //192.168.1.31/D /mnt/ASUS-W10P/WORK

#:Exit