if (-not $config.csvPath -or -not $config.key -or -not $config.searchValue) {
    Write-Host "The configuration is incomplete. Check that the file path, search key and search value are specified." -ForegroundColor Red
    return
}

if (Test-Path -Path $config.csvPath) {
    $donneesCsv = Import-Csv -Path $config.csvPath
} else {
    Write-Host "The CSV file specified does not exist : $($config.csvPath)" -ForegroundColor Red
    return
}

# Import data from CSV
try {
    $donneesCsv = Import-Csv -Path $config.csvPath -ErrorAction Stop
} catch {
    Write-Host "Error importing CSV file : $($_.Exception.Message)" -ForegroundColor Red
    return
}

# Search for the matching line
$matchedLine = $donneesCsv | Where-Object { $_.$($config.key) -eq $config.searchValue }

# Return the value searched
if ($matchedLine -ne $null) {
    $result = $matchedLine.$($config.value)
    Write-Host "IP match with $($config.searchValue) and is : " -NoNewLine
    Write-Host "$result`n" -ForegroundColor Green 
} else {
    Write-Host "No match found for $($config.searchValue)"
}
