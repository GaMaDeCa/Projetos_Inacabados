Program PascalTriangle;

// TODO > Hexagrammum Mysticum Theorem
Var
	n, r, coefficient, maxRows, spaces: integer;

Begin
	Write('Pascal Triangle Rows: ');
	ReadLn(maxRows);
	WriteLn;
	WriteLn('Pascal Triangle with ', maxRows, ' rows:');
	WriteLn;
	For n := 0 To maxRows Do
		Begin
			spaces := maxRows - n;
			For r := 1 To spaces Do
				Write(' ');
			coefficient := 1;
			For r := 0 To n Do
				Begin
					Write(coefficient, ' ');
					coefficient := Round(coefficient * (n - r) / (r + 1));
					{ Thx: https://www.geeksforgeeks.org/python/python-program-to-print-pascals-triangle/ }
				End;
			For r := 1 To spaces Do
				Write(' ');
			WriteLn;
		End;
	ReadLn;
End.