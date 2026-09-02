#Search-using-Graphs-Built-in$search-full-text-search-across-mail
$searchHeaders = $headers.Clone()
$searchHeaders["ConsistancyLevel"] = "eventual"

Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/$upn/messages?`$search=`"Automatic reply`"" -Headers $headers |

 Select-Object -ExpandProperty value | Select-Object subject, from  