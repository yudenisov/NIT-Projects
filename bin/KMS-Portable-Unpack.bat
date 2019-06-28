@echo off
set Chocolatey=%ALLUSERSPROFILE%\chocolatey

if not exist Distrib\KMS_Tools.zip goto pass_KMS
if not exist %Chocolatey%\bin\unzip.exe goto pass_KMS
echo "Unpack KMS..."
%Chocolatey%\bin\unzip.exe -u -qq -o Distrib\KMS_Tools.zip
:pass_KMS
