##Get-Specific-teams-details
$teamId = "94dd3423-ae30-4c55-ba6f-be15b0c121e4"
$team = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/teams/$teamId" -Headers $headers
$team | Select-Object displayName, description, internalId