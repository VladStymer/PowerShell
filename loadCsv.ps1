param(
   [string]$CsvName
)
$scriptPath = $PSScriptRoot
$csvPath = Join-Path -Path $scriptPath -ChildPath $CsvName
if (-not (Test-Path $csvPath)) {
   Write-Warning "CSV file not found at path: $csvPath`n" -ForegroundColor Red
   exit
}
$csvData = Import-Csv -Path $csvPath
return $csvData
