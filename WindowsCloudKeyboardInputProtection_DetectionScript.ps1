# =====================================================
# Detection Script
# Windows Cloud Keyboard Input Protection
# Author : Vaishnav K
# LinkedIn : https://www.linkedin.com/in/vaishnav-k-957b0589/ 
# Website: https://www.anoopcnair.com/author/vaishnavkuruvaikandy
# =====================================================

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$RegName = "fWCIOKeyboardInputProtection"
$ExpectedValue = 1

try {
    if (Test-Path $RegPath) {
        $CurrentValue = Get-ItemProperty -Path $RegPath -Name $RegName -ErrorAction SilentlyContinue

        if ($null -ne $CurrentValue -and $CurrentValue.$RegName -eq $ExpectedValue) {
            Write-Output "Compliant: Keyboard Input Protection is enabled."
            exit 0
        }
    }

    Write-Output "Non-compliant: Keyboard Input Protection is not enabled."
    exit 1
}
catch {
    Write-Output "Detection error: $_"
    exit 1
}