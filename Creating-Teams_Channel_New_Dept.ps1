#Creating-Teams_Channel_New_Dept
$teamBody = @{
    "template@odata.bind" = "https://graph.microsoft.com/v1.0/teamsTemplates('standard')"
    displayName = "AI-Engineering-Team"
    description = "Team for all AI-Engineering Staff"
} | ConvertTo-Json

Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/teams" -Headers $headers -Body $teamBody