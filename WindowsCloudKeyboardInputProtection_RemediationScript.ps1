# =====================================================
# Remediation Script
# Enable Windows Cloud Keyboard Input Protection
# Author : Vaishnav K
# LinkedIn : https://www.linkedin.com/in/vaishnav-k-957b0589/ 
# Website: https://www.anoopcnair.com/author/vaishnavkuruvaikandy
# =====================================================

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$RegName = "fWCIOKeyboardInputProtection"
$RegValue = 1

try {
    if (-not (Test-Path $RegPath)) {
        New-Item -Path $RegPath -Force | Out-Null
    }

    New-ItemProperty `
        -Path $RegPath `
        -Name $RegName `
        -Value $RegValue `
        -PropertyType DWORD `
        -Force | Out-Null

    Write-Output "Remediation successful: Keyboard Input Protection enabled."
    exit 0
}
catch {
    Write-Error "Remediation failed: $_"
    exit 1
}