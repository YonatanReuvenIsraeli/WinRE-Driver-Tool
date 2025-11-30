@echo off
title WinRE Driver Tool
setlocal
echo Program Name: WinRE Driver Tool
echo Version: 1.0.3
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
"%windir%\System32\net.exe" session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
"%windir%\System32\net.exe" user > nul 2>&1
if not "%errorlevel%"=="0" goto "InWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
goto "Start"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"InWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
echo.
echo You are in Windows Preinstallation Environment or Windows Recovery Environment! You must run this batch file in Windows. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"Start"
echo.
echo [1] View current 3rd party driver(s) in Windows Recovery Environment.
echo [2] Add driver(s) to Windows Recovery Environment.
echo [3] Remove driver(s) from Windows Recovery Environment.
echo [4] Exit.
echo.
set Input=
set /p Input="What do you want to do? (1-4) "
if /i "%Input%"=="1" goto "ReAgentc"
if /i "%Input%"=="2" goto "ReAgentc"
if /i "%Input%"=="3" goto "ReAgentc"
if /i "%Input%"=="4" goto "Exit"
echo Invalid syntax!
goto "Start"

:"ReAgentc"
echo.
"%windir%\System32\ReAgentc.exe" /info
goto "DiskPartSet"

:"DiskPartSet"
set DiskPart=
goto "Volume"

:"Volume"
if exist "diskpart.txt" goto "DiskPartExistVolume"
echo Listing volumes attached to this PC.
(echo list vol) > "diskpart.txt"
(echo exit) >> "diskpart.txt"
"%windir%\System32\diskpart.exe" /s "diskpart.txt" 2>&1
if not "%errorlevel%"=="0" goto "VolumeError"
del "diskpart.txt" /f /q > nul 2>&1
echo Volumes attached to this PC listed.
goto "WinREAsk1"

:"DiskPartExistVolume"
set DiskPart=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "diskpart.txt" in order for this batch file to proceed. "diskpart.txt" is not a system file. "diskpart.txt" is located in the folder "%cd%". Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "Volume"

:"VolumeError"
del "diskpart.txt" /f /q > nul 2>&1
echo.
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "Volume"

:"WinREAsk1"
echo.
set WinREVolume=
set /p WinREVolume="What volume is the WinRE volume? (0-?) "
goto "SureWinREAsk1"

:"SureWinREAsk1"
echo.
set SureWinREAsk1=
set /p SureWinREAsk1="Are you sure volume %WinREVolume% is the WinRE volume? (Yes/No) "
if /i "%SureWinREAsk1%"=="Yes" goto "WinREAsk2"
if /i "%SureWinREAsk1%"=="No" goto "Volume"
echo Invalid syntax!
goto "SureWinREAsk1"

:"WinREAsk2"
echo.
set WinREAsk=
set /p WinREAsk="Is the WinRE volume %WinREVolume% already assigned a drive letter? (Yes/No) "
if /i "%WinREAsk%"=="Yes" goto "SureWinREAsk2"
if /i "%WinREAsk%"=="No" goto "WinREDriveLetter"
echo Invalid syntax!
goto "WinREAsk2"

:"SureWinREAsk2"
echo.
set SureWinREAsk2=
set /p SureWinREAsk2="Are you sure WinRE volume %WinREVolume% is already assigned a drive letter? (Yes/No) "
if /i "%SureWinREAsk2%"=="Yes" goto "DriveLetterWinRE"
if /i "%SureWinREAsk2%"=="No" goto "WinREAsk2"
echo Invalid syntax!
goto "SureWinREAsk2"

