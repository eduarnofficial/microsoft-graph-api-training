# List-a-Teams-in-tenent

$teams = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/groups?`$filter=resourceProvisioningOptions/Any(x:x eq 'Team')" -Headers $headers
$teams.value | Select-Object displaName, id, mail | Format-Table -AutoSize
