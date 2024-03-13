# Specifies the path to the configuration file, defaults to "./config.json"
param(
   [string]$ConfigFilePath = "./config.json"
)
# Load the configuration
$config = . .\LoadConfig.ps1 -ConfigFilePath $ConfigFilePath
# Load CSV data
$csvData = . .\LoadCsv.ps1 -CsvName $config.csvName
# Set or select key/value variables (this step might require user interaction)
$config = . .\SetVariable.ps1 -Config $config -CsvData $csvData
# Update the config file with the newly selected values
. .\UpdateConfig.ps1 -Config $config -ConfigFilePath $ConfigFilePath
# Get the value based on key and search value
. .\GetValue.ps1 -CsvData $csvData -Config $config