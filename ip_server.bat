﻿@echo off

set URL="http://20140507.ip138.com/ic.asp"

:again

for /f "tokens=2 delims=[]" %%a in ('wget -q "%URL%" -O -') do (

    set "PublicIP=%%a"

)

:: 等于null 要严格测试
if defined PublicIP (
ping 127.1 -n 10>nul
goto again
)

for /f "tokens=1" %%i in (hosts)

if %PublicIP%==%%i (
exit
)else (
echo %PublicIP% jamka.ze > F:\all-tech\source_code\GitDns\hosts
sh commit.sh
exit
)

pause