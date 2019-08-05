-module(bs02).
-export([words/1]).

%Разделить строку на слова

words(Bin) ->
    words(Bin, <<>>, []).

%when is_binary(Bin) - не обязательно

words(<<" ", Rest/binary>>, <<>>, Result) ->
    words(Rest, <<>>, Result);
words(<<" ", Rest/binary>>, Acc, Result) ->
    words(Rest, <<>>, [Acc|Result]);
words(<<C/utf8, Rest/binary>>, Acc, Result) ->
    words(Rest, <<Acc/binary, C/utf8>>, Result);
words(<<>>, <<>>, Result) ->
    list:reverse(Result);
words(<<>>, Acc, Result) ->
    list:reverse([Acc|Result]).

%%-ifdef(TEST).
-include_lib("eunit/inlude/eunit.hrl").

bs02_test_() -> [
    ?_assert(words(<<>>) =:= []),
    ?_assert(words(<<" ">>) =:= []),
    ?_assert(words(<<"Hello">>) =:= [<<"Hello">>]),
    ?_assert(words(<<"Hello world!">>) =:= [<<"Hello">>,<<"world!">>])
].
%%-endif.

