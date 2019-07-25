rem Install Threads Plugin
if not exist Distrib\ThreadsSetup.exe goto pass_Utils
echo "Install Threads Plugin..."
rem Distrib\ThreadsSetup.exe /VERYSILENT /NOCANCEL 
%SystemRoot%\system32\msiexec.exe /i Distrib\ThreadSetup.msi /norestart /QN /L*V %TEMP%\ThreadSetup.log
:pass_Utils

