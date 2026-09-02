#Get_a_specific_group_By_ID

$groupId = "{3eccea4e-19d4-4840-ab3c-334a2dccf574}"
$group = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/groups/$groupId" -Headers $headers
$group