-module(p04).
-export([len/1]).

%Посчитать количество элементов списка

len([]) -> 0;
len([_H|T]) -> 1 + len(T).

%хвостовая рекурсия

%len(L) -> len(L,0);
%len([_H|T], N) -> len(T, N+1);
%len([], N) -> N.

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p04_test_() -> [
    ?_assert(len([]) =:= 0),
    ?_assert(len([7]) =:= 1),
    ?_assert(len([1,7,7,7,7]) =:= 5)
].
%%-endif.
