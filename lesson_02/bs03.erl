-module(bs03).
-export([split/2]).

split(Binary, Delimeter) ->
    parse_binary(Binary, list_to_binary([Delimeter]), len(Delimeter), <<>>, []).

parse_binary(<<>>, _BinDltr, _DLen, BinAcc, Result) ->
    Result;

parse_binary(Binary, BinDltr, DLen, BinAcc = <<>>, Result) ->
    <<BHead:DLen/binary, BTail/binary>> = Binary,
    parse_binary(Binary, BinDltr, DLen, <<BHead/binary, BinAcc/binary>>, Result);

parse_binary(Binary, BinDltr, DLen, BinAcc, Result) ->
    <<BHead:DLen/binary, BTail/binary>> = Binary,
    <<HBAcc:1/binary, TBAcc/binary>> = BinAcc,
    case check_delimeter(BinDltr, BinAcc) of
	true ->
		parse_binary(BTail, BinDltr, DLen, <<>>, Result);
	false ->
		io:format("To loop: ~p~n", [[TBAcc, BTail, Result]]),
		parse_binary(<<TBAcc/binary, BTail/binary>>, BinDltr, DLen, <<TBAcc/binary, BTail:1/binary>>, [HBAcc|Result])
    end.

check_delimeter(BinDltr, BinAcc) ->
    %%% Debug output
    io:format("Check Delimeter with: ~p~n", [[BinDltr, BinAcc]]),
    %%%
    if
	BinDltr =:= BinAcc ->
		true;
		%io:format("Match Delimeter! ~p~n", [[BinDltr, BinAcc]]);
	true ->
		false
    end.


%%% Additional functions %%%
%%%
len(Delimeter) ->
    len(Delimeter,0).
 
len([], Acc) ->
    Acc;
len([_|T], Acc) ->
    len(T, Acc+1).
%%%
