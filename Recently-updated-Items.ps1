#Recently-updated-Items

$recent = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/root/children?`$orderby=lastModifiedDateTime desc&`$top=10" -Headers $headers
$recent.value | Select-Object name, lastModifiedDateTime, @{N='ModifiedBy';E={$_.lastModifiedBy.user.displayName}} | Format-Table -AutoSize


