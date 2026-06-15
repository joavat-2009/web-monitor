#!/bin/bash

echo "==========================================="
echo "                WEB MONITOR      "
echo "==========================================="

LOG_FILE="$HOME/webmon.log"

if [ -z "$1" ]; then 
    echo "Usage: $0 <URL>"
    exit 1 
fi

URL="$1"

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$URL")

echo -e "\n[+] HTTP Code: $HTTP_CODE\n"

if [[ "$HTTP_CODE" -ge 400 ]] || [[ "$HTTP_CODE" -eq 000 ]]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') ALERT: $URL is DOWN (HTTP $HTTP_CODE)" >> "$LOG_FILE"
    
    if command -v notify-send &> /dev/null; then 
        notify-send --urgency=critical "Web Monitor" "$URL is DOWN! (HTTP $HTTP_CODE)"
    fi
    
    echo "Site $URL is DOWN! Log: $LOG_FILE"
else
    echo "Site $URL is UP (HTTP $HTTP_CODE)"
fi

echo "==========================================="
exit 0
