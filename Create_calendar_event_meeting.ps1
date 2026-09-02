#Create_calendar_event_meeting
$event = @{
    subject = "Sprint planning"
    start = @{ dateTime = "2026-09-05T10:00:00"; timeZone = "Indian Standard Time"}
    end   = @{ dateTime = "2026-09-05T11:00:00"; timeZone = "Indian Standard Time"}
    location = @{ displayName = "Conference Room A" }
    attendees = @(
        @{ emailAddress  = @{  address = "user1@ajaykumarbk75gmail.onmicrosoft.com"}; type = "required" }    
    ) 
} | ConvertTo-Json -Depth 5

Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/users/$upn/events" -Headers $headers -Body $event
Write-Host "Event created." -ForegroundColor Green