-module(p05).
-export([reverse/1]).

%Перевернуть список

reverse(L) -> reverse(L, []).
reverse([], N) -> N;
reverse([H|T], N) -> reverse(T, [H|N]).

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p05_test_() -> [
    ?_assert(reverse([]) =:= []),
    ?_assert(reverse([5]) =:= [5]),
    ?_assert(reverse([1,2,3,4]) =:= [4,3,2,1])
].
%%-endif.




