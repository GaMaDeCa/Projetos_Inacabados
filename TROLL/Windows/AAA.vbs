'AAA - Auto Ativa Atalhos
Set TECLADO=WScript.CreateObject("WScript.Shell")
Dim TECLAS
TECLAS=Array("{CAPSLOCK}","{ENTER}","{BS}","{DEL}","{HOME}","{PGDN}","{PGUP}","{TAB}","{ESCAPE}","{UP}","{LEFT}","{DOWN}","{RIGHT}")
items=13
i=0
do
	'5 Segundos
	WScript.Sleep 5*1000
	TECLADO.SendKeys TECLAS(i)
	'Aleatorio
	i=Round(Rnd*items)
	'Sequencia
	'i=(i+1) mod items
loop
