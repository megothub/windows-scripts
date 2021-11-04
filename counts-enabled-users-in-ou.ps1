# Counts Enabled users in specific OU
(Get-ADUser -Filter {Enabled -eq $true} | where{$_.distinguishedname -like "*OU=USER,DC=domain,DC=internal"}).count
