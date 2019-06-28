rem Install Threads Plugin
if not exist Distrib\ThreadsSetup.exe goto pass_Utils
echo "Install Threads Plugin..."
Distrib\ThreadsSetup.exe /VERYSILENT /NOCANCEL 
:pass_Utils

