echo off
cls
set /P "VER=Output folder name:"
md %VER%
xcopy /E packFormat %VER%
copy ko_kr.json %VER%\assets\minecraft\lang