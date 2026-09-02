#User is active/Inactive-Just count

$users = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users?`$select=accountEnabled" -Headers $headers
$active = ($users.value | Where-Object { $_.accountEnabled -eq $true }).Count
$disabled = ($users.value | Where-Object { $_.accountEnabled -eq $false }).Count

Write-Host "Active users: $active"
Write-Host "Disabled users: $disabled"