# Using loop - check users - ACTIVE / INACTIVE ?
$users = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users?`$select=displayName,userPrincipalName,accountEnabled" -Headers $headers

foreach ($u in $users.value) {
    if ($u.accountEnabled -eq $false) {
        Write-Host "$($u.displayName) - DISABLED" -ForegroundColor Red
    } else {
        Write-Host "$($u.displayName) - ACTIVE" -ForegroundColor Green
    }
}