:"WinREDriveLetter"
echo.
echo Finding an available drive letter.
if not exist "A:" set WinREDriveLetter=A:
if not exist "A:" goto "AvailableDriveLetterFound"
if not exist "B:" set WinREDriveLetter=B:
if not exist "B:" goto "AvailableDriveLetterFound"
if not exist "C:" set WinREDriveLetter=C:
if not exist "C:" goto "AvailableDriveLetterFound"
if not exist "D:" set WinREDriveLetter=D:
if not exist "D:" goto "AvailableDriveLetterFound"
if not exist "E:" set WinREDriveLetter=E:
if not exist "E:" goto "AvailableDriveLetterFound"
if not exist "F:" set WinREDriveLetter=F:
if not exist "F:" goto "AvailableDriveLetterFound"
if not exist "G:" set WinREDriveLetter=G:
if not exist "G:" goto "AvailableDriveLetterFound"
if not exist "H:" set WinREDriveLetter=H:
if not exist "H:" goto "AvailableDriveLetterFound"
if not exist "I:" set WinREDriveLetter=I:
if not exist "I:" goto "AvailableDriveLetterFound"
if not exist "J:" set WinREDriveLetter=J:
if not exist "J:" goto "AvailableDriveLetterFound"
if not exist "K:" set WinREDriveLetter=K:
if not exist "K:" goto "AvailableDriveLetterFound"
if not exist "L:" set WinREDriveLetter=L:
if not exist "L:" goto "AvailableDriveLetterFound"
if not exist "M:" set WinREDriveLetter=M:
if not exist "M:" goto "AvailableDriveLetterFound"
if not exist "N:" set WinREDriveLetter=N:
if not exist "N:" goto "AvailableDriveLetterFound"
if not exist "O:" set WinREDriveLetter=O:
if not exist "O:" goto "AvailableDriveLetterFound"
if not exist "P:" set WinREDriveLetter=P:
if not exist "P:" goto "AvailableDriveLetterFound"
if not exist "Q:" set WinREDriveLetter=Q:
if not exist "Q:" goto "AvailableDriveLetterFound"
if not exist "R:" set WinREDriveLetter=R:
if not exist "R:" goto "AvailableDriveLetterFound"
if not exist "S:" set WinREDriveLetter=S:
if not exist "S:" goto "AvailableDriveLetterFound"
if not exist "T:" set WinREDriveLetter=T:
if not exist "T:" goto "AvailableDriveLetterFound"
if not exist "U:" set WinREDriveLetter=U:
if not exist "U:" goto "AvailableDriveLetterFound"
if not exist "V:" set WinREDriveLetter=V:
if not exist "V:" goto "AvailableDriveLetterFound"
if not exist "W:" set WinREDriveLetter=W:
if not exist "W:" goto "AvailableDriveLetterFound"
if not exist "X:" set WinREDriveLetter=X:
if not exist "X:" goto "AvailableDriveLetterFound"
if not exist "Y:" set WinREDriveLetter=Y:
if not exist "Y:" goto "AvailableDriveLetterFound"
if not exist "Z:" set WinREDriveLetter=Z:
if not exist "Z:" goto "AvailableDriveLetterFound"
echo No drive letter is available! Please unmount 1 drive and then press any key to try again.
pause > nul 2>&1
goto "WinREDriveLetter"

:"AvailableDriveLetterFound"
echo Available drive letter found.
goto "AssignDriveLetterWinRE"

:"AssignDriveLetterWinRE"
if exist "diskpart.txt" goto "DiskPartExistAssignDriveLetterWinRE"
echo.
echo Assigning WinRE volume %WinREVolume% drive letter "%WinREDriveLetter%".
(echo automount scrub) > "diskpart.txt"
(echo sel vol %WinREVolume%) >> "diskpart.txt"
(echo assign letter=%WinREDriveLetter%) >> "diskpart.txt"
(echo exit) >> "diskpart.txt"
"%windir%\System32\diskpart.exe" /s "diskpart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "AssignDriveLetterWinREError"
del "diskpart.txt" /f /q > nul 2>&1
echo Assigned WinRE volume %WinREVolume% drive letter "%WinREDriveLetter%".
set DriveLetterWinRE=%WinREDriveLetter%
if /i "%WinREAsk%"=="No" if /i "%DiskPart%"=="True" goto "DiskPartDone"
goto "WinREPath"

:"DiskPartExistAssignDriveLetterWinRE"
set DiskPart=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "diskpart.txt" in order for this batch file to proceed. "diskpart.txt" is not a system file. "diskpart.txt" is located in the folder "%cd%". Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "AssignDriveLetterWinRE"

:"AssignDriveLetterWinREError"
del "diskpart.txt" /f /q > nul 2>&1
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "WinREDriveLetterExist"

:"DiskPartDone"
echo.
echo You can now rename or move the file back to "diskpart.txt". Press any key to continue.
pause > nul 2>&1
goto "WinREPath"

:"DriveLetterWinRE"
echo.
set DriveLetterWinRE=
set /p DriveLetterWinRE="What is the drive letter that WinRE is installed on? (A:-Z:) "
if /i "%DriveLetterWinRE%"=="A:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="B:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="C:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="D:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="E:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="F:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="G:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="H:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="I:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="J:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="K:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="L:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="M:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="N:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="O:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="P:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="Q:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="R:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="S:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="T:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="U:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="V:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="W:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="X:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="Y:" goto "SureDriveLetterWinRE"
if /i "%DriveLetterWinRE%"=="Z:" goto "SureDriveLetterWinRE"
echo Invalid syntax!
goto "DriveLetterWinRE"

