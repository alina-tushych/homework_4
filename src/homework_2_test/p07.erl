-module(p07).
-export([flatten/1]).

%Выровнять структуру с вложеными списками

flatten(L) -> flatten(L, []).
flatten([], L) -> L;
flatten([H|T], L) -> flatten(H, flatten(T, L));
flatten(H, L) -> [H|L].

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p07_test_() -> [
    ?_assert(flatten([]) =:= []),
    ?_assert(flatten([[],[]]) =:= []),
    ?_assert(flatten([1,[2,[],1]]) =:= [1,2,1]),
    ?_assert(flatten([2,[2,3,[3,4,[]]],5]) =:= [2,2,3,3,4,5])
].
%%-endif.
