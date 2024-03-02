
cls

@echo off

rem Check If User Has Admin Privileges
timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
    echo Running..
) else (
    echo HATA CALISTIRMAK ICIN YONETICI OLARAK CALISTIRIN.
    echo.
    echo Sag tikla ve yonetici olarak calistiri'i sec.
    echo.
    echo Enter'e basin cikis icin.
    pause > NUL
    exit
)

echo.

rem Delete Temporary Files
del /s /f /q %WinDir%\Temp\*.*
del /s /f /q %WinDir%\Prefetch\*.*
del /s /f /q %Temp%\*.*
del /s /f /q %AppData%\Temp\*.*
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.*
cls
rem Delete Used Drivers Files (Not needed because already installed)
del /s /f /q %SYSTEMDRIVE%\AMD\*.*
del /s /f /q %SYSTEMDRIVE%\NVIDIA\*.*
del /s /f /q %SYSTEMDRIVE%\INTEL\*.*
cls
rem Delete Temporary Folders
rd /s /q %WinDir%\Temp
rd /s /q %WinDir%\Prefetch
rd /s /q %Temp%
rd /s /q %AppData%\Temp
rd /s /q %HomePath%\AppData\LocalLow\Temp
clscls
rem Delete Used Drivers Folders (Not needed because already installed)
rd /s /q %SYSTEMDRIVE%\AMD
rd /s /q %SYSTEMDRIVE%\NVIDIA
rd /s /q %SYSTEMDRIVE%\INTEL
cls
rem Recreate Empty Temporary Folders
md %WinDir%\Temp
md %WinDir%\Prefetch
md %Temp%
md %AppData%\Temp
md %HomePath%\AppData\LocalLow\Temp
cls

rem Belirtilen klasördeki gereksiz dosyaları ve klasörleri silme işlemi
set "targetFolder=%LocalAppData%"

rem Geçici değişkenler
set "deletedFolders=0"

rem Alt klasörleri döngüye al
for /d %%i in ("%targetFolder%\tw-*") do (
    rem Klasörü sil
    rem echo Silinen klasör: "%%i"
    rd /s /q "%%i"
    set /a deletedFolders+=1
)

rem Kullanıcıya silinen klasör sayısını bildir

cls
color 0A
setlocal enabledelayedexpansion
set /a width=80
set /a spaces=(%width%-%deletedFolders%-36)/2
set "space="
for /l %%i in (1,1,%spaces%) do set "space=!space! "
echo !space!Windows temizlendi ve ek olarak %deletedFolders% gereksiz klasor silindi.!space!
endlocal

pause > NUL
exit