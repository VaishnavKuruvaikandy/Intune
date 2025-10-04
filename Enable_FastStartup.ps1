##Set the registry value to enable Fast Startup
$RegistryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" 
$PropertyName = "HiberbootEnabled" 
$PropertyValue = 1 
Set-ItemProperty -Path $RegistryPath -Name $PropertyName -Value $PropertyValue -Type DWORD -Force -Confirm:$False