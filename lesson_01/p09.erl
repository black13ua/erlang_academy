-module(p09).
-export([pack/1]).

%pack(L) -> pack(L,[]).

%pack([],Acc) -> p05:reverse(Acc);
%pack([H|T],[]) -> pack(T, [[H]]);
%pack([H|T],Acc=[H|_]) -> pack(T, Acc);
%pack([H|T],Acc) -> pack(T, [H|Acc]).

pack(L) -> pack(L,[],[]).

pack([], Sublist, Acc) ->
