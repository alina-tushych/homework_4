-module(bs01).
-export([first_word/1]).

%Извлечь из строки первое слово

first_word(Bin) ->
    first_word(Bin, <<>>).
first_word(<<" ", _/binary>>, Acc) ->
    Acc;
first_word(<<C/utf8, Rest/binary>>, Acc) ->
    first_word(Rest, <<Acc/binary, C/utf8>>);
first_word(<<>>, Acc) ->
    Acc.

%%-ifdef(TEST).
-include_lib("eunit/inlude/eunit.hrl").

bs01_test_() -> [
    ?_assert(first_word(<<>>) =:= <<>>),
    ?_assert(first_word(<<" ">>) =:= <<>>),
    ?_assert(first_word(<<"Hello">>) =:= <<"Hello">>),
    ?_assert(first_word(<<"Hello world!">>) =:= <<"Hello">>)
].
%%-endif.
