-module(p11).
-export([encode_modified/1]).

encode_modified(List) ->
    encode_modified(p05:reverse(List), 1, [], []).

encode_modified([], _N, [], Acc) ->
    Acc;

encode_modified([Head|Tail], N, [], _Acc) ->
    encode_modified(Tail, N, [Head], []);

encode_modified([Head|Tail], N, [Head]=[Tmp], Acc) ->
    encode_modified(Tail, N + 1, [Head], Acc);

encode_modified([Head|Tail], N=1, [Tmp], Acc) ->
    encode_modified(Tail, 1, [Head], [Tmp|Acc]);

encode_modified([Head|Tail], N, [Tmp], Acc) ->
    encode_modified(Tail, 1, [Head], [{N, Tmp}|Acc]);

encode_modified([], N=1, [Tmp], Acc) ->
    encode_modified([], N, [], [Tmp|Acc]).
