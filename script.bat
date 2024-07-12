@echo off
set "CONFIG_FILE=env.txt"

REM Limpa a tela
cls

if exist resultado.txt (del resultado.txt)

if exist "%CONFIG_FILE%"(
	for /f "tokens=* usebackq" %%a in ("%%CONFIG_FILE") do (%%a)
	isql %HOST%:%DATB% -u %USER% -P %PASS% -i sql.sql -o resultado.txt
) else (
	echo Arquivo de configuração. '%CONFIG_FILE%' não encontrado.
)

pause
