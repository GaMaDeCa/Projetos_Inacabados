Set EXEC=WScript.CreateObject("WScript.Shell")
Dim DIRECAO
DIRECAO=Array("{UP}","{DOWN}","{LEFT}","{RIGHT}")
items=4
'5000=5 segundos
tempo=5*1000
i=Round(Rnd*items)
do
	WScript.Sleep tempo
	EXEC.SendKeys "^%" & DIRECAO(i)
	i=Round(Rnd*items)
loop
