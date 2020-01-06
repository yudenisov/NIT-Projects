rem Install JRE8 & JDK8
if not exist Distrib\PowerShell-6.2.1-win-x64.msi goto pass_posh
if not exist Distrib\PowerShell-6.2.1-win-x86.msi goto pass_posh
echo "Install PowerShell Core ..."
%SystemRoot%\system32\msiexec.exe /i Distrib\PowerShell-6.2.1-win-x64.msi /norestart /QN /L*V %TEMP%\pwshx64.log
%SystemRoot%\system32\msiexec.exe /i Distrib\PowerShell-6.2.1-win-x86.msi /norestart /QN /L*V %TEMP%\pwshx32.log
:pass_java

