-module(p04).
-export([len/1]).

len(List) ->
   len(List, 0).
len([_H|T], Acc) ->
   len(T, Acc+1);
len([], Acc) ->
   Acc.
