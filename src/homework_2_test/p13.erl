-module(p13).
-export([decode/1]).

%Написать декодер для стандартного алгоритма RLE

decode([]) -> [];
decode([{0, _S}|T]) -> decode(T);
decode([{N, S}|T]) -> [S|decode([{N-1, S}|T])].

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p13_test_() -> [
    ?_assert(decode([]) =:= []),
    ?_assert(decode([{3,1}]) =:= [1,1,1]),
    ?_assert(decode([{3,1},{2,2},{1,3}]) =:= [1,1,1,2,2,3])
].
%%-endif.

