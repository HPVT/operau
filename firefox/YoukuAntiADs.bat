wget -c -N --no-check-certificate https://raw.githubusercontent.com/jiayiming/FireLocalSWF/master/YoukuAntiADs@harv.c.uc.js
wget -c -N --no-check-certificate https://raw.githubusercontent.com/jiayiming/FireLocalSWF/master/swf.rar
wget -c -N --no-check-certificate https://raw.githubusercontent.com/Harv/userChromeJS/master/youkuantiads_with_player.xpi
7z x swf.rar -y
7z x youkuantiads_with_player.xpi -y
move /y "%cd%\YoukuAntiADs@harv.c.uc.js" "%~dp0..\SubScript"
move /y "%cd%\content\swf\*.swf" "%cd%\swf"
move /y "%cd%\swf\*.swf" "%~dp0..\swf"
del /f swf.rar youkuantiads_with_player.xpi bootstrap.js chrome.manifest install.rdf content\youkuantiads.js
rd /s /q content
rd /s /q swf
exit

rem wget -e "http_proxy=http://127.0.0.1:8087" -N -r http://haoutil.googlecode.com/svn/trunk/player/ -nH -np
rem http://203.208.46.170:80
rem move /y "%cd%\svn\trunk\player\testmod\*.swf" "%cd%\svn\trunk\player"
rem move /y "%cd%\svn\trunk\player\*.swf" "%cd%\swf"

cd /d %~dp0
::���½ű�
set dd=wget.exe -N -P ..\UserScriptLoader\
%dd% http://userscripts.org:8080/scripts/source/39167.user.js

pushd "%~dp0"
set urlC=haoutil.googlecode.com/svn/trunk/player/testmod/
set urlD=haoutil.googlecode.com/svn/trunk/player/
set urlE=haoutil.googlecode.com/svn/trunk/youku/
set urlP=127.0.0.1:8087
wget -N -t 3 -e "http_proxy=http://%urlP%" http://%urlC%iqiyi.swf

https://raw.githubusercontent.com/defpt/userChromeJs/master/Sidebar/Sidebar_S.uc.js
https://raw.githubusercontent.com/defpt/userChromeJs/master/MemoryMonitor.uc.js
https://raw.githubusercontent.com/feiruo/userChromeJS/master/AwesomeBookmarkbar.uc.js
https://raw.githubusercontent.com/ywzhaiqi/userChromeJS/master/UserScriptLoaderPlus/UserScriptLoaderPlus.uc.js
https://raw.githubusercontent.com/defpt/userChromeJs/master/Translator/JsTranslator.uc.js
https://raw.githubusercontent.com/defpt/userChromeJs/master/Translator/gTranslator.uc.js
https://raw.githubusercontent.com/ywzhaiqi/userChromeJS/master/YoukuantiadsModY/youkuantiadsModY.uc.js
https://raw.githubusercontent.com/ywzhaiqi/userChromeJS/master/contextProxySwitch.uc.xul
https://raw.githubusercontent.com/defpt/userChromeJs/master/quickProxyMod.uc.js