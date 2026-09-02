#Group_the_users_by_department_Count_TOO


$users = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users?`$select=id,displayName,department" -Headers $headers

$users.value | Group-Object department | Select-Object Name, Count, id | Format-Table -AutoSize
