#User is active/Inactive-Tabular-fashion

$users = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users?`$select=displayName,userPrincipalName,accountEnabled" -Headers $headers

$users.value | Select-Object displayName, userPrincipalName, @{N='Status';E={if($_.accountEnabled){"Active"} else {"Disabled"}}} | Format-Table -AutoSize