-module(p07).
-export([flatten/1]).

flatten(L) -> flatten(L,[]).

flatten([],Acc) -> Acc;
flatten([[Hhead|Htail]|Tail],Acc) -> flatten(Htail, [Hhead|Acc]);
flatten([H|T],Acc) -> flatten(T, [H|Acc]).
