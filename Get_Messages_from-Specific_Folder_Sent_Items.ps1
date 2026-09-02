#Get_Messages_from-Specific_Folder_Sent_Items

Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/mailFolders/SentItems/messages" -Headers $headers |
  Select-Object -ExcludeProperty value | Select-Object subject, toRecipients