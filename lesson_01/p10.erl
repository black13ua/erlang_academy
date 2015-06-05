-module(p10).
-export([encode/1, getfirst/1]).

encode(List) ->
   encode(p09:pack(List), []).

encode([], Acc) ->
   p05:reverse(Acc);
encode([H|T], Acc) ->
   encode(T, [{p04:len(H), getfirst(H)}|Acc]).

getfirst([Head|_Tail]) ->
   Head.
