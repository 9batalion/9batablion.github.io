@echo off
setlocal
cd /d "%~dp0"
set "NODE_EXE="
if exist "%~dp0node\node.exe" set "NODE_EXE=%~dp0node\node.exe"
if not defined NODE_EXE (
  where node >nul 2>nul
  if not errorlevel 1 set "NODE_EXE=node"
)
if not defined NODE_EXE (
  echo.
  echo [BLAD] Nie znaleziono Node.js.
  echo Zainstaluj Node.js 18+ albo umiesc portable node.exe w folderze node\
  echo.
  pause
  exit /b 1
)
set "AQUA_APP_FILE=index.html"
start "" cmd /c "ping 127.0.0.1 -n 2 ^>nul ^& start http://127.0.0.1:8787/"
"%NODE_EXE%" "%~dp0agent-server.mjs"
if errorlevel 1 (
  echo.
  echo Serwer zakonczyl sie bledem.
  pause
)
endlocal
