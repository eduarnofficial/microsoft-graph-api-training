#Update-an-existing-event:
$eventId = "{event-id}"
$update = @{
    start = @{ dateTime = "2026-09-06T10:00:00"; timeZone = "Indian Standard Time"}
    end   = @{ dateTime = "2026-09-05T11:00:00"; timeZone = "Indian Standard Time"}
} | ConverTo-Json -Depth 3

Invoke-RestMethod -Method Patch -Uri "https://graph.microsoft.com/v1.0/users/$upn/events/$eventId" -Headers $headers
Write-Host "Event rescheduled."  -ForegroundColor Green
