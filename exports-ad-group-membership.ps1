# Exports AD Group membership (AD Group Name, AD Group Description) for list of users

# list of AD accounts
$srcfile = "H:\Documents\users.txt"

$content = Get-Content $srcfile

foreach ($user in $content) {
    # destination CSV files in script's folder
    $filename = 'aduser_' + $user + '.csv'
    Get-ADPrincipalGroupMembership $user | Get-ADGroup -Properties * | select name, description | Export-Csv -Path $filename
}
