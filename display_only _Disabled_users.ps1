#User is active_Inactive-Report

$users = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users?`$select=displayName,userPrincipalName,accountEnabled" -Headers $headers

$report = $users.value | Select-Object displayName, userPrincipalName, @{N='Status';E={ if ($_.accountEnabled) {"Active"} else {"Disabled"} }}
$report | Export-Csv -Path "$env:USERPROFILE\Desktop\UserStatusReport.csv" -NoTypeInformation
Write-Host "Report saved to Desktop\UserStatusReport.csv"