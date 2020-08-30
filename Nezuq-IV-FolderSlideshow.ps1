# IrfanView exe file
$IrfanView = 'C:\Program Files\IrfanView\i_view64.exe'
# Temporary file
$TmpFilePath = "$PSScriptRoot\_IrfanView-Slideshow.tmp"
# Number of spaces for natural sort
$NNaturalSortPadding = 20
# Simple natural sort expression
$SimpleNaturalSort = {[regex]::Replace($_, '\d+', {$args[0].Value.PadLeft($NNaturalSortPadding)})}

Set-Content -Path $TmpFilePath -Value '' -Encoding UTF8 -NoNewline

$pictDirPaths = @()
$args | ForEach-Object {
    if($_) {
        if((Get-Item -LiteralPath $_).PSIsContainer){
            # is Directory
            $pictDirPaths += $_
        } else {
            # is Scenario File (UTF8)
            $pictDirPaths += (Get-Content -LiteralPath $_ -Encoding UTF8)
        }
    }
}

$pictDirPaths | ForEach-Object {
    # Natural sort
    (Get-ChildItem -LiteralPath $_ | Sort-Object $SimpleNaturalSort) | ForEach-Object {
        # Output temporary file
        Write-Output ($_.FullName) | Out-File $TmpFilePath -Encoding UTF8 -Append
    }
}

# Show slideshow
Start-Process $IrfanView -ArgumentList @(('/slideshow=' + $TmpFilePath), '/closeslideshow') -Wait

# Delete Temporary file
Remove-Item $TmpFilePath
