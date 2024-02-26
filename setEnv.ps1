# set_environment.ps1

# Checking for the presence of required modules
$requiredModules = @('ImportExcel') # Add all necessary modules here
foreach ($module in $requiredModules) {
    if (-not (Get-Module -ListAvailable -Name $module)) {
        Write-Host "Installing required module: $module"
        Install-Module -Name $module -Force -SkipPublisherCheck
    }
    else {
        Write-Host "Module already installed: " -ForegroundColor Yellow -NoNewLine
        Write-Host "$module"
    }
}

# Loading initial configuration
. .\loadConfig.ps1

# Checking that the paths specified in the configuration file exist
if (-not (Test-Path -Path $config.excelPath)) {
    Write-Host "The path to the specified Excel file in the configuration does not exist: $($config.excelPath)" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path -Path $config.csvPath)) {
    Write-Host "The destination path for the specified CSV file in the configuration does not exist, but will be created during export: $($config.csvPath)" -ForegroundColor Yellow
}

Write-Host "The environment is correctly configured.`n" -ForegroundColor Green
