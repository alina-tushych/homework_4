-module(p14).
-export([duplicate/1]).

%Написать дубликатор всех элементов входящего списка

duplicate([]) -> [];
duplicate([H|T]) -> [H, H|duplicate(T)].

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p14_test_() -> [
    ?_assert(duplicate([]) =:= []),
    ?_assert(duplicate([1]) =:= [1,1]),
    ?_assert(duplicate([1,2,3,4,4]) =:= [1,1,2,2,3,3,4,4,4,4])
].
%%-endif.
