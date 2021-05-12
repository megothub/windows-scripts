(Get-ADUser -Filter {Enabled -eq $true} | where{$_.distinguishedname -like "*OU=USER,DC=company,DC=intern"}).count
