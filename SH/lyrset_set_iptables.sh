﻿#!/bin/bash
# -------------------------------------------------------------------
# lyrset_set_iptables.sh
# -------------------------------------------------------------------

#begin
    # --------------------------------------------
    # set_iptables
    # --------------------------------------------
    # порт 445 используется для samba
    sudo iptables -I INPUT -p tcp --dport 445 -j ACCEPT

    # порты 137, 138 и 139 для работы NetBIOS (использование имени компьютера для доступа
    sudo iptables -I INPUT -p udp --dport 137:138 -j ACCEPT
    sudo iptables -I INPUT -p tcp --dport 139 -j ACCEPT

    #sudo apt-get update && sudo apt-get install iptables-persistent
    sudo apt update && sudo apt install iptables-persistent

    # Применяем настройки
    sudo netfilter-persistent save

#end

