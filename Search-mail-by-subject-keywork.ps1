#Search-mail-by-subject-keywork

Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/messages?`$filter=contains(subject,'Test') " -Headers $headers |

Select-Object -ExpandProperty value | Select-Object subject, from  