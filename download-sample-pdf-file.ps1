#download-sample-pdf-file


Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/v1.0/drives/$driveId/root:/report.pdf:/content" -Headers @{ Authorization = $headers.Authorization } -OutFile "C:\Users\xsr89\Downloads\reports.pdf"