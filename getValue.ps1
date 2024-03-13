param(
   [array]$CsvData,
   [psobject]$Config
)
# Search process and value display, similar to your initial logic
foreach ($row in $CsvData) {
   if ($row.$($Config.key) -eq $Config.searchValue) {
       Write-Host "Match found: " -NoNewLine
       Write-Host "$($row.$($Config.value))`n" -ForegroundColor Green
       return
   }
}
Write-Warning "No match found.`n"
