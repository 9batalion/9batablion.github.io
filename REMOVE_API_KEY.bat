@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Environment]::SetEnvironmentVariable('OPENAI_API_KEY',$null,'User'); Write-Host 'Usunieto OPENAI_API_KEY z profilu uzytkownika.' -ForegroundColor Green; Read-Host 'Enter aby zakonczyc'"
