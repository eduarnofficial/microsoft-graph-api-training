#FIlter-mail-from-speciic-User
Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/messages?`$filter=from/emailAddress/address eq 'yourspecificuser@domain.com'" -Headers $headers |
    
    Select-Object -ExpandProperty value | Select-Object subject, receivedDateTime
