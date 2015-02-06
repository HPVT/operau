@echo off
set ver=0.4
SETLOCAL EnableExtensions
SetLocal EnableDelayedExpansion
mode con cols=30 lines=10
title U+ Hosts
If "%PROCESSOR_ARCHITECTURE%"=="AMD64" (Set a=%SystemRoot%\SysWOW64) Else (Set a=%SystemRoot%\system32)
Md "%a%\test_permissions" 2>nul||(echo ��ʹ���Ҽ�-�Թ���Ա�������!!! & choice /t 2 /d y /n >nul &Exit)
Rd "%a%\test_permissions" >nul 2>nul
cls
set bak=%date:~0,4%��%date:~5,2%��%date:~8,2%��%time:~0,2%ʱ����
set str=%date:~0,4%%date:~5,2%00
if exist %ComSpec% (set etc=%windir%\system32\drivers\etc&set hosts=%windir%\system32\drivers\etc\hosts) Else (set etc=%windir%\&set hosts=%windir%\hosts)
ipv6 install >nul 2>nul
net stop "Dnscache" >nul 2>nul
sc stop "DNSCache" >nul 2>nul
sc config Dnscache start= disabled >nul 2>nul
sc config iphlpsvc start= AUTO > nul 2>nul
sc config HTTPFilter start= AUTO >nul 2>nul
sc config 6to4 start= auto >nul 2>nul
net start 6to4 >nul 2>nul
netsh interface ipv6 isatap set router isatap.sjtu.edu.cn >nul 2>nul
netsh interface ipv6 isatap set state enabled >nul 2>nul
if not exist %etc%\Bakup\ md %etc%\Bakup\ >nul
call :unlock
copy /y %hosts% %etc%\Bakup\"Hosts_%bak%.txt" >nul 2>nul
echo Backup completed!

:dftvbs
ping /n 2 simpleu.googlecode.com >nul||goto dftlocal
call :upcore
cscript //NoLogo /e:vbscript %temp%/Updates.vbs "http://git.oschina.net/simpleu/hosts/raw/master/hosts">>%temp%\hosts.txt
rem copy /b %temp%\hosts.txt+smarthosts.txt hbhosts.txt
copy %temp%\hosts.txt %hosts%
del %etc%\HostsX.orzhosts & copy %temp%\HostsX.orzhosts %etc%
&call :dns&msg %username% /time:1 "U+ Hosts data has been Updated��"&Exit

:dns
notepad %hosts%
echo FlushDns...
call :youku
ipconfig -flushdns >nul 2>nul
del %SystemRoot%\system32\df.ini >nul 2>nul
del %SystemRoot%\system32\error.dd >nul 2>nul
del %SystemRoot%\system32\Macromed\Flash\mms.cfg >nul 2>nul
DEL /F /Q /A "%CommonProgramFiles%\Adobe\Adobe PCD\cache\cache.db">nul 2>nul
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files">nul 2>nul
del /f /s /q "%userprofile%\Local Settings\Temp">nul 2>nul
del /f /s /q "%userprofile%\recent">nul 2>nul
ipconfig -flushdns >nul 2>nul
ipconfig -registerdns >nul 2>nul
ipconfig -renew >nul 2>nul
goto:eof

:chkupdate
color 0d
Title ���߸���
cls
echo.
echo      ���ڸ���
echo.
echo    ...���Ժ�...
call :upcore
cscript //NoLogo /e:vbscript %temp%/Updates.vbs "http://simpleu.googlecode.com/svn/trunk/HostsTool.txt">%cd%\HostsTool.bat
start %cd%\HostsTool.bat& del %0
exit

:upcore
echo Set oDOM = WScript.GetObject(WScript.Arguments(0)) >%temp%/Updates.vbs
echo do until oDOM.readyState = "complete" >>%temp%/Updates.vbs
echo WScript.sleep 200 >>%temp%/Updates.vbs
echo loop >>%temp%/Updates.vbs
echo WScript.echo oDOM.documentElement.outerText >>%temp%/Updates.vbs
goto:eof

:youku
start /min iexplore.exe http://i.youku.com/u/UMzI4MTU2ODQ
ping 127.0.0.1 -n 3 >nul
%k% iexplore.exe >nul 2>nul
ping 127.0.0.1 -n 2 >nul
for /f "delims=" %%i in ('dir /b /ad "%APPDATA%\Macromedia\Flash Player\#SharedObjects\"') do (
set str=%%i
rd "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\static.youku.com" /s/q >nul 2>nul
c:> "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\static.youku.com"
rd "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\player.pplive.cn" /s/q >nul 2>nul
c:> "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\player.pplive.cn"
rd "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\irs01.net" /s/q >nul 2>nul
c:> "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\irs01.net"
rd "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\d1.sina.com.cn" /s/q >nul 2>nul
c:> "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\d1.sina.com.cn"
rd "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\www.iqiyi.com" /s/q >nul 2>nul
c:> "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\www.iqiyi.com"
rd "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\player.letvcdn.com" /s/q >nul 2>nul
c:> "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\player.letvcdn.com"
rd "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\static.acs86.com" /s/q >nul 2>nul
c:> "%APPDATA%\Macromedia\Flash Player\#SharedObjects\!str!\static.acs86.com")
rd "%APPDATA%\Macromedia\Flash Player\macromedia.com\support\flashplayer\sys\#static.youku.com" /s/q >nul 2>nul
c:> "%APPDATA%\Macromedia\Flash Player\macromedia.com\support\flashplayer\sys\#static.youku.com"
rd "%APPDATA%\Macromedia\Flash Player\macromedia.com\support\flashplayer\sys\#irs01.net" /s/q >nul 2>nul
c:> "%APPDATA%\Macromedia\Flash Player\macromedia.com\support\flashplayer\sys\#irs01.net"
ipconfig -flushdns >nul 2>nul
mshta vbscript:msgbox("��Ƶ���Ź�������ߣ�",64,"SimpleU+")(window.close)
goto:EOF

:unlock
echo y| cacls %hosts% /c /t /p everyone:f >nul 2>nul
attrib %hosts% -r -h -s >nul 2>nul
goto:eof

:dftlocal
echo �޷����ӷ�������& choice /t 2 /d y /n >nul
echo ��ʹ�ñ��ػ���Hosts���ݣ�& choice /t 2 /d y /n >nul
if not exist %etc%\HostsX.orzhosts (echo δ�ҵ����ػ���Hosts����! & choice /t 2 /d y /n >nul&exit) else (copy %etc%\HostsX.orzhosts %hosts% &echo �Ѹ��������ػ���Hosts���ݣ�)
goto dns
