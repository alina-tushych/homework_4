-module(p01).
-export([last/1]).

%Найти последний элемент списка

last([H|[]]) -> H;
last([_H|T]) -> last(T).

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p01_test_() -> [
    ?_assert(last([]) =:= []),
    ?_assert(last([1]) =:= 1),
    ?_assert(last([1, 2]) =:= 2)
].
%%-endif.

