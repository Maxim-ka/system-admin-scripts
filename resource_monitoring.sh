#!/usr/bin/env bash

readonly LOG_NAME="monitor.log"
readonly DELAY=10
readonly EXPECTATION=1
readonly MAX_TIME=120

> "$LOG_NAME"

if [ -t 0 ]; then IS_TTY=true; else IS_TTY=false; fi

out(){
    echo -e "Результат в \033[0;32m$LOG_NAME\033[0m"
}

delay(){
    if [ "$IS_TTY" == "true" ]; then 
        for ((i=0; i<DELAY; i++)); do
            if read -t "$EXPECTATION" -n 1 -s; then
                out
                exit 0
            fi
        done
    else 
        sleep $((DELAY * EXPECTATION)) 
    fi 
}

if [ "$IS_TTY" == "true" ]; then 
   echo -e "\033[0;33mДля завершения нажать любую клавишу\033[0m"
else
   START_TIME=$(date +%s)
fi

while [[ "$IS_TTY" == "true" ]] || (( $( date +%s ) - START_TIME <= MAX_TIME )); do
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

if [ "$IS_TTY" != "true" ]; then out; fi 
