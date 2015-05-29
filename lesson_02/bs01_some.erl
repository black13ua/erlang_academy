-module(bs01).
-export([first_word/1]).

first_word(Binary) ->
   first_word(Binary, <<>>).

first_word(<<>>, Acc) -> Acc;

%first_word(<<H:1/binary, T/binary>>, Acc) ->
%   first_word(<<T/binary>>, [H = ' '|Acc]); 

first_word(<<H:1/binary, T/binary>>, Acc) ->
   first_word(<<T/binary>>, [H|Acc]).
%%   first_word(<<T/binary>>, <<H/binary, Acc/binary>>).
