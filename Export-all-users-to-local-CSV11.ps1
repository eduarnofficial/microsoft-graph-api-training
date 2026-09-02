# Export-all-users-to-local-CSV
$users = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users" -Headers $headers

$exportPath = "$env:USERPROFILE\Desktop\AllUsers.csv"

# Ensure the Desktop folder actually exists before exporting
if (-not (Test-Path "$env:USERPROFILE\Desktop")) {
    New-Item -ItemType Directory -Path "$env:USERPROFILE\Desktop" -Force | Out-Null
}

$users.value | Select-Object displayName, userPrincipalName, accountEnabled, jobTitle |
    Export-Csv -Path $exportPath -NoTypeInformation

Write-Host "Exported to $exportPath"