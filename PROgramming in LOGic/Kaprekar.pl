% Kaprekar Constant - 6174(Prolog)
% Computes the Kaprekar Constant.

% Ive made it with the help of ChatGPT
% Actually the "GPT" didnt make the main code, it just fixed the wrong
% methods cause it was my first time using this language, it helped me
% to understand many things though, the other codes are results of my
% learning(I didnt asked for "AI" to make them), its not hard to program
% in this language, it may be confusing to program for too long, also,
% the "fluxogram maker"(using the lib graphivz) is quite good, I never
% saw something so easy and good, see the "Android Activity Lifecycle" example.

% Convert number to list of digits
number_to_digits(Number, Digits) :-
    number_chars(Number, Chars),
    maplist(atom_number, Chars, Digits).

% Convert list of digits to number
digits_to_number(Digits, Number) :-
    maplist(number_chars, Digits, CharLists),
    flatten(CharLists, Chars),
    atom_chars(Atom, Chars),
    atom_number(Atom, Number).

% Kaprekar routine
kaprekar(Number, Iteration) :-
    Number \= 6174,
    number_to_digits(Number, Digits),
    msort(Digits, Ascending),
    reverse(Ascending, Descending),
    digits_to_number(Ascending, Small),
    digits_to_number(Descending, Large),
    Computed is Large - Small,
    format("~w - ~w (~w - ~w)~n", [Iteration, Computed, Large, Small]),
    NextIteration is Iteration + 1,
    kaprekar(Computed, NextIteration).

% Main entry point
main :-
    prompt(_, 'Type a 4-digit number that uses at least 2 different digits or \'stop\': '),
    read(Input),
    ( Input == stop ->
        writeln('Exiting...')
    ; number_to_digits(Input, _),
      kaprekar(Input, 1);
      Input == 6174,
      writeln("1 - 6174 (7641 - 1467)")
    ).

/** <examples>
    ?- main.
*/
