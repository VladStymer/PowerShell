param(
    [string]$ConfigFilePath = "./config.json"
)

try {
    # Load the Json config
    $config = Get-Content $ConfigFilePath -ErrorAction Stop | ConvertFrom-Json
    Write-Host "`nContents of the loaded configuration:" -ForeGroundColor Green

    foreach ($key in $config.PSObject.Properties.Name) {
        $value = $config.$key
        Write-Host "$key : $value"
    }
    Write-Host "`n"
} catch {
    Write-Error "Error loading the configuration file: $_" -ForeGroundColor Red
    exit 1
}