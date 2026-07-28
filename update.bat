@echo off
:: Geen setlocal om fouten te voorkomen

echo ============================================
echo       Update_Schip_Montana
echo ============================================

:: 1. Controleer op Admin rechten
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [FOUT] Rechtermuisknop -^> Als administrator uitvoeren.
    pause
    exit /b
)

:: 2. Map instellen
set appDir=C:\Program Files (x86)\KVB Montana
set baseUrl=https://raw.githubusercontent.com/scheepsapp/Update_Kvb_Montana/refs/heads/main

:: 3. Elk bestand handmatig

echo Bezig met reizen.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/reizen.html' -OutFile '%TEMP%\reizen.html'"
if exist "%appDir%\reizen.html" attrib -h -s -r "%appDir%\reizen.html"
move /y "%TEMP%\reizen.html" "%appDir%\reizen.html" >nul
attrib +h +s +r "%appDir%\reizen.html"

echo Bezig met adn.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/adn.html' -OutFile '%TEMP%\adn.html'"
if exist "%appDir%\adn.html" attrib -h -s -r "%appDir%\adn.html"
move /y "%TEMP%\adn.html" "%appDir%\adn.html" >nul
attrib +h +s +r "%appDir%\adn.html"

echo Bezig met index.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/index.html' -OutFile '%TEMP%\index.html'"
if exist "%appDir%\index.html" attrib -h -s -r "%appDir%\index.html"
move /y "%TEMP%\index.html" "%appDir%\index.html" >nul
attrib +h +s +r "%appDir%\index.html"

echo Bezig met waterstanden.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/waterstanden.html' -OutFile '%TEMP%\waterstanden.html'"
if exist "%appDir%\waterstanden.html" attrib -h -s -r "%appDir%\waterstanden.html"
move /y "%TEMP%\waterstanden.html" "%appDir%\waterstanden.html" >nul
attrib +h +s +r "%appDir%\waterstanden.html"

echo Bezig met reefer.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/reefer.html' -OutFile '%TEMP%\reefer.html'"
if exist "%appDir%\reefer.html" attrib -h -s -r "%appDir%\reefer.html"
move /y "%TEMP%\reefer.html" "%appDir%\reefer.html" >nul
attrib +h +s +r "%appDir%\reefer.html"

:: Nieuw bestand: stabiliteit.html
echo Bezig met stabiliteit.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/stabiliteit.html' -OutFile '%TEMP%\stabiliteit.html'"
if exist "%appDir%\stabiliteit.html" attrib -h -s -r "%appDir%\stabiliteit.html"
move /y "%TEMP%\stabiliteit.html" "%appDir%\stabiliteit.html" >nul
attrib +h +s +r "%appDir%\stabiliteit.html"

echo.
echo ============================================
echo       KLAAR! Alle bestanden bijgewerkt.
echo ============================================
pause