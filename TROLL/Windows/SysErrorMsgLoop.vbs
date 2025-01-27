' Um loop infinito basico com um msgbox de um numero aleatorio de erro de sistema
Do
	MsgBox "Erro no endereço de memória 0x"&Round(Rnd*99999999)&"",16,"Erro Crítico do Sistema"
Loop
