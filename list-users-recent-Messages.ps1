#list-users-recent-Messages

$upn = "user1@ajaykumarbk75gmail.onmicrosoft.com"

$messages = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/messages" -Headers $headers

$messages.value | Select-Object subject, from, receivedDateTime | Format-Table -AutoSize

