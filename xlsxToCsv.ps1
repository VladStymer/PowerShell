# Import data from Excel file
$data = Import-Excel -Path $config.excelPath -WorksheetName $config.sheetName -StartRow 6

# Initialise a list to store transformed data
$transformedData = @()


# Check that $data has at least one element to avoid errors
if ($data.Count -gt 0) {
    # Get the column names from line $startingLine
    $columnNames = $data[$config.startingLine].psobject.Properties.Name

    foreach ($row in $data) {
        # Create a hashtable to store the object's data dynamically
        $objProperties = @{}

        foreach ($columnName in $columnNames) {
            $objProperties[$columnName] = $row.$columnName
        }

        $obj = New-Object -TypeName PSCustomObject -Property $objProperties

        $transformedData += $obj
    }
}

# Export transformed data in CSV format
$transformedData | Export-Csv -Path $config.csvPath -NoTypeInformation

Write-Host "Conversion complete" -ForeGroundColor Green
Write-Host "The data is saved in $($config.csvPath) `n"