:"SureDriveLetterWinRE"
echo.
set SureDriveLetterWinRE=
set /p SureDriveLetterWinRE="Are you sure "%DriveLetterWinRE%" is the drive letter that WinRE is installed on? (Yes/No) "
if /i "%SureDriveLetterWinRE%"=="Yes" goto "CheckExistDriveLetterWinRE"
if /i "%SureDriveLetterWinRE%"=="No" goto "DriveLetterWinRE"
echo Invalid syntax!
goto "SureDriveLetterWinRE"

:"CheckExistDriveLetterWinRE"
if not exist "%DriveLetterWinRE%" goto "DriveLetterWinRENotExist"
goto "WinREPath"

:"DriveLetterWinRENotExist"
echo "%DriveLetterWinRE%" does not exist! Please try again.
goto "Volume"

:"WinREPath"
echo.
set WinREPath=
set /p WinREPath="What is the full path to the folder that Windows Recovery Environment ("Winre.wim") is in? "
goto "SureWinREPath"

:"SureWinREPath"
echo.
set SureWinREPath=
set /p SureWinREPath="Are you "%WinREPath%" is the path to the folder that Windows Recovery Environment ("Winre.wim") is in? (Yes/No) "
if /i "%SureWinREPath%"=="Yes" goto "WinREPathCheckExist"
if /i "%SureWinREPath%"=="No" goto "WinREPath"
echo Invalid syntax!
goto "SureWinREPath"

:"WinREPathCheckExist"
if not exist "%WinREPath%\Winre.wim" goto "WinREPathNotExist"
goto "MountSet"

:"WinREPathNotExist"
echo "%WinREPath%\Winre.wim" does not exist! Please try again.
goto "WinREPath"

:"MountSet"
set Mount=
goto "Mount"

:"Mount"
if exist "%SystemDrive%\Mount" goto "MountExist"
echo.
echo Mounting Windows Recovery Environment to "%SystemDrive%\Mount".
md "%SystemDrive%\Mount" > nul 2>&1
if /i "%Input%"=="1" "%windir%\System32\Dism.exe" /Mount-Image /ImageFile:"%WinREPath%\Winre.wim" /Index:1 /MountDir:"%SystemDrive%\Mount" /ReadOnly
if /i not "%Input%"=="1" "%windir%\System32\Dism.exe" /Mount-Image /ImageFile:"%WinREPath%\Winre.wim" /Index:1 /MountDir:"%SystemDrive%\Mount"
if not "%errorlevel%"=="0" goto "MountError"
echo Windows Recovery Environment mounted to "%SystemDrive%\Mount".
if /i "%Input%"=="1" goto "1"
if /i "%Input%"=="2" goto "2"
if /i "%Input%"=="3" goto "3"

:"MountExist"
set Mount=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "%SystemDrive%\Mount" in order for this batch file to proceed. "%SystemDrive%\Mount" is not a system file. Press any key to continue when "%SystemDrive%\Mount" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "Mount"

:"MountError"
echo.
echo Unmounting Windows Recovery Environment from "%SystemDrive%\Mount".
"%windir%\System32\Dism.exe" /Unmount-Image /MountDir:"%SystemDrive%\Mount" /Discard
if not "%errorlevel%"=="0" goto "MountErrorError"
rd "%SystemDrive%\Mount" /s /q > nul 2>&1
echo Windows Recovery Environment unmounted from "%SystemDrive%\Mount".
if /i "%SystemDrive%"=="True" goto "MountDoneMount"
if /i "%Input%"=="1" goto "1"
if /i "%Input%"=="2" goto "2"
if /i "%Input%"=="3" goto "3"

:"MountErrorError"
echo There has been an error and all images need to be unmounted! Make sure to save all changes you have made to your mounted images before pressing any key to unmount all images. Press any key to unmount all images when you are ready to unmount all images.
pause > nul 2>&1
echo.
echo Cleaning up mounted images.
"%windir%\System32\Dism.exe" /Cleanup-Mountpoints
rd "%SystemDrive%\Mount" /s /q > nul 2>&1
echo Mounted images cleaned up.
if /i "%SystemDrive%"=="True" goto "MountDoneMount"
if /i "%Input%"=="1" goto "1"
if /i "%Input%"=="2" goto "2"
if /i "%Input%"=="3" goto "3"

:"MountDoneMount"
set Mount=
echo.
echo You can now rename or move the file back to "%SystemDrive%\Mount". Press any key to continue.
pause > nul 2>&1
if /i "%Input%"=="1" goto "1"
if /i "%Input%"=="2" goto "2"
if /i "%Input%"=="3" goto "3"

