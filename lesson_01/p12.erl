-module(p12).
-export([decodem/1, decodem/2]).

decodem(List) ->
   decodem(p05:reverse(List), []).

decodem([], Acc) ->
   Acc;
decodem([{0, _Letter}|T], Acc) ->
   decodem(T, Acc);
decodem([{X, Letter}|T], Acc) ->
   decodem([{X - 1, Letter}|T], [Letter|Acc]);
decodem([H|T], Acc) ->
   decodem(T, [H|Acc]).
