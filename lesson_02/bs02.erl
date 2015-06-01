-module(bs02).
-export([words/1, parse_space/3]).

words(Binary) ->
   parse_space(Binary, <<>>, []).

parse_space(<<>>, Acc, Words) ->
   lists:reverse([Acc|Words]);
parse_space(<<Space:1/binary, Tail/binary>>, Acc, Words) ->
   check_space(Space, Tail, Acc, Words).

check_space(Space, Tail, Acc, Words) ->
   if
	Space =:= <<" ">> ->
		parse_space(<<Tail/binary>>, <<>>, [Acc|Words]);
	true ->
		parse_space(<<Tail/binary>>, <<Acc/binary, Space/binary>>, Words)
   end.
