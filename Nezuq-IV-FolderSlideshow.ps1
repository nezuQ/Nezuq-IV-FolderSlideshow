# IrfanView exe file
$IrfanView = 'C:\Program Files\IrfanView\i_view64.exe'
# Temporary folder (Unzipped image folder)
$TmpDirPath = "$PSScriptRoot\__temp__\" + (Get-Date -Format "yyyyMMdd-hhmmss")
# Temporary file (Image file paths)
$TmpFilePath = "$TmpDirPath\_slideshow.tmp"
# Number of spaces for natural sort
$NNaturalSortPadding = 20

function isZip($path){
    <#
        .SYNOPSIS
        Determine if it is the ZIP file.

        .DESCRIPTION
        Returns true if the extension is "zip".

        .PARAMETER path
        Target file path
    #>
    if((Get-Item -LiteralPath $path).Extension -eq '.zip') {
        return $TRUE
    }
    return $FALSE
}

function sortPaths($paths){
    <#
        .SYNOPSIS
        Sort multiple paths.

        .DESCRIPTION
        Returns the sorted paths.

        .PARAMETER path
        Target file paths
    #>
    return ($paths | Sort-Object {[regex]::Replace($_, '\d+', {$args[0].Value.PadLeft($Script:NNaturalSortPadding)})})
}

$cntTmpImgDir = 0
function unzipImgDir($path){
    <#
        .SYNOPSIS
        Unzip the image folder to the temporary folder.

        .DESCRIPTION
        Returns the path to the image folder.

        .PARAMETER path
        Target file path
    #>
    $Script:cntTmpImgDir += 1
    $tmpImgDirPath = "$TmpDirPath\$Script:cntTmpImgDir"
    Expand-Archive -LiteralPath $path -DestinationPath $tmpImgDirPath -Force
    $tmpChildImgDirPaths = sortPaths((Get-ChildItem -LiteralPath $tmpImgDirPath).FullName)
    $cntChildTmpImgDir = 0
    foreach($tmpChildImgDirPath in $tmpChildImgDirPaths) {
        $cntChildTmpImgDir = $cntChildTmpImgDir + 1
        Rename-Item -LiteralPath $tmpChildImgDirPath -NewName $cntChildTmpImgDir
    }
    return sortPaths((Get-ChildItem -LiteralPath $tmpImgDirPath).FullName)
}

function filterTestPath($paths){
    <#
        .SYNOPSIS
        Extract only existing paths.

        .DESCRIPTION
        If the path exists, return the path.

        .PARAMETER path
        Target file paths
    #>
    return ($paths | Where-Object {return Test-Path -LiteralPath $_})
}

# Args
$targetPaths = $args

# Delete temporary folder if exist
if(Test-Path $TmpDirPath){
    Remove-Item -LiteralPath $TmpDirPath -Recurse -Force
}

# Create temporary folder
New-Item -Path $TmpDirPath -ItemType Directory

# Create temporary file
Set-Content -LiteralPath $TmpFilePath -Value '' -Encoding UTF8 -NoNewline

$pictDirPaths = @()
$targetPaths | ForEach-Object {
    if(filterTestPath($_)) {
        $item = (Get-Item -LiteralPath $_) 
        if($item.PSIsContainer){
            # is Folder
            $pictDirPaths += $_
        } elseif (isZip($_)) {
            # is Zip File (Zipped image folder)
            $pictDirPaths += unzipImgDir($_)
        } else {
            # is Path File (UTF8)
            $paths = @()
            (Get-Content -LiteralPath $_ -Encoding UTF8) | ForEach-Object {
                if(isZip($_)) {
                    $paths += unzipImgDir($_)
                }else{
                    $paths += $_
                }
            }
            $pictDirPaths += $paths
        }
    }
}

# Output image paths to the temporary file
filterTestPath($pictDirPaths) | ForEach-Object {
    if((Get-Item -LiteralPath $_).PSIsContainer){
        # is Folder
        sortPaths((Get-ChildItem -LiteralPath $_).FullName) | ForEach-Object {
            Write-Output($_) | Out-File $TmpFilePath -Encoding UTF8 -Append
        }
    } else {
        # is File
        Write-Output($_) | Out-File $TmpFilePath -Encoding UTF8 -Append
    }
}

# Show slideshow
Start-Process $IrfanView -ArgumentList @(('/slideshow=' + $TmpFilePath), '/closeslideshow') -Wait

# Delete temporary folder
Remove-Item -LiteralPath $TmpDirPath -Recurse -Force
