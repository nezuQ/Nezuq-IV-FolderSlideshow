cd %~dp0
FOR /F %%i in ('powershell Get-ExecutionPolicy') do set EXEC_POLICY=%%i
powershell Set-ExecutionPolicy Unrestricted -Scope CurrentUser

set ADDRESSES=%*
powershell "%~dp0Nezuq-IV-FolderSlideshow.ps1" %ADDRESSES:"='%

powershell Set-ExecutionPolicy %EXEC_POLICY% -Scope CurrentUser
