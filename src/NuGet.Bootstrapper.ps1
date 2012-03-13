# NOTE: This script must be run from the Package Manager Console in Visual Studio.

# Get all projects in the solution.
foreach ($project in (Get-Project -All)) {

    # Get the directory of the project file.
    $project_dir = Split-Path -Parent $project.FullName
    
    # Look for a packages.config file for this project.
    $package_config_file = Join-Path $project_dir "packages.config"
    
    if (Test-Path $package_config_file) {
        
        # Read the packages.config xml file.
        $xml = [xml](Get-Content $package_config_file)
        $package_count = $xml.packages.package.count

        # Run Install-Package <packageName> -Version <version> -Project <project> for each package.
        for ($i=0; $i -le $package_count - 1; $i++) {
            $pkg = $xml.packages.package[$i]
            
            # Only install the package if it isn't already installed.
            if ((Get-Package | where { $_.Id -eq $pkg.id }) -eq $null) {
                Install-Package $pkg.id -Version $pkg.version -Project $project.ProjectName
            }
        }
        
    }
}