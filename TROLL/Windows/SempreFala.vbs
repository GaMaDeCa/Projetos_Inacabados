Set SAPI=WScript.CreateObject("SAPI.SpVoice")
Texto="Continuando a falar! Para sempre! 1,2,3"
Do
	SAPI.Speak(Texto)
Loop