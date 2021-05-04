$TargetPath = $args[0]
Get-ChildItem -LiteralPath $TargetPath | Where-Object { $_.PSIsContainer } | ForEach-Object {
    $name = ($_.Name)
    $destinationPath = "$PSScriptRoot\$name.zip"
    Write-Output $destinationPath
    Compress-Archive -LiteralPath "$TargetPath\$name" -DestinationPath "$destinationPath"
}