@echo off
rem This script install the NIT Projects and Exponenta AdminPack On Computer
rem
if not exist .\nit-projects-environment.msi goto pass_NIT
echo "Install nit-projects-environment..."
%SystemRoot%\system32\msiexec.exe /i nit-projects-environment.msi /norestart /QN /L*V %TEMP%\nit-projects-environment.log
:pass_NIT
if not exist "C:\Program Files\NIT-Projects-Environments\loadhttpmaindistribHidden.bat" goto pass_Load
echo "Install loadhttpmaindistribHidden..."
"C:\Program Files\NIT-Projects-Environments\loadhttpmaindistribHidden.bat" >> %TEMP%\nit-projects-environment.log
:pass_Load
if not exist "C:\Program Files (x86)\NIT-Projects-Environments\loadhttpmaindistribHidden.bat" goto pass_Loadx86
echo "Install loadhttpmaindistribHiddenx86..."
"C:\Program Files (x86)\NIT-Projects-Environments\loadhttpmaindistribHidden.bat" >> %TEMP%\nit-projects-environment.log
:pass_Loadx86
