#!/bin/bash
# -----------------------------------------------
# si.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN_01 ()
#--------------------------------------------------------------------------------
function MAIN_01 () {
#beginfunction
    # Создание файла отчета
    report_file="$HOME/system_report.txt"

    # Запись заголовка в файл отчета
    echo "Отчет о системной информации - $(date)" > "$report_file"
    echo "========================================" >> "$report_file"

    # Системная информация
    echo -e "\nСистемная информация:" >> "$report_file"
    uname -a >> "$report_file"

    # Информация о загрузке системы
    echo -e "\nИнформация о загрузке системы:" >> "$report_file"
    uptime >> "$report_file"

    # Использование дискового пространства
    echo -e "\nИспользование дискового пространства:" >> "$report_file"
    df -h >> "$report_file"

    # Использование памяти
    echo -e "\nИспользование памяти:" >> "$report_file"
    free -h >> "$report_file"

    # Список работающих процессов
    echo -e "\nСписок работающих процессов:" >> "$report_file"
    ps aux --sort=-%mem | head -n 10 >> "$report_file"

    # Сетевые подключения
    echo -e "\nСетевые подключения:" >> "$report_file"
    ss -tuln >> "$report_file"

    # Отправка отчета по электронной почте
    recipient="user@example.com"
    mail -s "Отчет о системной информации" "$recipient" < "$report_file"

    echo "Отчет о системной информации создан и отправлен на $recipient"
}
#endfunction

#--------------------------------------------------------------------------------
# procedure MAIN ()
#--------------------------------------------------------------------------------
function MAIN () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    BASHNAME=$0
    echo Start $BASHNAME ...

    MAIN_01

    return 0
}
#endfunction

#begin
    MAIN

    read -n 1 -s -r -p $'Press any key to continue ...\n'
#end

