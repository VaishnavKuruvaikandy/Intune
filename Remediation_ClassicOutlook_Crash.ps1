################################################################################

#Fix Classic Outlook Crashes when Opening or Starting a New Email
#Author : Vaishnav K
#LinkedIn : https://www.linkedin.com/in/vaishnav-k-957b0589/ 
#Website: https://www.anoopcnair.com/author/vaishnavkuruvaikandy

################################################################################

# Define the path to the FORMS2 directory
$Forms2Path = Join-Path -Path $env:LOCALAPPDATA -ChildPath 'Microsoft\FORMS2'

# Check if the directory exists; if not, create it
if (-not (Test-Path -Path $Forms2Path -ErrorAction SilentlyContinue)) {
    $paramNewItem = @{
        Path          = $Forms2Path
        ItemType      = 'Directory'
        Force         = $true
        Confirm       = $false
        ErrorAction   = 'SilentlyContinue'
        WarningAction = 'SilentlyContinue'
    }

    # Create the directory silently
    $null = New-Item @paramNewItem

    # Clear the variable for safety
    $paramNewItem = $null
}

# Clean exit - let Intune re-evaluate detection rules
exit 0