#Get-TOp-5-Most-Recent-emails

Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/messages?`$top=5" -Headers $headers |
  Select-Object -ExpandProperty value | Select-Object subject, from, receivedDateTime