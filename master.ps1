
$sNewUsersCSV = "C:\etc\NewUsers.csv"

$sNewUsers = import-csv $sNewUsersCSV 
foreach ($sNewUser in $sNewUsers) {
    Write-host "Creating User:" ($sNewUser).SamAccountName "with password" ($sNewUser).Password "- Description will be" ($sNewUser).Description -ForegroundColor Magenta
    New-ADUser -SamAccountName ($sNewUser).SamAccountName -name ($sNewUser).SamAccountName -AccountPassword (ConvertTo-SecureString -AsPlainText ($sNewUser).Password -Force) -Description ($sNewUser).description -Path ($sNewUser).Path -Enabled $true
}
