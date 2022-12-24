# Set the webhook URL
$WebhookURL = "https://discord.com/api/webhooks/**/**"

# Fetch the current IP address

# $response = Invoke-WebRequest -Uri "http://icanhazip.com"
# $IPAddress = = $response.Content

$url = "http://icanhazip.com"
$client = New-Object System.Net.WebClient
$IPAddress = $client.DownloadString($url)

# Set the message to send
$Message = "IP address: $IPAddress"

# Create the request body in JSON format
$Body = @{
    content = $Message
} | ConvertTo-Json

# Send the POST request to the webhook URL
Invoke-WebRequest -Method Post -Uri $WebhookURL -Body $Body -ContentType "application/json"
