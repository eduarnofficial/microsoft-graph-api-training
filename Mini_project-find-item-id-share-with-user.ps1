#Mini_project-find-item-id-share-with-user
#step-1: Get the itemID by name

$items = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/root/children" -Headers $headers

$items.value | Select-Object name, id, webUrl | Format-Table -AutoSize

#Step-2: Get-ID for specific-file

$targetfile = "report.pdf"
$fileItem = $items.value | Where-Object { $_.name -eq $targetfile }

if ($fileItem) {
    $itemId = $fileItem.id
    Write-Host "Found: ($($fileItem.name) | ID: $itemId)" -ForegroundCOlor  Green
} else {
    Write-Warning "File '$taregtFile' not found in root. It may be in a subfolder."
}

#Step-3: Share the file to - any user - with-itemId:
$shareBody = @{
    recipients = @(@{ email = "user1@shrestanitech.com" })
    message = "Sharing this document with you."
    requireSignIn = $true
    sendInvitation = $true
    roles = @("read")
} | ConvertTo-Json -Depth 5

try {
    $shareResponse = Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/items/$itemId/invite" -Headers $headers -Body $shareBody
    Write-Host "Shared successfully!" -ForegroundColor Green
    $shareResponse.value | Select-Object @{N='SharedWith';E={$_.grantedTo.user.displayName}}, roles
} catch {
    $r = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($r)
    Write-Host "SHARE FAILED:" -ForegroundColor Red
    Write-Host $reader.ReadToEnd() -ForegroundColor Yellow
}