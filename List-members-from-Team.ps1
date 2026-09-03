#List-members-from-Team
$teamId = "fd82a843-87aa-4e19-a786-eb5a4ab9fe4a"
$members = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/teams/$teamId/members" -Headers $headers
$members.value | Select-Object displaName, email,role | Format-Table -AutoSize