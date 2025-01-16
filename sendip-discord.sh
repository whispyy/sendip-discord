#!/bin/bash

IP=$(curl -s ifconfig.me)

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

MEMORY=$(free -m | awk '/Mem:/ {printf "Used: %d MB, Total: %d MB (%.2f%%)", $3, $2, $3/$2 * 100.0}')

DISK=$(df -h / | awk 'NR==2 {printf "Used: %s, Available: %s, Total: %s (%s)", $3, $4, $2, $5}')

WEBHOOK_URL="https://discord.com/api/webhooks/your-webhook-url-here"
MESSAGE=$(cat <<EOF
Public IP: $IP
CPU Usage: $CPU_USAGE%
Memory: $MEMORY
Disk: $DISK
EOF
)

ESCAPED_MESSAGE=$(echo "$MESSAGE" | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')


curl -H "Content-Type: application/json" -d "{\"content\":\"$ESCAPED_MESSAGE\"}" $WEBHOOK_URL
