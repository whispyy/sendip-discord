#!/bin/bash

# Get public IP address
IP=$(curl -s ifconfig.me)

# Set webhook URL and message
WEBHOOK_URL="https://discord.com/api/webhooks/your-webhook-url-here"
MESSAGE="IP address: $IP"

# Send message to Discord
curl -H "Content-Type: application/json" -d "{\"content\":\"$MESSAGE\"}" $WEBHOOK_URL
