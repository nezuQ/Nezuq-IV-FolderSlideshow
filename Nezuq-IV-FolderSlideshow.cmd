cd %~dp0
FOR /F %%i in ('powershell Get-ExecutionPolicy') do set EXEC_POLICY=%%i
powershell Set-ExecutionPolicy Unrestricted -Scope CurrentUser

set ADDRESSES=%*
set ADDRESSES2=%ADDRESSES:'=''%
set ADDRESSES3=%ADDRESSES2:&=^&%
powershell "%~dp0Nezuq-IV-FolderSlideshow.ps1" %ADDRESSES3:"='%

powershell Set-ExecutionPolicy %EXEC_POLICY% -Scope CurrentUser
