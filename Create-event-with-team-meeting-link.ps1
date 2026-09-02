#Create-event-with-team-meeting-link
$event = @{
    subject = "Weeklt Sync"
    start = @{ dateTime = "2026-09-05T15:00:00"; timeZone = "Indian Standard Time"}
    end   = @{ dateTime = "2026-09-05T15:30:00"; timeZone = "Indian Standard Time"}
    isOnlineMeeting = $true
    onlineMeetingProvider = "teamsForBusiness"
    attendees = @(
        @{ emailAddress  = @{  address = "user1@ajaykumarbk75gmail.onmicrosoft.com"}; type = "required" } 
        )
} | ConvertTo-Json -Depth 5

$created = Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/users/$upn/events" -Headers $headers
Write-Host "Teams link: $($created.onlineMeeting.joinURL)" -ForegroundColor Cyan