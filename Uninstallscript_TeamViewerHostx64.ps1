###############################################################################
#TeamViewer Host x64 Uninstall script
# Reliable uninstall script for TeamViewer Host via Intune Company Portal
#Author : Vaishnav K
#LinkedIn : https://www.linkedin.com/in/vaishnav-k-957b0589/ 
#Website: https://www.anoopcnair.com/author/vaishnavkuruvaikandy
###############################################################################

$UninstallPath = "C:\Program Files\TeamViewer\uninstall.exe"

# Check if uninstall file exists
if (-not (Test-Path $UninstallPath)) {
    Write-Output "TeamViewer uninstall.exe not found at $UninstallPath"
    exit 0 # treat as success if already uninstalled
}

Write-Output "Running TeamViewer Host uninstallation from $UninstallPath..."

try {
    $process = Start-Process -FilePath $UninstallPath -ArgumentList "/S" -WorkingDirectory "C:\Program Files\TeamViewer" -Wait -PassThru
    $exitCode = $process.ExitCode
    Write-Output "Uninstall completed with exit code: $exitCode"

    if ($exitCode -eq 0 -or $exitCode -eq 3010) {
        exit 0
    } else {
        exit $exitCode
    }
}
catch {
    Write-Output "Uninstallation failed: $($_.Exception.Message)"
    exit 1
}
