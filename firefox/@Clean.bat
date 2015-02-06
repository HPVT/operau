@echo off
cd /d %~dp0
set pf=..\
del /f /q "%pf%\Cache"
del /f /q "%pf%\cache2"
del /f /q "%pf%\crashes"
del /f /q "%pf%\feedbar.cache"
del /f /q "%pf%\feedbar.sqlite"
del /f /q "%pf%\fftmp"
del /f /q "%pf%\healthreport"
del /f /q "%pf%\healthreport.sqlite*"
del /f /q "%pf%\jumpListCache"
del /f /q "%pf%\minidumps"
del /f /q "%pf%\safebrowsing"
del /f /q "%pf%\startupCache"
del /f /q "%pf%\thumbnails"
del /q /s "%pf%\adblockplus\*backup*.*"
del /q /s "%pf%\adblockplus\patterns-b*.ini"
del /q /s "%pf%\bookmarkbackups\*.*"
rd /q /s "%pf%\OfflineCache"
rd /q /s "%pf%\bookmarkbackups"
rd /q /s "%pf%\forecastfox"
rd /q /s "%pf%\minidumps"
rd /q /s "%pf%\startupCache"
rd /q /s "%pf%\weave"
rd /s /q "%pf%\Cache"
rd /s /q "%pf%\OfflineCache"
rd /s /q "%pf%\cache2"
rd /s /q "%pf%\crashes"
rd /s /q "%pf%\fftmp"
rd /s /q "%pf%\storage"
rd /s /q "%pf%\webapps"
rd /s /q "%pf%\healthreport"
rd /s /q "%pf%\icons"
rd /s /q "%pf%\jumpListCache"
rd /s /q "%pf%\minidumps"
rd /s /q "%pf%\personas"
rd /s /q "%pf%\safebrowsing"
rd /s /q "%pf%\startupCache"
rd /s /q "%pf%\thumbnails"
cls
echo Firefox临时、垃圾、缓存文件清理完毕！
ping -n 1 127.1>nul&exit
