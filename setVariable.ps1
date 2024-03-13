param(
   [psobject]$Config,
   [array]$CsvData
)
function Select-Header {
   param (
       [string[]]$Headers,
       [string]$PromptMessage
   )
   Write-Host $PromptMessage
   for ($i = 0; $i -lt $Headers.Length; $i++) {
       Write-Host "$($i + 1): $($Headers[$i])"
   }
   Write-Host "`nEnter the number of your selection: " -NoNewLine -ForegroundColor Cyan
   [int]$selection = Read-Host 
   while ($selection -le 0 -or $selection -gt $Headers.Length) {
       Write-Host "Invalid selection. Please try again." -ForegroundColor Red
       $selection = Read-Host "Enter the number of your selection" -ForegroundColor Cyan
   }
   return $Headers[$selection - 1]
}
# Assuming $CsvData is not null and has at least one row
if ($CsvData -ne $null -and $CsvData.Count -gt 0) {
   $headers = ($CsvData | Get-Member -MemberType NoteProperty).Name
   $keySelectionPrompt = "`nPlease choose a column for the key:`n"
   $valueSelectionPrompt = "`nPlease choose a column for the value:`n"
   $selectedKey = Select-Header -Headers $headers -PromptMessage $keySelectionPrompt
   $selectedValue = Select-Header -Headers $headers -PromptMessage $valueSelectionPrompt
   # Prompt for search value
   $searchValue = Read-Host "`nPlease enter the search value for the selected key ($selectedKey)"
   # Update the configuration object
   $Config.key = $selectedKey
   $Config.value = $selectedValue
   $Config.searchValue = $searchValue
   # Return the updated configuration
   return $Config
} else {
   Write-Host "No data available to select headers. Please ensure CSV data is loaded.`n" -ForegroundColor Red
   exit
}