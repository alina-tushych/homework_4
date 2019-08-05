-module(bs03).
-export([split/2]).

%Разделить строку на части, с явным указанием разделителя

split(BinText, Sep) -> 
    BinSep = list_to_binary(Sep),
    Size = byte_size(BinSep),
    split(BinText, BinSep, Size, <<>>, []).
split(Bin, Sep, Size, Word, Acc) ->
    case Bin of
        <<Sep:Size/binary, Rest/binary>> ->
            split(Rest, Sep, Size, <<>>, [Word|Acc]);
        <<C/utf8, Rest/binary>> ->
            split(Rest, Sep, Size, <<Word/binary, C/utf8>>, Acc);
        <<>> ->
            lists:reverse([Word|Acc])
    end.

%%-ifdef(TEST).
-include_lib("eunit/inlude/eunit.hrl").

bs03_test_() -> [
    ?_assert(split(<<>>, " ") =:= [<<>>]),
    ?_assert(split(<<" ">>, " ") =:= [<<>>, <<>>]),
    ?_assert(split(<<"Hello-world!">>, "-") =:= [<<"Hello">>, <<"world!">>])
].
%%-endif.

