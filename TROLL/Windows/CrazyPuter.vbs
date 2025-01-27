'CrazyPuter.vbs - ComPutadorMaluco
'TODO>Test It - Testar(seloco, vo testa nao)
Set K=CreateObject("WScript.Shell")

Function RandInt(minimo,maximo)
 RandInt=Int((maximo-minimo)*Rnd+minimo)
End Function

Function CatDancesInKeyboard(How_Long)
 ASDFG=""
 For I=1 To How_Long
  OP=I Mod 3
  TXT=""
  If OP=0 Then
   TXT=Chr(RandInt(48,57))
  ElseIf OP=1 Then
   TXT=Chr(RandInt(65,90))
  Else
   TXT=Chr(RandInt(97,122))
  End If
  ASDFG=ASDFG+TXT
 Next
 CatDancesInKeyboard=ASDFG
End Function

Function Text_Multiply(Text,How_Much)
 TXT=""
 For I=1 To How_Much
  TXT=TXT+Text
 Next
 Text_Multiply=TXT
End Function

Do While True
 'Crazy
 K.SendKeys(CatDancesInKeyboard(RandInt(1,500))+Text_Multiply("{TAB}",RandInt(1,100))+Text_Multiply("{ENTER}",RandInt(1,20))+Text_Multiply("{UP}{DOWN}{LEFT}{RIGHT}",RandInt(1,100)))
 D="DOWN"
 If RandInt(0,2)=1 Then
  D="LEFT"
 ElseIf RandInt(0,2)=1 Then
  D="RIGHT"
 ElseIf RandInt(0,2)=1 Then
  D="UP"
 End If
 K.SendKeys("%^{"+D+"}")
Loop
