echo off
cls
set /P "VER=Output version:"
md %VER%
xcopy /E packFormat %VER%
copy ko_kr.json %VER%\assets\minecraft\lang
if exist %VER%.zip del %VER%.zip
7za a -sdel %VER%.zip .\%VER%\*
rd /q /s %VER%