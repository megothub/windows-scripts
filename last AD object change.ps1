$output = Get-ADObject -Filter "sAMAccountName -eq ‘xxxxxx' -and userAccountControl -eq '514'"

foreach ($user in $output)
{
    Get-ADReplicationAttributeMetadata $output -Server DCP01 |
    Where-Object { $_.AttributeName -eq 'UserAccountControl' } | Select Object, LastOriginatingChangeTime |
    Where-Object { $_.LastOriginatingChangeTime -gt (Get-Date).AddDays(-180) }
}
