rem Install sordum.org Utils
if not exist Distrib\sordum.org.msi goto pass_Utils
echo "Uninstall sordum.org Uils..."
wmic product where name="Sordum.Org Utils" call uninstall
echo "Install sordum.org Uils..."
%SystemRoot%\system32\msiexec.exe /i Distrib\sordum.org.msi /norestart /QN /L*V %TEMP%\sordum.org.log
:pass_Utils

