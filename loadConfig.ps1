param(
   [string]$ConfigFilePath
)
function Load-Config {
   param(
       [string]$Path
   )
   $configContent = Get-Content -Path $Path -Raw | ConvertFrom-Json
   return $configContent
}
$config = Load-Config -Path $ConfigFilePath
return $config
