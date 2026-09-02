#Dipslay-Senders-name-email-details

Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/messages?`$select=subject,from,receivedDateTime&`$top=10" -Headers $headers |
    Select-Object -ExpandProperty value |
    Select-Object subject,
        @{Name='FromName'; Expression={$_.from.emailAddress.name}},
        @{Name='FromEmail'; Expression={$_.from.emailAddress.address}},
        receivedDateTime |
    Format-Table -AutoSize
      