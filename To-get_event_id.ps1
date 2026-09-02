#To-get_event_id

$events = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/events?`$top=5&`$orderby=createdDateTime desc" -Headers $headers
$events.value | Select-Object subject, id, @{N='Start';E={$_.start.dateTime}}