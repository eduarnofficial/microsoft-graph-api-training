#upload-pdf-file


$fileBytes =[IO.File]::ReadAllBytes("C:\Users\xsr89\hclgraphapidemo11\report.pdf")
Invoke-RestMethod -Method Put -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/root:/report.pdf:/content" -Headers @{ Authorization = $headers.Authorization } -Body $fileBytes -ContentType "application/octet-stream"