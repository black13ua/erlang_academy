-module(bs03).
-export([split/2]).

split(Bin, Delimeter) ->
    DelBin = list_to_binary([Delimeter]),
    DLen = byte_size(DelBin),
    parse_bin(Bin, DelBin, DLen, <<>>, []).

parse_bin(Bin, DelBin, DLen, WordAcc, Result) ->
    case Bin of
        <<DelBin:DLen/binary, Tail/binary>> ->
	    parse_bin(<<Tail/binary>>, DelBin, DLen, <<>>, [WordAcc|Result]);
        <<Byte:1/binary, Tail/binary>> ->
	    parse_bin(<<Tail/binary>>, DelBin, DLen, <<WordAcc/binary, Byte/binary>>, Result);
        <<>> ->
	    lists:reverse([WordAcc|Result])
    end.
