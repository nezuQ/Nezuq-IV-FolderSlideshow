if not "%~0"=="%~dp0.\%~nx0" (
    start /min cmd /c,"%~dp0.\%~nx0" %*
    exit
)

cd /D %~dp0

set ADDRESSES=%*
set ADDRESSES2=%ADDRESSES:'=''%
set ADDRESSES3=%ADDRESSES2:&=^&%

powershell -NoProfile -ExecutionPolicy Unrestricted "%~dp0Nezuq-IV-FolderSlideshow.ps1" %ADDRESSES3:"='%
