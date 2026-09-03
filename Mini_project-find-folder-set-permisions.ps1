#Mini_project-find-folder-set-permisions:

#Step-1:List-Folders-in-user's-OneDrive-Root
$upn = "user1@shrestanitech.com"
$driveId = (Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/users/$upn/drive" -Headers $headers).id

$items = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/root/children" -Headers $headers
$items.value | Where-Object {$_.folder} | Select-Object name, id, webUrl | Format-Table -AutoSize

#Step-2: Find-Specific-FOlder-by-name
$targetFolder = "Onboarding Documents"
$folderItem = $items.value | Where-Object { $_.name -eq $targetFolder -and $_.folder }

if ($folderItem) {
    $folderId = $folderItem.id
    Write-Host "Found: $($folderItem.name) | ID: $folderId" -ForegroundColor Green
} else {
    Write-Warning "Folder '$targetFolder' not found in root."
}

#Step-3: Grant-edit-access-to-user-on-that-folder
$permBody = @{
    recipients = @(@{ email = "user1@shrestanitech.com" })
    message = "You've been given edit access to this folder."
    requireSignIn = $true
    sendInvitation = $true
    roles = @("write")   # "read" for view-only, "write" for edit
} | ConvertTo-Json -Depth 5

try {
    Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/items/$folderId/invite" -Headers $headers -Body $permBody
    Write-Host "Permission granted successfully!" -ForegroundColor Green
} catch {
    $r = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($r)
    Write-Host "PERMISSION GRANT FAILED:" -ForegroundColor Red
    Write-Host $reader.ReadToEnd() -ForegroundColor Yellow
}