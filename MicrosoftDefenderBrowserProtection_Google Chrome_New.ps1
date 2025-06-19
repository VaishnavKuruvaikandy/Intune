#######################################################################################

#Microsoft Defender Browser Protection - Google Chrome Browser Extension
#Author : Vaishnav K
#LinkedIn : https://www.linkedin.com/in/vaishnav-k-957b0589/ 
#Website: https://www.anoopcnair.com/author/vaishnavkuruvaikandy

#######################################################################################

# Define extension ID and update URL
$ExtensionId = "bkbeeeffjjeopflfhgeknacdieedcoml"
$UpdateURL = "https://clients2.google.com/service/update2/crx"
$ExtensionValue = " $ExtensionId;$UpdateURL"

# Create registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist"

# Create key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Add the extension to the list (use index 1, or next available)
$index = 1
while (Get-ItemProperty -Path $RegPath -Name "$index" -ErrorAction SilentlyContinue) {
    $index++
}

# Set the registry value
New-ItemProperty -Path $RegPath -Name "$index" -Value $ExtensionValue -PropertyType String -Force

Write-Host "Extension $ExtensionId configured for force installation in Google Chrome."
}