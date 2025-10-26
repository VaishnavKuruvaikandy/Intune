###############################################################################
#TeamViewer Host x64 Install script
#Author : Vaishnav K
#LinkedIn : https://www.linkedin.com/in/vaishnav-k-957b0589/ 
#Website: https://www.anoopcnair.com/author/vaishnavkuruvaikandy
###############################################################################

$exe = Join-Path -Path $PSScriptRoot -ChildPath 'TeamViewer_Host_Setup_x64.exe'
$args = '/S','/NCRC'

if (-not (Test-Path $exe)) {
    Write-Error "Installer not found: $exe"
    exit 1
}

$proc = Start-Process -FilePath $exe -ArgumentList $args -Wait -PassThru
Write-Output "TeamViewer installer exit code: $($proc.ExitCode)"

# Intune expects exit code 0 for success; pass through the installer exit code
exit $proc.ExitCode
