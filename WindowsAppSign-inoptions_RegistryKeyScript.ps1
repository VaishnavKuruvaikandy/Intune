# =====================================================
# To Add Windows App’s Sign-in options Registry Key
# Author : Vaishnav K
# LinkedIn : https://www.linkedin.com/in/vaishnav-k-957b0589/ 
# Website: https://www.anoopcnair.com/author/vaishnavkuruvaikandy
# =====================================================

$RegistryPath = "HKLM:\SOFTWARE\Microsoft\WindowsApp"
$KeyName = "Flights"
$FullPath = Join-Path $RegistryPath $KeyName
$ValueName = "EnableIdSignInUx"
$ValueData = 1

try {
    # Create registry key if it doesn't exist
    if (!(Test-Path $FullPath)) {
        New-Item -Path $RegistryPath -Name $KeyName -Force | Out-Null
        Write-Output "Registry key created: $FullPath"
    }
    else {
        Write-Output "Registry key already exists: $FullPath"
    }

    # Set registry value
    Set-ItemProperty -Path $FullPath -Name $ValueName -Value $ValueData -Type DWord

    Write-Output "Registry value '$ValueName' set to '$ValueData' successfully."
}
catch {
    Write-Error "Failed to configure registry setting. Error: $_"
}
