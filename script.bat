@echo off
set "CONFIG_FILE=env.txt"

:start
REM Limpa a tela
cls

if exist resultado.txt (del resultado.txt)

if exist "%CONFIG_FILE%"(
	for /f "tokens=* usebackq" %%a in ("%%CONFIG_FILE") do (%%a)
	isql %HOST%:%DATB% -u %USER% -P %PASS% -i sql.sql -o resultado.txt
) else (
	echo Arquivo de configuração. '%CONFIG_FILE%' não encontrado.
)


REM Aguarda 5 minutos (300 segundos)
ping 127.0.0.1 -n 301 > nul

REM Reinicia o script em segundo plano
start /min cmd /c "%~dpnx0"
exit
