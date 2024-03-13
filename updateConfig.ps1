param(
   [psobject]$Config,
   [string]$ConfigFilePath
)
function Backup-ConfigFile {
   param(
       [string]$Path
   )
   $backupPath = "$Path.bak"
   Copy-Item -Path $Path -Destination $backupPath -Force
   return $backupPath
}
function Restore-FromBackup {
   param(
       [string]$OriginalPath,
       [string]$BackupPath
   )
   Copy-Item -Path $BackupPath -Destination $OriginalPath -Force
}
$backupPath = Backup-ConfigFile -Path $ConfigFilePath
Start-Sleep 1
try {
   $Config | ConvertTo-Json -Depth 5 | Set-Content -Path $ConfigFilePath
   Write-Host "`nConfiguration successfully updated.`n" -ForegroundColor Green
}
catch {
   Write-Host "Failed to update the configuration. Restoring the original configuration..." -ForegroundColor Red
   Restore-FromBackup -OriginalPath $ConfigFilePath -BackupPath $backupPath
   Write-Host "The original configuration has been restored." -ForegroundColor Yellow
}
finally {
   if (Test-Path $backupPath) {
       Remove-Item -Path $backupPath
   }
}
