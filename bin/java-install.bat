rem Install JRE8 & JDK8
if not exist Distrib\jdk-windows-x64.exe goto pass_java
if not exist Distrib\jdk-windows-i586.exe goto pass_java
if not exist Distrib\jre-windows-x64.exe goto pass_java
if not exist Distrib\jre-windows-i586.exe goto pass_java
echo "Install Java (JRE8 + JDK8) Update ..."
Distrib\jre-windows-i586.exe /s
Distrib\jre-windows-x64.exe /s
Distrib\jdk-windows-i586.exe /s
Distrib\jdk-windows-x64.exe /s
:pass_java

