#Delete_event-

$eventId = "{event-id}"
Invoke-RestMethod -Method Delete -Uri "https://graph.microsoft.com/v1.0/users/$upn/events/$eventId" -Headers $headers
Write-Host "Event deleted." -ForegroundColor Yellow