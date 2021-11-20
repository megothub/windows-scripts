# Based on https://learntechfuture.com/2018/08/10/find-oldest-email-in-a-exchange-mailbox/
# Run this command against one mailbox, It will dump data to a CSV on your desktop.

Get-MailboxFolderStatistics -ID <mailboxemailaddress> -IncludeOldestAndNewestItems | select Identity, Name, FolderPath, ItemsInFolder, FolderSize, OldestItemReceivedDate | Export-Csv $home\desktop\MB.csv -NoTypeInformation

# Run against all mailboxes, but that will take so much time to export.
# Get-Mailbox -resultsize unlimited| % {Get-MailboxFolderStatistics -id $_ -IncludeOldestAndNewestItems} | select Identity, Name, FolderPath, ItemsInFolder, FolderSize, OldestItemReceivedDate | Export-Csv $home\desktop\AllMB.csv -NoTypeInformation

# Run against set of mailboxes, Copy list of email address in a .txt file and run below command.
# GC $home\desktop\input.txt | % {Get-MailboxFolderStatistics -id $_ -IncludeOldestAndNewestItems} | select Identity, Name, FolderPath, ItemsInFolder, FolderSize, OldestItemReceivedDate | Export-Csv $home\desktop\FewMB.csv -NoTypeInformation
