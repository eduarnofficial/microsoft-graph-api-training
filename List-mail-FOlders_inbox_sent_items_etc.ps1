#List-mail-FOlders_inbox_sent_items_etc
Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/mailFolders" -Headers $headers |
    Select-Object -ExpandProperty value | Select-Object displayName, totalItemCount, unreadItemCount