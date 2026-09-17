#!/usr/bin/env bash

readonly LOG_NAME="monitor.log"
readonly DELAY=20
readonly EXPECTATION=0.5

delay(){
    for ((i=0; i<DELAY; i++)); do
        if read -t "$EXPECTATION" -n 1 -s; then
            echo "Результат в $LOG_NAME"
            exit 0
        fi
    done 
}

echo "Для завершения нажать любую клавишу"
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

