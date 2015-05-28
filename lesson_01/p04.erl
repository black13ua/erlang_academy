-module(p04).
-export([len/1]).

%len([]) ->
%	0;
%len([H|T]) ->
%	X = len(T),
%	X + 1.

 len(List) ->
   len(List,0).
 len([H|T],Acc) ->
   len(T,Acc+1);
 len([],Acc) ->
   Acc.
