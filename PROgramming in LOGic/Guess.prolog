% Guess a Number(Bcoz why not?)
% Tested with "SWISH Prolog Online"

% Its a bit buggy, you need to restart each time you win
% If not then the game starts to give random wrong messages
guess_loop(Number) :-
    (Number = _,
     random(1, 100, Number),
     guess_loop(Number)
     ;
     1=1
    ),
    prompt(_, 'Guess the random number(between 1 and 100)'),
    read(Guess),
    (
    Guess = Number -> format("You've guessed it correctly!~nThe number was: ~w", [Number])
    ;
    writeln("Wrong!"),
    (Guess > Number -> writeln("Too big!");
     Guess < Number -> writeln("Too small!")),
    guess_loop(Number)
    ).

/** <examples>

?- guess_loop(_).

*/