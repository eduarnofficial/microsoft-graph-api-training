#Create-New-Doc-OneDrive-Sharepoint

$driveId = (Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/users/$upn/drive" -Headers $headers).id

$folderBody = @{
    name = "Onboarding Documents"
    folder = @{}
    "@microsoft.graph.conflictBehavior" = "rename"
} | ConvertTo-Json

Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/root/children" -Headers $headers -Body $folderBody