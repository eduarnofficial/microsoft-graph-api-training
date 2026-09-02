#Count-Unread-Messages
$unread = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/messages?`$filter=isRead eq false" -Headers $headers

Write-Host "Unread-Count: $($unread.value.Count)"