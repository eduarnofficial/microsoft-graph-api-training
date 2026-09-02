#User is active/Inactive-Just count

$users = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users?`$select=displayName,userPrincipalName,accountEnabled" -Headers $headers

$disabledUsers = $users.value | Where-Object { $_.accountEnabled -eq $false }
$disabledUsers | Select-Object displayName, userPrincipalName | Format-Table -AutoSize
Write-Host "Total disabled: $($disabledUsers.Count)"