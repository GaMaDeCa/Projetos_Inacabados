% Matrix Calculation.

-module(main).

sum() -> fun(X1, X2) ->         X1 + X2 end.
subtract() -> fun(X1, X2) ->    X1 - X2 end.
multiply() -> fun(X1, X2) ->    X1 * X2 end. % Known also as "Dot Product"
divide() -> fun(X1, X2) ->      X1 / X2 end.

% R1 = Row 1, R2 = Row 2
row_compute(F, R1, R2) -> lists:zipwith(F, R1, R2). % X1 and X2 are the numbers of Matrix1 and Matrix2

% M1 = Matrix 1, M2 = Matrix 2
matrix_compute(F, M1, M2) -> [ row_compute(F, R1, R2) || {R1, R2} <- lists:zip(M1, M2) ].

% Only works with numbers!
row2text(R) -> string:join(lists:map(fun(Int) -> integer_to_list(Int) end, R), ",").

frow2text(R) -> string:join(lists:map(fun(Int) -> float_to_list(Int) end, R), ",").
% Only works with numbers!
matrix2text(M) ->
  matrix2text(M, 1, length(M) + 1).

matrix2text(M, T) ->
  case T of
    "float" -> fmatrix2text(M, 1, length(M) + 1);
    _ -> matrix2text(M, 1, length(M) + 1)
  end.

matrix2text(M, I, E) when I < E ->
  io:fwrite("~s~n", [row2text(lists:nth(I, M))]),
  matrix2text(M, I + 1, E);

matrix2text(_, _, _) ->
    ok.
    
fmatrix2text(M, I, E) when I < E ->
  io:fwrite("~s~n", [frow2text(lists:nth(I, M))]),
  fmatrix2text(M, I + 1, E);

fmatrix2text(_, _, _) ->
    ok.

main(_) ->
  Matrix1 = [
    [1,2,3],
    [9,8,7],
    [5,3,3]
  ],
  Matrix2 = [
    [3,1,2],
    [3,2,4],
    [8,9,7]
  ],
  MatrixSum = matrix_compute(sum(), Matrix1, Matrix2),
  MatrixSub = matrix_compute(subtract(), Matrix1, Matrix2),
  MatrixMul = matrix_compute(multiply(), Matrix1, Matrix2),
  MatrixDiv = matrix_compute(divide(), Matrix1, Matrix2),
  io:fwrite("Matrix 1:\n"),
  matrix2text(Matrix1),
  io:fwrite("\nMatrix 2:~n"),
  matrix2text(Matrix2),
  io:fwrite("\nSum:\n"),
  matrix2text(MatrixSum),
  io:fwrite("~nSubtract:~n"),
  matrix2text(MatrixSub),
  io:fwrite("\nProduct(Multiply):\n"),
  matrix2text(MatrixMul),
  io:fwrite("~nDivision:~n"),
  matrix2text(MatrixDiv,"float").