:"1"
"%windir%\System32\Dism.exe" /Get-Drivers /Image:"%SystemDrive%\Mount"
if /i not "%errorlevel%"=="0" goto "Error1"
goto "Unmount"

:"Error1"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "1"

:"2"
echo.
set DriverPath=
set /p DriverPath="What is the full path to your driver(s) (.inf) file(s)? If you specify a folder, all drivers in that folder and its subfolders will install. "
goto "SureDriverPath"

:"SureDriverPath"
echo.
set SureDriverPath=
set /p SureDriverPath="Are you sure "%DriverPath%" is the full path to your driver(s) (.inf) file(s)? (Yes/No) "
if /i "%SureDriverPath%"=="Yes" goto "CheckExistAddDriver"
if /i "%SureDriverPath%"=="No" goto "2"
echo Invalid syntax!
goto "SureDriverPath"

:"CheckExistAddDriver"
if not exist "%DriverPath%" goto "DriverNotExist"
goto "AddDriver"

:"DriverNotExist"
echo "%DriverPath%" does not exist! You can try again.
goto "2"

:"AddDriver"
echo.
echo Adding driver file(s) to Windows Recovery Environment.
"%windir%\System32\Dism.exe" /Image:"%SystemDrive%\Mount" /Add-Driver /Driver:"%DriverPath%" > nul 2>&1
if /i not "%errorlevel%"=="0" goto "Error2"
echo Driver file(s) added to Windows Recovery Environment.
goto "AddAnotherDriver"

:"Error2"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "2"

:"AddAnotherDriver"
echo.
set AddAnotherDriver=
set /p AddAnotherDriver="Do you add another driver? (Yes/No) "
if /i "%AddAnotherDriver%"=="Yes" goto "2"
if /i "%AddAnotherDriver%"=="No" goto "OptimizeAsk"
echo Invalid syntax!
goto "AddAnotherDriver"

:"3"
echo.
set DriverName=
set /p DriverName="What is the name of your driver(s) published name? "
goto "SureDrivername"

:"SureDrivername"
echo.
set SureDriverName=
set /p SureDriverName="Are you sure %DriverName% is the name of your driver(s) published name? (Yes/No) "
if /i "%SureDriverName%"=="Yes" goto "RemoveDriver"
if /i "%SureDriverName%"=="No" goto "3"
echo Invalid syntax!
goto "SureDriverName"

:"RemoveDriver"
echo.
echo Removing %DriverName% from Windows Recovery Environment.
"%windir%\System32\Dism.exe" /Image:"%SystemDrive%\Mount" /Remove-Driver /Driver:%DriverName% > nul 2>&1
if /i not "%errorlevel%"=="0" goto "Error3"
echo %DriverName% removed from Windows Recovery Environment.
goto "RemoveAnotherDriver"

:"Error3"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "3"

:"RemoveAnotherDriver"
echo.
set RemoveAnotherDriver=
set /p RemoveAnotherDriver="Do you remove another driver? (Yes/No) "
if /i "%RemoveAnotherDriver%"=="Yes" goto "3"
if /i "%RemoveAnotherDriver%"=="No" goto "OptimizeAsk"
echo Invalid syntax!
goto "RemoveAnotherDriver"

:"OptimizeAsk"
echo.
set Optimize=
set /p Optimize="Do you to optimize Windows Recovery Environment? (Yes/No) "
if /i "%Optimize%"=="Yes" goto "Optimize"
if /i "%Optimize%"=="No" goto "Unmount"
echo Invalid syntax!
goto "OptimizeAsk"

:"Optimize"
echo.
echo Cleaning up components.
"%windir%\System32\Dism.exe" /Image:"%SystemDrive%\Mount" /Cleanup-Image /StartComponentCleanup
echo Components cleaned up.
goto "Unmount"

:"Unmount"
echo.
echo Unmounting Windows Recovery Environment from "%SystemDrive%\Mount".
if /i "%Input%"=="1" "%windir%\System32\Dism.exe" /Unmount-Image /MountDir:"%SystemDrive%\Mount" /Discard
if /i not "%Input%"=="1" "%windir%\System32\Dism.exe" /Unmount-Image /MountDir:"%SystemDrive%\Mount" /Commit
if not "%errorlevel%"=="0" goto "UnmountError"
if /i "%Optimize%"=="No" "%windir%\System32\attrib.exe" +s +h -a "%WinREPath%\Winre.wim"
rd "%MountDrive%\Mount" /s /q > nul 2>&1
echo Windows Recovery Environment unmounted from "%SystemDrive%\Mount".
if /i "%Mount%"=="True" goto "MountDone"
if /i "%Optimize%"=="Yes" goto "Export"
if /i "%Optimize%"=="No" if /i "%WinREAsk%"=="Yes" goto "Start"
if /i "%Optimize%"=="No" if /i "%WinREAsk%"=="No" goto "RemoveLetter"

