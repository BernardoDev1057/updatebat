@echo off
:start
REM Insira aqui o comando que deseja executar a cada 5 minutos
echo Executando minha instrução...

REM Aguarda 5 minutos (300 segundos)
ping 127.0.0.1 -n 301 > nul

REM Reinicia o script em segundo plano
start /min cmd /c "%~dpnx0"
exit
