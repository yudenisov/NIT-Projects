rem Файл загрузки и установки дистрибутивов для Админ-пака (Академический вариант)
rem USAGE
rem > URLLoadAdminPack.bat
rem Запускать файл с правами администратора

rem Данный файл должен быть переопределён для каждого нового места хранения
rem инсталляционных файлов админ-пака
rem С целью секретности данный файл не помещён в открытое хранилище GitHub

rem По-умолчанию место хранения инсталляционных файлов Админ-пака Экспонента:
rem http://anticriminalonline.ru/Exponenta

rem Инициализируем переменные окружения скрипта

SetLocal EnableExtensions EnableDelayedExpansion

set curdirforurl=%CD%

rem Очищаем и создаём вновь каталог со скаченными с сайта дистрибутивами:
rd /S /Q %curdirforurl%\Distrib
md %curdirforurl%\Distrib
%SystemRoot%\System32\attrib.exe +H %curdirforurl%\Distrib

rem Читаем настройки из файла settings.txt, который должен располагаться в
rem том же каталоге, что и bat-файл. Если не удалось распарсить настройки -
rem выходим с ненулевым кодом возврата.
call :read_settings %~dp0\installmaindistrib.tmp.ini || exit /b 1

rem Настраиваем переменные окружения для команды Wget

rem Определяем переменные:

rem Настройки по умолчанию
rem Основная папка
rem set httpMainFolder=Exponenta
rem Префикс протокола
rem set httppref=http
rem HTTP Port
rem set httpport=80

rem HTTP WebDAV Host
set host=%httppref%://%httphost%:%httpport%/%httpMainFolder%
rem Локальный каталог
set LocalFolder=%curdirforurl%\Distrib

rem Разрешаем все протоколы для wget.exe в брандмауэре
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=in action=allow program="%curdirforurl%\wget.exe" enable=yes
rem Разрешаем все протоколы для wget.exe в брандмауэре
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=out action=allow program="%curdirforurl%\wget.exe" enable=yes

rem Запускаем на выполнение команды WGET
rem !!! Изменяемая величина! Проверять перед использованием !!!

rem wget -c -t 2 --content-disposition %host%/InstallMainExponenta.bat

rem Main Files
wget -c -t 2 -O %curdirforurl%\prechocoinstall.bat %host%/prechocoinstall.bat
wget -c -t 2 -O %LocalFolder%\ExponentaMainFilesSetup.exe %host%/ExponentaMainFilesSetup.exe
wget -c -t 2 -O %LocalFolder%\HiddenStartSetupRePack.exe %host%/HiddenStartSetupRePack.exe
wget -c -t 2 -O %LocalFolder%\dotNetFx40_Full_x86_x64.exe %host%/dotNetFx40_Full_x86_x64.exe
wget -c -t 2 -O %LocalFolder%\WindowsServer2003-KB968930-x64-RUS.exe %host%/WindowsServer2003-KB968930-x64-RUS.exe
wget -c -t 2 -O %LocalFolder%\WindowsServer2003-KB968930-x86-RUS.exe %host%/WindowsServer2003-KB968930-x86-RUS.exe
wget -c -t 2 -O %LocalFolder%\WindowsXP-KB968930-x86-RUS.exe %host%/WindowsXP-KB968930-x86-RUS.exe

rem Additional Packets
wget -c -t 2 -O %LocalFolder%\AdminScriptsSet01.exe %host%/AdminScriptsSet01.exe
wget -c -t 2 -O %LocalFolder%\AdminTExponentaPluginSetup.exe %host%/AdminTExponentaPluginSetup.exe
wget -c -t 2 -O %LocalFolder%\ElevationSetupRepack.exe %host%/ElevationSetupRepack.exe
wget -c -t 2 -O %LocalFolder%\UtilSetup.exe %host%/UtilSetup.exe
wget -c -t 2 -O %LocalFolder%\wso.exe %host%/wso.exe
wget -c -t 2 -O %LocalFolder%\jdk-windows-i586.exe %host%/jdk-8u211-windows-i586.exe
wget -c -t 2 -O %LocalFolder%\jre-windows-x64.exe %host%/jre-8u211-windows-x64.exe
wget -c -t 2 -O %LocalFolder%\jdk-windows-x64.exe %host%/jdk-8u211-windows-x64.exe
wget -c -t 2 -O %LocalFolder%\jre-windows-i586.exe %host%/jre-8u211-windows-i586.exe

rem Auxiliary Packets
wget -c -t 2 -O %LocalFolder%\DTLiteInstaller.exe %host%/DTLiteInstaller.exe
wget -c -t 2 -O %LocalFolder%\KMS_Tools.zip %host%/KMS_Tools.zip
wget -c -t 2 -O %LocalFolder%\duck-install.msi %host%/duck-install.msi
wget -c -t 2 -O %LocalFolder%\Hydra-Installer.exe %host%/Hydra-Installer.exe
rem wget -c -t 2 --content-disposition %host%/installmaindistrib.bat
rem wget --http-user=%httpuser% -nc --http-passwd=%httppassword% %host%/chock.install.cmd
rem wget -r --no-parent %host%/

rem Удаляем правило для wget.exe в брандмауэре
%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="WGET.EXE Application rule 1"

