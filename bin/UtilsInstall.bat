rem Install Utils Plugin
if not exist Distrib\UtilSetup.exe goto pass_Utils
echo "Install Utils Plugin..."
Distrib\UtilSetup.exe /VERYSILENT /NOCANCEL 
:pass_Utils

