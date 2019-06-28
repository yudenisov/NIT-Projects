@echo off
if not exist Distrib\duck-install.msi goto pass_Duck
echo "Install Duck..."
%SystemRoot%\system32\msiexec.exe /i Distrib\duck-install.msi /norestart /QN /L*V %TEMP%\duck.log
:pass_Duck
