MsgBox "Cuidado! Programa falhou durante os testes, ele não é atualmente seguro para encriptar arquivos! Você pode perder seus arquivos! Do not use this program, this program failed during tests and corrupted the test file instead of encrypting it! You can lose your files!"

CaminhoArquivoEntrada=InputBox("Insira o caminho de entrada do arquivo: ","VBS XOr")
Senha=InputBox("Insira sua senha XOr: ","VBS XOr")
CaminhoArquivoSaida=InputBox("Insira o caminho de saída do arquivo: ","VBS XOr")

Set FS=CreateObject("Scripting.FileSystemObject")

Set ArquivoEntrada=FS.OpenTextFile(CaminhoArquivoEntrada)
Set ArquivoSaida=FS.CreateTextFile(CaminhoArquivoSaida,True)

Function XorArquivo(ArquivoEntrada,ArquivoSaida,Senha)
	Do Until ArquivoEntrada.AtEndOfStream
	 Linha=ArquivoEntrada.Read(34603008)
	 LinhaXOR=""
	 For I=1 To Len(Linha)
	  CarTxt=Mid(Linha,I,1)
	  CarPass=Mid(Senha,(I Mod Len(Senha))+1,1)
	  LinhaXOR=LinhaXOR+Chr(Asc(CarTxt) XOr Asc(CarPass))
	 Next
	 ArquivoSaida.Write LinhaXOR
	Loop
	ArquivoEntrada.Close
	ArquivoSaida.Close
End Function

XorArquivo ArquivoEntrada,ArquivoSaida,Senha
