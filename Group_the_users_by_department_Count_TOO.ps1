#Users-Created_After-Specific-date

$since = "2023-01-01T00:00:00Z"
Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users?`$filter=createdDateTime ge $since&`$select=displayName,createdDateTime" -Headers $headers |
  Select-Object -ExpandProperty value | Format-Table -AutoSize
