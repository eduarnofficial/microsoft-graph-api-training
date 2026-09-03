#List-all-channels-in-a-team
$teamId = "50ff4757-52bf-449a-9195-1afa0284e036"
$channels = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/teams/$teamId/channels" -Headers $headers
$channels.value | Select-Object displaName, id,membershipType | Format-Table -AutoSize
