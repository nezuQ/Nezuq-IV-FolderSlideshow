REM Drag and drop the target folder into this command file. Then, compressed files of each subfolder will be created in the folder where this command file is placed.


cd %~dp0
FOR /F %%i in ('powershell Get-ExecutionPolicy') do set EXEC_POLICY=%%i
powershell Set-ExecutionPolicy Unrestricted -Scope CurrentUser

set ADDRESSES=%*
powershell "%~dp0compressSubFolders2ThisFolder.ps1" %ADDRESSES:"='%

powershell Set-ExecutionPolicy %EXEC_POLICY% -Scope CurrentUser
