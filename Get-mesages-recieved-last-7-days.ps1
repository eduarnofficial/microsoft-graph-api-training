#Get-mesages-recieved-last-7-days

$since = (Get-Date).AddDays(-7).ToString("yyyy-MM-ddTHH:mm:ssZ")
Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/messages?`$filter=receivedDateTime ge $since" -Headers $headers |
   Select-Object -ExpandProperty value | Select-Object subject, receivedDateTime