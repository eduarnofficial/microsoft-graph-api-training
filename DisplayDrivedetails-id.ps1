# List-All-files-Folders-in-root

$items = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/root/children" -Headers $headers
$items.value | Select-Object name, size, lastModifiedDateTime, webUrl | Format-Table -AutoSize