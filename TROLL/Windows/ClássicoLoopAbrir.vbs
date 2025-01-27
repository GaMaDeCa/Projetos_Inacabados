On Error Resume Next
Set SYS=WScript.CreateObject("WScript.Shell")

'A cada 10 segundos abre um programa aleatorio
'Programas:
' Bloco de Notas
' Google Chrome
' Mozilla Firefox
' Calculadora
' MS Paint
' Prompt de Comando

Tempo=10*1000

Do
	WScript.Sleep Tempo
	SYS.Run "notepad"
	WScript.Sleep Tempo
	SYS.Run "chrome"
	WScript.Sleep Tempo
	SYS.Run "firefox"
	WScript.Sleep Tempo
	SYS.Run "calc"
	WScript.Sleep Tempo
	SYS.Run "mspaint"
	WScript.Sleep Tempo
	SYS.Run "cmd"
Loop
