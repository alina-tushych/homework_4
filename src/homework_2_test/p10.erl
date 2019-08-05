-module(p10).
-export([encode/1]).

%Закодировать список с использованием алгоритма RLE

encode(L) -> encode(L, 1).
encode([], _) -> [];
encode([H, H|T], N) -> encode([H|T], N+1);
encode([H|T], N) -> [{N, H}|encode(T, 1)].

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p10_test_() -> [
    ?_assert(encode([]) =:= []),
    ?_assert(encode([1]) =:= [{1,1}]),
    ?_assert(encode([1,1,2,2,2,3,3]) =:= [{2,1}, {3,2}, {2,3}])
].
%%-endif.
