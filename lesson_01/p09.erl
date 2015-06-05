-module(p09).
-export([pack/1]).

pack(List) ->
   pack(List, [], []).

pack([], Acc, LL) ->
   p05:reverse([Acc|LL]);

pack([H|T], [], LL) ->
   pack(T, [H], LL);

pack([H|T], Acc=[H|_], LL) ->
   pack(T, [H|Acc], LL);

pack([H|T], Acc, LL) ->
   pack([H|T], [], [Acc|LL]).
   
