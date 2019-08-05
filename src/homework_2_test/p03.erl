-module(p03).
-export([element_at/2]).

%Найти N-й элемент списка

element_at([],_) -> undefined;
%element_at([H|T],0) -> undefined;
element_at([H|_T],1) -> H;
element_at([_H|T], N) -> element_at(T, N-1).

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p03_test_() -> [
    ?_assert(element_at([], 5) =:= undefined),
    ?_assert(element_at([2,3,4], 0) =:= undefined),
    ?_assert(element_at([1,2,3,4], 5) =:= undefined),
    ?_assert(element_at([1,2,3,4,5,6,7], 5) =:= 5)
].
%%-endif.
