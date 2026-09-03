#Search-for-files-Keyword-method-1
$searchTerm = "report.pdf"
$searchResults = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/root/search(q='$searchTerm')" -Headers $headers
$searchResults.value | Select-Object name, webUrl, lastModifieDateTime | Format-Table -AutoSize
