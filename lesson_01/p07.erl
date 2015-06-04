-module(p07).
-export([flatten/1]).

flatten(L) -> flatten(L, []).

flatten([], Acc) -> p05:reverse(Acc);

flatten([[Hhead|Htail]|Tail], Acc) ->
   % Debug Info
   %% io:fwrite("Clause 1 [Hhead, Htail, Tail]: ~p~n", [[Hhead, Htail, Tail]]),
   %% io:fwrite("Clause 1 [Acc]: ~p~n", [Acc]),
   flatten(Htail ++ Tail, [Hhead|Acc]);

flatten([H|T], Acc) ->
   % Debug Info
   %% io:fwrite("Clause 2 [H, T]: ~p~n", [[H, T]]),
   %% io:fwrite("Clause 2 [Acc]: ~p~n", [Acc]),
   flatten(T, [H|Acc]).
