#List-All-Groups
$groups = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/groups" -Headers $headers
$groups.value | Format-Table displayName, mail
