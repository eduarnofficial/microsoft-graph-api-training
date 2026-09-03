#Search-keyword-2

$searchTerm = "report.pdf"
$items = Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/root/*" -Headers $headers
$matches = $items.value | Where-Object { $_.name -like "*$searchTerm*" }

if ($matches) {
    $matches | Select-Object name, webUrl, lastModifiedDateTime | Format-Table -AutoSize
} else {
    Write-Warning "No files matching '$searchTerm' found in root."
}
