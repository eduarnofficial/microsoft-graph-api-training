# Sign-in-Logs-for-2-Hours&Exort_to_CSV

$since = (Get-Date).AddDays(-1).ToString("yyyy-MM-ddTHH:mm:ssZ")
$signIns = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/auditLogs/signIns?`$filter=createdDateTime ge $since" -Headers $headers
$signIns.value | Select-Object userPrincipalName, createdDateTime, status