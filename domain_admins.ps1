# Displays Members of "Domain Admins" AD Group
Write-Output "Domain Admins"
$users = Get-adgroupmember "Domain Admins" -recursive | select name,samaccountname, enabled

$counter = 0
$i = 1
$color = $host.ui.rawui.BackgroundColor

foreach ($user in $users.samaccountname) {

    $output = Get-ADUser -Identity $user -Properties * | select Name, sAMAccountName, Enabled
    if ( $output.enabled )
        {
            $host.ui.rawui.BackgroundColor = "Red"
            $counter = $i++
        }
    else
        {
            $host.ui.rawui.BackgroundColor = "Black"
            $counter = $null
        }

    $output | Add-member -passthru "#" ($counter)
}

$host.ui.rawui.BackgroundColor = $color
