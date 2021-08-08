Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

Install-Module -Name DSInternals -Force

$bootkey = Get-BootKey -SystemHivePath 'C:\users\mRr3b00t\Downloads\nt_audit\registry\SYSTEM'

$ntdsaudit = Get-ADDBAccount -All -DBPath 'C:\Users\mRr3b00t\Downloads\nt_audit\Active Directory\ntds.dit' -bootkey $bootkey

foreach($object in $ntdsaudit){


If($object.NTHash.Count -ne 0){
$nthash = $object.NTHash | ConvertTo-Hex
$hash = [String]::Join('',$nthash);
write-host $object.SamAccountName","$hash
$hash | Out-File "C:\users\mRr3b00t\Desktop\cracking_hashes.txt" -NoClobber -Append
}
}
