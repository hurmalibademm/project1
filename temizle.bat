cls
@echo off

rem Check If User Has Admin Privileges
timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
    echo Running..
) else (
    echo HATA!! CALISTIRMAK ICIN SAG TIKLAYIP YONETICI OLARAK CALISTIRIN.
    echo.
    echo Sag tikla ve yonetici olarak calistiri'i sec.
    echo.
    echo Enter'e basin cikis icin.
    pause > NUL
    exit
)

cls

rem Delete Temporary Files
del /s /f /q %WinDir%\Temp\*.*
cls
del /s /f /q %WinDir%\Prefetch\*.*
cls
del /s /f /q %Temp%\*.*
cls
del /s /f /q %AppData%\Temp\*.*
cls
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.*
cls
rem Delete Used Drivers Files (Not needed because already installed)
del /s /f /q %SYSTEMDRIVE%\AMD\*.*
cls
del /s /f /q %SYSTEMDRIVE%\NVIDIA\*.*
cls
del /s /f /q %SYSTEMDRIVE%\INTEL\*.*
cls
rem Delete Temporary Folders
rd /s /q %WinDir%\Temp
cls
rd /s /q %WinDir%\Prefetch
cls
rd /s /q %Temp%
cls
rd /s /q %AppData%\Temp
cls
rd /s /q %HomePath%\AppData\LocalLow\Temp
cls
rem Delete Used Drivers Folders (Not needed because already installed)
rd /s /q %SYSTEMDRIVE%\AMD
cls
rd /s /q %SYSTEMDRIVE%\NVIDIA
cls
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
echo !space!Bilgisayar temizlendi ve ek olarak gereksiz %deletedFolders% adet dosya basariyla silindi.!space!
endlocal

pause > NUL
exit