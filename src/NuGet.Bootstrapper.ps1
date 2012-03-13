# At the moment, only works if the script is ran from the directory that contains the bootstrap and project file.
$PROJECT_FILE = Get-ChildItem -Recurse -Include *.csproj
$PROJECT_NAME = $PROJECT_FILE.Name

$BOOTSTRAP_FILE = "packages.bootstrap"

# step 3:  read the packages.config xml file
$xml = [xml](Get-Content $BOOTSTRAP_FILE)
$package_count = $xml.packages.package.count

# step 4: run install-package <packageName> -Version <version> -Project <project> for each package
for ($i=0; $i -le $package_count - 1; $i++) {
    $pkg = $xml.packages.package[$i]
    install-package $pkg.id -Version $pkg.version
}

# step 5: Update packages?