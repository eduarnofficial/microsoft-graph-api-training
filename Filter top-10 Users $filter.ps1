# Filter top-10 Users $filter --###Method2

#(Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users?`$select=displayName,mail,department&`$top=10" -Headers $headers).value | Format-Table -AutoSize

$result = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users?`$select=displayName,mail,department&`$top=10" -Headers $headers
$result.value | Format-Table displayName,mail,department -AutoSize