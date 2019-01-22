echo off
cls
set /P "VER=출력 버전 입력:"
md %VER%
xcopy /E packFormat %VER%
copy ko_kr.json %VER%\assets\minecraft\lang

if exist pack.mcmeta del pack.mcmeta
echo -------------------------
echo 아래에 pack.mcmeta pack format을 입력하십시오.
rem set /p "PF=입력:"
set "PF=4"
echo 자동 입력됨: %PF%
echo -------------------------
echo 아래에 pack.mcmeta description을 입력하십시오.
rem set /p "DS=입력:"
set "DS=Korpack MC KOR translation (2.2, 1.13.2)"
echo 자동 입력됨: %DS%
echo pack.mcmeta를 작성하는 중...
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
echo 성공적으로 빌드 완료.
echo 결과 파일이 %VER%.zip으로 출력되었습니다.
echo -------------------------
pause
exit