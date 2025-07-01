################################################################################

#Fix Classic Outlook Crashes when Opening or Starting a New Email
#Author : Vaishnav K
#LinkedIn : https://www.linkedin.com/in/vaishnav-k-957b0589/ 
#Website: https://www.anoopcnair.com/author/vaishnavkuruvaikandy

################################################################################

# Define the path to the Forms2 directory
$Forms2Path = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Microsoft\FORMS2"

try {
    # Check if the path exists
    if (Test-Path -Path $Forms2Path -ErrorAction SilentlyContinue) {
        # Path exists - successful exit
        exit 0
    } else {
        # Path does not exist - error exit
        exit 1
    }
} catch {
    # Exception occurred - error exit
    exit 1
}
