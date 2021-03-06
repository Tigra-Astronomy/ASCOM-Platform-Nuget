# This script should be run in the project root directory.
# It will look for and push any packages found in the .\Nuget-Packages directory.

$feed = "https://www.myget.org/F/ascom-initiative/api/v2/package"
$symbolFeed = "https://www.myget.org/F/ascom-initiative/symbols/api/v2/package"
Push-Location .\Nuget-Packages
$packages = Get-ChildItem -Filter *.nupkg
foreach ($package in $packages) {
    if ($package.Name -like "*.symbols.nupkg") {
        NuGet.exe push -Source $symbolFeed $package
    }
    else {
        NuGet.exe push -Source $feed $package    
    }
}
Pop-Location