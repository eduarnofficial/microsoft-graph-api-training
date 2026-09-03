#Check-availability-multiple-users
$scheduledBody = @{
   schedules = @("user1@yourdomain.com","user2@yourdomain.com")
   startTime = @{ dateTime = "2026-09-03T09:00:00"; timeZone = "India Standard Time" }
   endTime   = @{ dateTime = "2026-09-05T18:00:00"; timeZone = "India Standard Time" }
   availabilityViewInterval = 30
} | ConvertTo-Json -Depth 4

Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/users/$upn/calendar/getSchedule" -Headers $headers -Body $scheduledBody