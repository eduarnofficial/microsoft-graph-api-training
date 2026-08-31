#List-of-Devices-in-the-tenant
Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/devices" -Headers $headers | Select-Object -ExpandProperty value | Format-Table displayName, operatingSystem