:"UnmountError"
echo There has been an error and all images need to be unmounted! Make sure to save all changes you have made to your mounted images before pressing any key to unmount all images. Press any key to unmount all images when you are ready to unmount all images.
pause > nul 2>&1
echo.
echo Cleaning up mounted images.
"%windir%\System32\Dism.exe" /Cleanup-Mountpoints
rd "%MountDrive%\Mount" /s /q > nul 2>&1
echo Mounted images cleaned up.
if /i "%Mount%"=="True" goto "MountDone"

:"MountDone"
set Mount=
echo.
echo You can now rename or move the file back to "%SystemDrive%\Mount". Press any key to continue.
pause > nul 2>&1
if /i "%Optimize%"=="Yes" goto "ExportSet"
if /i "%Optimize%"=="No" if /i "%WinREAsk%"=="Yes" goto "Start"
if /i "%WinREAsk%"=="No" goto "RemoveLetter"

:"ExportSet"
set Export=
goto "Export"

:"Export"
if exist "%SystemDrive%\Winre.wim" goto "ExportExist"
echo.
echo Exporting Windows Recovery Environment to "%SystemDrive%\Winre.wim".
"%windir%\System32\Dism.exe" /Export-Image /SourceImageFile:"%WinREPath%\Winre.wim" /SourceIndex:1 /DestinationImageFile:"%SystemDrive%\Winre.wim"
echo Windows Recovery Environment exported to "%SystemDrive%\Winre.wim".
if not "%errorlevel%"=="0" goto "ExportError"
goto "Overwrite"

:"ExportExist"
set Export=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "%SystemDrive%\Winre.wim" in order for this batch file to proceed. "%SystemDrive%\Winre.wim" is not a system file. Press any key to continue when "%SystemDrive%\Winre.wim" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "Export"

:"ExportError"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "Export"

:"Overwrite"
echo.
echo Overwriting Windows Recovery Environment with optimized image.
"%windir%\System32\attrib.exe" -s -h "%WinREPath%\Winre.wim"
copy "%SystemDrive%\Winre.wim" "%WinREPath%\Winre.wim" /y /v > nul 2>&1
"%windir%\System32\attrib.exe" +s +h -a "%WinREPath%\Winre.wim"
del "%SystemDrive%\Winre.wim" /f /q > nul 2>&1
echo Windows Recovery Environment overwritten with optimized image.
if /i "%Export%"=="True" goto "ExportDone"
if /i "%WinREAsk%"=="Yes" goto "Start"
if /i "%WinREAsk%"=="No" goto "RemoveLetter"

:"ExportDone"
set Export=
echo.
echo You can now rename or move the file back to "%SystemDrive%\Winre.wim". Press any key to continue.
pause > nul 2>&1
if /i "%WinREAsk%"=="Yes" goto "Start"
if /i "%WinREAsk%"=="No" goto "RemoveLetter"

:"RemoveLetter"
if exist "diskpart.txt" goto "DiskPartExistRemoveLetter"
echo.
echo Removing drive letter %WinREDriveLetter% from volume %WinREVolume%.
(echo sel vol %WinREVolume%) > "diskpart.txt"
(echo remove letter=%WinREDriveLetter%) >> "diskpart.txt"
(echo exit) >> "diskpart.txt"
"%windir%\System32\diskpart.exe" /s "diskpart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "RemoveLetterError"
del "diskpart.txt" /f /q > nul 2>&1
echo Removed drive letter %WinREDriveLetter% from volume %WinREVolume%.
if /i "%DiskPart%"=="True" goto "DiskPartDoneRemoveLetter"
goto "Start"

"DiskPartExistRemoveLetter"
set DiskPart=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "diskpart.txt" in order for this batch file to proceed. "diskpart.txt" is not a system file. "diskpart.txt" is located in the folder "%cd%". Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "RemoveLetter"

:"RemoveLetterError"
del "diskpart.txt" /f /q > nul 2>&1
echo.
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "RemoveLetter"

:"DiskPartDoneRemoveLetter"
echo.
echo You can now rename or move the file back to "diskpart.txt". Press any key to continue.
pause > nul 2>&1
goto "Start"

:"Exit"
endlocal
exit
