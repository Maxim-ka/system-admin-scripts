#!/usr/bin/env bash

readonly LOG_NAME="monitor.log"
readonly DELAY=20
readonly EXPECTATION=0.5

> "$LOG_NAME"

delay(){
    for ((i=0; i<DELAY; i++)); do
        if read -t "$EXPECTATION" -n 1 -s; then
            echo -e "Результат в \033[0;32m$LOG_NAME\033[0m"
            exit 0
        fi
    done 
}

echo -e "\033[0;33mДля завершения нажать любую клавишу\033[0m"
while true; do
    (
        date "+--------------------  %Y-%m-%d %H:%M:%S  -----------------------"
        free -h
        printf "\n\n"
        df -h
        printf "\n\n"
	uptime
        echo "----------------------------------------------------------------"
        printf "\n\n"
    ) >> "$LOG_NAME" 2>&1
    delay
done

