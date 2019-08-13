@echo off
::杀掉IE进程
taskkill /f /im iexplore.exe 1>nul 2>nul
::勾选为LAN使用代理服务器
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f>nul
::设置代理服务器地址跟端口
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "127.0.0.1:8080" /f>nul
::勾选对本地地址不使用代理服务器
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "<local>" /f>nul
::刷新DNS缓存
ipconfig /flushdns>nul
echo 代理服务器设置完成
