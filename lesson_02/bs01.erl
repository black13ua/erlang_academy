-module(bs01).
-export([first_word/1, parse_space/2]).

first_word(Binary) ->
   parse_space(Binary, <<>>).

parse_space(<<Space:1/binary, Tail/binary>>, Acc) ->
   check_space(Space, Tail, Acc).

% Additional Check
%   case check_space(Space, Tail, Acc) of
%	ok -> ok;
%	  if
%		Space =:= ' ' -> {ok, find};
%		true -> parse_space(Tail, [Space|Acc])
%	  end;
%	Any -> Any
%   end.

check_space(Space, Tail, Acc) ->
   if
	Space =:= <<" ">> ->
		Acc;
	true ->
		parse_space(<<Tail/binary>>, <<Acc/binary, Space/binary>>)
   end.
