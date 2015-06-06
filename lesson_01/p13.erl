-module(p13).
-export([decode/1]).

decode(List) ->
   decode(p05:reverse(List), []).

decode([], Acc) ->
   Acc;
decode([{0, _Letter}|T], Acc) ->
   decode(T, Acc);
decode([{X, Letter}|T], Acc) ->
   decode([{X - 1, Letter}|T], [Letter|Acc]).
