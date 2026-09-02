#read_Only_Subjectand_Body_preview_

Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/messages?`$select=subject, bodyPreview,receivedDateTime& `$top=10" -Headers $headers |
  Select-Object -ExpandProperty value |  Select-Object subject, from, receivedDateTime  | Format-Table -AutoSize