@echo off
setlocal

set "PS1=%~dp0RunescapeSetup_temp.ps1"

echo Creating PowerShell launcher...

(
echo $ErrorActionPreference = "Stop"
echo Write-Host "SCRIPT STARTED"
echo.
echo.
echo.
echo.
echo.
echo # Jagex Launcher
echo if (-not (Get-Process "JagexLauncher" -ErrorAction SilentlyContinue)) {
echo     Write-Host "->> Launching << -- Jagex Launcher"
echo     Start-Process "C:\Program Files (x86)\Jagex Launcher\JagexLauncher.exe"
echo }
echo else {
echo     Write-Host "ALREADY RUNNING: Jagex Launcher"
echo }
echo.
echo.
echo # OBS
echo if ^(-not ^(Get-Process "obs64" -ErrorAction SilentlyContinue^)^) {
echo     Write-Host "^^-^^^>^^^> Launching ^^^<^^^< -- OBS"
echo     Start-Process "C:\Program Files\obs-studio\bin\64bit\obs64.exe" -WorkingDirectory "C:\Program Files\obs-studio\bin\64bit"
echo } else {
echo     Write-Host "ALREADY RUNNING: OBS"
echo }
echo.
echo.
echo # Discord
echo if ^(-not ^(Get-Process "Discord" -ErrorAction SilentlyContinue^)^) {
echo     Write-Host "^^-^^^>^^^> Launching ^^^<^^^< -- Discord"
echo     Start-Process "%LOCALAPPDATA%\Discord\Update.exe" "--processStart Discord.exe"
echo } else {
echo     Write-Host "ALREADY RUNNING: Discord"
echo }
echo.
echo.
echo Read-Host "Press Enter to close"
) > "%PS1%"

start powershell.exe -ExecutionPolicy Bypass -NoExit -File "%PS1%"

timeout /t 3 >nul

:wait
del "%PS1%" /F >nul 2>&1
if exist "%PS1%" (
    timeout /t 1 >nul
    goto wait
)

endlocal
