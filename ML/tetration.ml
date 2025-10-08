fun pow(x: int, y: int): int =
    if y = 0 then 1
    else x * pow(x, y - 1);

fun tetration(x: int, y: int): int =
    if y = 0 then 1
    else pow(x, tetration(x, y - 1));

val result = tetration(3, 3);  (* Result: ...3^27 = 7.625.597.484.987 *)