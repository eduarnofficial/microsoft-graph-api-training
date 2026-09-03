#Search-entire-Microsoft365-with-Document-id
$documentId = "01LKWS2TBLSEKDJR3LOBD2H34K2HYQJLBS"
$foundItems = @()   #Empty array 
$allDriveIds = @()  #Empty array fpr OneDrive & Sharepoint discovered 


$users = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/users?`$select=id,userPrincipalName&`$top=999" -Headers $headers
foreach ($user in $users.value) {
    try {
        $drive = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/users/$($user.id)/drive" -Headers $headers
        $allDriveIds += @{ DriveId = $drive.id; Source = "OneDrive: $($user.userPrincipalName)" }
    } catch { }
}

$sites = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/sites?search=team" -Headers $headers
foreach ($site in $sites.value) {
    try {
        $siteDrives = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/sites/$($site.id)/drives" -Headers $headers
        foreach ($d in $siteDrives.value) { $allDriveIds += @{ DriveId = $d.id; Source = "Site: $($site.displayName)" } }
    } catch { }
}

foreach ($d in $allDriveIds) {
    try {
        $item = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/drives/$($d.DriveId)/items/$documentId" -Headers $headers
        Write-Host "[FOUND] $($item.name) in $($d.Source)" -ForegroundColor Green
        $foundItems += [PSCustomObject]@{ Name = $item.name; WebUrl = $item.webUrl; Source = $d.Source }
    } catch { }
}

if ($foundItems.Count -gt 0) { $foundItems | Format-Table -AutoSize } else { Write-Warning "Not found in any drive." }