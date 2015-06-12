-module(bs02).
-export([words/1]).

words(Binary) ->
    parse_space(Binary, <<>>, []).

parse_space(Binary, Acc, Words) ->
    case Binary of
	<<" ", Tail/binary>> ->
		parse_space(<<Tail/binary>>, <<>>, [Acc|Words]);
	<<Letter:1/binary, Tail/binary>> ->
		parse_space(<<Tail/binary>>, <<Acc/binary, Letter/binary>>, Words);
	<<>> ->
		lists:reverse([Acc|Words])
    end.
