#Create_a-group

$groupBody = @{
    displayName     = "Teams-Admin-Groups"
    mailEnabled     = $false
    mailNickname    = "engteam"
    securityEnabled = $true
} | ConvertTo-Json

$newGroup = Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/groups" -Headers $headers -Body $groupBody
Write-Host "Group created: $($newGroup.displayName) -> $($newGroup.id)" -ForegroundColor Green

