
$users.value | Select-Object displayName, userPrincipalName, accountEnabled, jobTitle |
    Export-Csv -Path "$env:USERPROFILE\Desktop\AllUsers.csv" -NoTypeInformation
Write-Host "Exported to Desktop\AllUsers.csv"