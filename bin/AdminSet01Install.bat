rem Install AdminScripts Plugin
if not exist Distrib\AdminScriptsSet01.exe goto pass_AdminScripts
echo "Install AdminScripts Plugin..."
Distrib\AdminScriptsSet01.exe /VERYSILENT /NOCANCEL 
:pass_AdminScripts

