<#
.SYNOPSIS
  Configure RDP Multipath setting for Windows 365 Cloud PCs

.DESCRIPTION
  This script creates/updates the registry key:
  HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\RdpCloudStackSettings
  with the value:
  SmilesV3ActivationThreshold (DWORD) = 100

.NOTES
Author : Vaishnav K
LinkedIn : https://www.linkedin.com/in/vaishnav-k-957b0589/ 
Website : https://www.anoopcnair.com/author/vaishnavkuruvaikandy/
#>

# Define registry path and values
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RdpCloudStackSettings"
$Name = "SmilesV3ActivationThreshold"
$Value = 100

# Ensure registry path exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Create/Update the registry value
try {
    New-ItemProperty -Path $RegPath -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null
    Write-Output "Registry value $Name set to $Value successfully."
}
catch {
    Write-Error "Failed to set registry value: $_"
}