-module(p14).
-export([duplicate/1]).

duplicate(List) ->
   duplicate(List, []).

duplicate([], Acc) ->
   p05:reverse(Acc);

duplicate([H|T], Acc) ->
   duplicate(T, [H,H|Acc]).
