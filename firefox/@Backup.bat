@echo off
echo ������ֹFirefox/lawlietfox/palemoon���̲�����Firefox\profile�����ļ�
pause
taskkill /F /IM firefox.exe
taskkill /F /IM lawlietfox.exe
taskkill /F /IM palemoon.exe

:backup7z
rem ȡ�õ�ǰ����������·��
cd /d %~dp0
::����Ҫ����Ŀ���·��
set ProfilesPath=..\..\
::���ñ��ݴ�ŵ�·���Լ�ѹ�����ļ����������ʱ���º��գ�ͨ��ʹ�õ��ǳ�������ô����%date:~5,2%%date:~8,2%��
set ArchiveName=D:\Profile_%date:~5,2%%date:~8,2%.7z
::����Ҫ������ļ��Լ��ļ��У��������Լ����
7z.exe u -up1q3r2x2y2z2w2 %ArchiveName% "%ProfilesPath%*adblockplus*" "%ProfilesPath%*extensions*" "%ProfilesPath%*mason*" "%ProfilesPath%Flashgot.exe" "%ProfilesPath%Plugins" "%ProfilesPath%cert8.db" "%ProfilesPath%chrome" "%ProfilesPath%cookies.sqlite" "%ProfilesPath%gm_scripts" "%ProfilesPath%key3.db" "%ProfilesPath%localstore.rdf" "%ProfilesPath%permissions.sqlite" "%ProfilesPath%places.sqlite" "%ProfilesPath%prefs.js" "%ProfilesPath%scriptish_scripts" "%ProfilesPath%search-metadata.json" "%ProfilesPath%searchplugins" "%ProfilesPath%secmod.db" "%ProfilesPath%signons.sqlite" "%ProfilesPath%stylish.sqlite" "%ProfilesPath%user.js"
ping -n 3 127.1>nul
echo ������ɣ��밴������رմ���
pause&exit
goto:eof

:backuprar
rar.exe a -m5 -s -md4096 -idq -r -ed -ep1 -x*.mfl -x*.dat -x*\*cache* -x*\*thumbnails* -x*\*safebrowsing* -x*\*bak* -x*\*bookmarkbackups* -x*.bak -xpatterns-*.ini -xcompatibility.ini -xparent.lock -ag[YYYY-MM-DD,hh-mm-ss] profile_backup.rar profile\
echo �������
goto:eof