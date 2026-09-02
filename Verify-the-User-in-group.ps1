#Verify-the-User

$groupId = "435fc2e0-c255-4464-9bf6-7deffc19184c"
$members = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/groups/$groupId/members" -Headers $headers
$members.value | Select-Object displaName, userprincipalName