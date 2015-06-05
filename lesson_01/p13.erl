-module(p13).
-export([decode/1]).

decode(List) ->
   decode(p05:reverse(List), []).

decode([], Acc) ->
   Acc;

decode([{Count=0,Letter}|T], Acc) ->
[Count, Acc];
%   decode([{0, Letter}|T], [Letter|Acc]);

decode([{Count,Letter}|T], Acc) ->
   decode([{Count - 1, Letter}|T], [Letter|Acc]).
