echo off
cls
set /P "VER=��� ���� �Է�:"
md %VER%
xcopy /E packFormat %VER%
copy ko_kr.json %VER%\assets\minecraft\lang

if exist pack.mcmeta del pack.mcmeta
echo -------------------------
echo �Ʒ��� pack.mcmeta pack format�� �Է��Ͻʽÿ�.
rem set /p "PF=�Է�:"
set "PF=4"
echo �ڵ� �Էµ�: %PF%
echo -------------------------
echo �Ʒ��� pack.mcmeta description�� �Է��Ͻʽÿ�.
rem set /p "DS=�Է�:"
set "DS=Korpack MC KOR translation (2.2, 1.13.2)"
echo �ڵ� �Էµ�: %DS%
echo pack.mcmeta�� �ۼ��ϴ� ��...
echo { >> pack.mcmeta
echo   "pack": { >> pack.mcmeta
echo     "pack_format": %PF%, >> pack.mcmeta
echo     "description": "%DS%" >> pack.mcmeta
echo   } >> pack.mcmeta
echo } >> pack.mcmeta
move pack.mcmeta %VER%\

if exist %VER%.zip del %VER%.zip
7za a -sdel %VER%.zip .\%VER%\*
7za a %VER%.zip .\addToo\*
rd /q /s %VER%
echo -------------------------
echo ���������� ���� �Ϸ�.
echo ��� ������ %VER%.zip���� ��µǾ����ϴ�.
echo -------------------------
pause
exit