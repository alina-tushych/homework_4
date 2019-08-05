-module(p15).
-export([replicate/2]).

%Написать функцию-репликатор всех элементов входящего списка

replicate(L, N) -> replicate(L, N, N).
replicate([_H|T], N, 0) -> replicate(T, N, N);
replicate([H|T], N, N1) -> [H|replicate([H|T], N, N1-1)];
replicate([], _, _) -> [].

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p15_test_() -> [
    ?_assert(replicate([],3) =:= []),
    ?_assert(replicate([1],4) =:= [1,1,1,1]),
    ?_assert(replicate([1,2,3],3) =:= [1,1,1,2,2,2,3,3,3])
].
%%-endif.


