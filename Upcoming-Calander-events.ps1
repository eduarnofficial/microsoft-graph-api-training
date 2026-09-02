#Upcoming-Calander-events:
Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/events?`$top=10&`$orderby=start/dateTime" -Headers $headers |
    Select-Object -ExpandProperty value |
    Select-Object subject, @{N='Start';E={$_.start.dateTime}}, @{N='End';E={$_.end.dateTime}} |
    Format-Table -AutoSize