@echo off
pushd "%~dp0"
set appPath=%~dp0
set urlC=simpleu.googlecode.com/svn/trunk/hosts
set urlP=203.208.46.200:80
set urlP1=203.208.46.170:80
set urlP2=203.208.46.202:80
set urlP3=203.208.46.207:80
set urlP4=203.208.46.222:80

copy /y hosts temp.dat>nul

echo.
echo ������ �ȸ���� ����
echo.
wget -N -t 3 -e "http_proxy=http://%urlP%" http://%urlC% -o log.txt
findstr "saved" log.txt &&goto endR
findstr /c:"Server file no newer" log.txt &&goto end

wget -N -t 3 -e "http_proxy=http://%urlP1%" http://%urlC% -a log.txt
findstr "saved" log.txt &&goto endR
findstr /c:"Server file no newer" log.txt &&goto end

wget -N -t 3 -e "http_proxy=http://%urlP2%" http://%urlC% -a log.txt
findstr "saved" log.txt &&goto endR
findstr /c:"Server file no newer" log.txt &&goto end

wget -N -t 3 -e "http_proxy=http://%urlP3%" http://%urlC% -a log.txt
findstr "saved" log.txt &&goto endR
findstr /c:"Server file no newer" log.txt &&goto end

wget -N -t 3 -e "http_proxy=http://%urlP4%" http://%urlC% -a log.txt
findstr "saved" log.txt &&goto endR
findstr /c:"Server file no newer" log.txt &&goto end

echo.
echo ������ https ����
echo.
wget -N -t 3 --no-check-certificate https://%urlC% -a log.txt
findstr "saved" log.txt &&goto endR
findstr /c:"Server file no newer" log.txt &&goto end

echo.
echo ������ http ����
echo.
wget -N -t 3 http://%urlC% -a log.txt
findstr "saved" log.txt &&goto endR
findstr /c:"Server file no newer" log.txt &&goto end

echo.
echo ������������⡣
echo.
echo 10����˳���
ping -n 10 127.1 >nul
exit

:end
echo.
echo ������£�10����˳���
echo.
ping -n 10 127.1 >nul
exit

:endR
echo.
copy /y temp.dat hosts���� >nul
echo �Ѹ���
echo.

����Ϊsimpleu.host����.bat

