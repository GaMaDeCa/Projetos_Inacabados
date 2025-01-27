@echo off

:: Pode adicionar outros programas separados por espaco, matar o explorer pode ser prejudicial ao computador, de qualquer maneira, se nao funcionar pode ser necessario executar como administrador
set PROGRAMS=("explorer.exe")

:kill_forever
for %%P in %PROGRAMS% do (
	taskkill /f /im %%P
)
goto :kill_forever
