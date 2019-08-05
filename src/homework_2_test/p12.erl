-module(p12).
-export([decode_modified/1]).

%Написать декодер для модифицированого алгоритма RLE

decode_modified(L) -> decode_modified(L, 1).
decode_modified([], 1) -> [];
decode_modified([{N, S}|T], 1) -> decode_modified([S|T], N);
decode_modified([H|T], 1) -> [H|decode_modified(T, 1)];
decode_modified([S|T], N) -> [S|decode_modified([S|T], N-1)].

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p12_test_() -> [
    ?_assert(decode_modified([]) =:= []),
    ?_assert(decode_modified([1]) =:= [1]),
    ?_assert(decode_modified([{5,1}]) =:= [1,1,1,1,1]),
    ?_assert(decode_modified([{2,1},6]) =:= [1,1,6])
].
%%-endif.
