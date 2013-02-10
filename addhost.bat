@echo off
rem Addhost v1.2 by Will Boyd

set sitename=Default Web Site
set hostfilepath=%windir%\System32\drivers\etc\hosts
set appcmdpath=%windir%\system32\inetsrv\appcmd

echo Checking privileges...
net session >nul 2>&1
if not %ERRORLEVEL% == 0 (
    echo This script must be run with administrator privileges.
    goto end
)

set hostname=%1
if "%1"=="" (
	set /p hostname="Enter the hostname to add (ex: dev.potato.com): "
)

echo Appending to hosts file...
echo.>>%hostfilepath%
echo 127.0.0.1   %hostname%>>%hostfilepath%

echo Adding binding...
%appcmdpath% set site /site.name:"%sitename%" /+bindings.[protocol='http',bindingInformation='*:80:%hostname%']>nul

echo Restarting site...
%appcmdpath% stop site /site.name:"%sitename%">nul
%appcmdpath% start site /site.name:"%sitename%">nul

echo Done. Go nuts!

:end

echo.
pause