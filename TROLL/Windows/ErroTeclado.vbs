'A cada 3 segundos sera enviado pro teclado uma das duas palavras, Erro ou algumas letras aleatorias, aleatoriamente, use um bloco de notas e veja essas palavras aparecendo do nada

Set TECLADO=WScript.CreateObject("WScript.Shell")
Dim PALAVRAS
PALAVRAS=Array("[´dç[w;d23-;3.c3;","Erro")
items=2
palavra=0
do
	WScript.Sleep 3*1000
	TECLADO.SendKeys PALAVRAS(palavra)
	palavra=Round(Rnd*items)
loop
