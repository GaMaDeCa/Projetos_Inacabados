% Pascal Triangle in Erlang(ChatGPT with a few changes) - This looks a lot like Prolog

-module(pascal).
-export([triangle/1]).

triangle(N) when N >= 0 ->
    triangle(0, N).	% Dots are used to terminate some expressions/functions/etc.

% Adds 1 in Current until it gets > Max(then stops)
% The row is computed with the Current index
triangle(Current, Max) when Current =< Max ->
    Row = row(Current),	% Like Prolog, Erlang functions works using the "and" operator "," if the current expression is true then the next one is executed
    Spaces = lists:duplicate( Max + 1 - length(Row), " "), % I've changed this part, I added the spaces formatting cause ChatGPT just printed the whole rows with ~p
    io:format("~s~s~s~n", [Spaces, string:join(lists:map(fun(Int) -> integer_to_list(Int) end, Row), " "), Spaces]), % This spaces is the inner space(between the numbers)
    triangle(Current + 1, Max);

triangle(_, _) ->
    ok.
row(0) -> [1];
row(N) ->
    Prev = row(N - 1),
    [1 | inner_row(Prev)] ++ [1]. % This is the row being build [1...numbers...1]
inner_row([A, B | Rest]) ->
    [A + B | inner_row([B | Rest])]; % Inner row computation
    inner_row([_]) -> [];
    inner_row([]) -> []. % If no more args, empty [] is returned

pascal(_) ->
  triangle(6),
  io:fwrite("\n"),
  triangle(0, 3).