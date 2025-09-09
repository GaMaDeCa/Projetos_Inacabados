% Get percentage and degrees from list values
% Tested with "SWISH Prolog Online"

% This fits the current List value into some custom "Limit" or "Size".
% For example, to get percentage this "limit" should be 100, to get degrees this limit should be 360.
getMapItem(Total, MapSize, Item, Result) :- Result is Item / Total * MapSize.

getMapList(List, ToSize, MappedList) :-
    sum_list(List, TotalSum),
    maplist(getMapItem(TotalSum, ToSize), List, MappedList).

% The sum of the new generated list should be 100.00%
getPercentageList(List) :-
    getMapList(List, 100, PrcntList),
    writeln(PrcntList),
    sum_list(PrcntList, PrcntSum),
    format('Total Percentage(Should be always 100.00~~): ~w', [PrcntSum]).

% The sum of the new generated list should be 360°
getDegreeList(List) :-
    getMapList(List, 360, DegreList),
    writeln(DegreList),
    sum_list(DegreList, DegreeSum),
    format('Total Degree(Should be always 360.0): ~w', [DegreeSum]).


print_two_lists([], [], _). % Base case: when both lists are empty, stop(Thanks Gemini).
print_two_lists([H1|T1], [H2|T2], Formatted) :-
    format('~w, ', [H1]),
    (
    Formatted =:= 1 -> format('~3f %~n', [H2]);
    Formatted =:= 10 -> format('~2f °~n', [H2]);
    format('~w~n', [H2])
    ),
    print_two_lists(T1, T2, Formatted). % Recursive call for the tails

getFarmAnimalStatistics(NameList, NumberList, Formatted) :-
    writeln("[+] --- ANIMALS"),
    print_two_lists(NameList, NumberList, 0), % No need to format
    writeln(''), writeln("[+] --- IN PERCENTAGES"),
    getMapList(NumberList, 100, PrcntList),
    print_two_lists(NameList, PrcntList, Formatted),
    writeln(''), writeln("[+] --- IN DEGREES(FOR SLICES IN A PIE CHART)"),
    getMapList(NumberList, 360, DegreList),
    print_two_lists(NameList, DegreList, Formatted+9).
    
/** <examples>

?- getPercentageList([1,3,4,55,22,41,54,4]).
?- getDegreeList([1,3,4,55,22,41,54,4]).
?- getFarmAnimalStatistics(['Cows', 'Chickens', 'Pigs', 'Sheeps', 'Dogs'], [4, 10, 8, 12, 3], 1).

*/