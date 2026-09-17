#!/usr/bin/env bash
readonly LOG_NAME="monitor.log"
readonly DELAY=20
echo "Для завершения нажать любую клавишу"
while true; do
    (
        date "+----------  %Y-%m-%d %H:%M:%S  -----------"
        free -h
        2 -h
        uptime
    ) >> "$LOG_NAME" 2>&1
    for ((i=0; i<=DELAY; i++)); do
        if read -t 0.5 -n 1 -s; then
            exit 0
        fi
    done 
done
echo "Результат в $LOG_NAME"
