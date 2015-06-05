-module(p15).
-export([replicate/2, repeat/2]).

replicate(List, X) ->
   replicate(p05:reverse(List), X, []).


replicate([], _X, GlobalAcc) ->
   p07:flatten(GlobalAcc);

replicate([H|T], X, GlobalAcc) ->
   replicate(T, X, [repeat(H,X)|GlobalAcc]).


repeat(Simbol, Count) ->
   repeat(Simbol, Count, []).

repeat(_Simbol, 0, Acc) ->
   Acc;

repeat(Simbol, Count, Acc) ->
   repeat(Simbol, Count - 1, [Simbol|Acc]).
