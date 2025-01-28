MENSAGEM="Problema?"
BOTOES=CStr(vbAbortRetryIgnore+vbCritical) 'Converte Int pra String
TITULO="Message Bomb(github.com/GaMaDeCa)"

QTO=3 '3 Mensagens
'QTO=0 'Modo Infinito(Não recomendado)

'Cria uma shell pra executar comandos(com janela de console oculta, vbHide)
Set sh=CreateObject("WScript.Shell")
sh.Run "cmd.exe /C ""echo MsgBox """+MENSAGEM+""","+BOTOES+","""+TITULO+""" "+">%TMP%\msg.vbs""",vbHide

If QTO=0 Then
 'Loop infinito
 Do While True
  sh.Run "cmd.exe /C ""%TMP%\msg.vbs""",vbHide
 Loop
Else
 'De 1 até QTO
 For I=1 To QTO
  sh.Run "cmd.exe /C ""%TMP%\msg.vbs""",vbHide
 Next
End If
