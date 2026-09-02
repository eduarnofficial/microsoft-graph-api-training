#read_Only_Subjectand_Body_preview_2-3_lines

Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/messages?`$select=subject, bodyPreview,receivedDateTime, from& `$top=10" -Headers $headers |
  Select-Object -ExpandProperty value |  
  Select-Object subject, from, receivedDateTime, bodyPreview | 
  Format-Table -AutoSize