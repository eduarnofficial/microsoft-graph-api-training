#Cross-verify-the-folder
$folderResponse =  Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/root/children" -Headers $headers -Body $folderBody

if ($folderResponse.id) {
    Write-Host "[CREATED] FOLDER: $($folderResponse.name) | ID: $($folderResponse.id)" -ForegroundColor -Green
    Write-Host "Web link: $($folderResponse.webUrl)" -ForegroundColor Cyan
} else {
    Write-Warning "[UNEXPECTED] No folder ID returned - check response manually"
}