@echo off
color 70
title New Playable Subs Mod ^& More Updater - Installer
cls

echo Checking for Git...
git --version >nul 2>&1
if errorlevel 1 goto :getgit
echo Git installed
echo Making files...
cd "%UserProfile%"
rmdir .PBSmodUpdater /S /Q >nul 2>&1
mkdir .PBSmodUpdater
cd .PBSmodUpdater
git clone https://github.com/CaptainX3/CW-Playable-Subs.git
echo.
:askPath
echo Please paste the path to your Cold Waters game files folder
echo If you're using Steam it will likely be: C:\Program Files (x86)\Steam\steamapps\common\Cold Waters
echo If you're using GOG it will likely be: C:\GOG Games\Cold Waters
set /p cwPath="Path: "
cd "%cwPath%" >nul 2>&1
if errorlevel 1 goto :invalidPath
REM obscure path to verify the game folder
type "%cwPath%\ColdWaters_Data\StreamingAssets\default\language_en\mission\single001.txt" >nul 2>&1
if errorlevel 1 goto :invalidPath
cd "%UserProfile%\.PBSmodUpdater"
echo.
echo Making files...
@echo %cwPath%\ColdWaters_Data\StreamingAssets\> path.conf
@echo @echo off> updateMod.bat
@echo color 70>> updateMod.bat
@echo title New Playable Subs Mod ^^^& More Updater>> updateMod.bat
@echo cls>> updateMod.bat
@echo cd "%%UserProfile%%\.PBSmodUpdater">> updateMod.bat
@echo cd "CW-Playable-Subs">> updateMod.bat
@echo git pull>> updateMod.bat
@echo cd ..>> updateMod.bat
@echo set /p gameDir=^<path.conf>> updateMod.bat
@echo cd "%%gameDir%%">>updateMod.bat
@echo rmdir override /S /Q>>updateMod.bat
@echo mkdir override>>updateMod.bat
@echo xcopy "%UserProfile%\.PBSmodUpdater\CW-Playable-Subs\override" .\override /E>>updateMod.bat
@echo echo Mod Updated.>>updateMod.bat
@echo pause>>updateMod.bat
@echo exit>>updateMod.bat
copy updateMod.bat %UserProfile%\Desktop
echo.
echo Installation complete
echo The updater has been copied to your desktop.
echo Just DoubleClick on the "updateMod.bat" to update the mod
echo If you wish to uninstall, navigate to %UserProfile% and delete the .PBSmodUpdater folder
echo Enjoy :^)
pause
exit

:getgit
echo.
echo Git not installed, please install Git for windows, then restart the installation:
echo http://gitforwindows.org/
pause
exit

:invalidPath
echo.
echo Incorrect path
echo Please check the path and re-enter it
pause
echo.
goto :askPath
