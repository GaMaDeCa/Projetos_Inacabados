' Abre e fecha a gaveta de CD infinitamente
On Error Resume Next

Set oWMP=CreateObject("WMPlayer.OCX.7")
Set colCDROMs=oWMP.cdromCollection

If colCDROMs.Count>=1 Then
	Do
		For i=0 to colCDROMs.Count-1
			colCDROMs.Item(i).Eject
		Next
	Loop
End If