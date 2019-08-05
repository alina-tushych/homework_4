-module(p09).
-export([pack/1]).

%Запаковать последовательно следующие дубликаты во вложеные списки

pack(L) -> pack(L, []).
pack([],_) -> [];
pack([H,H|T], L) -> pack([H|T], [H|L]);
pack([H|T], L) -> [[H|L]|pack(T, [])].

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p09_test_() -> [
    ?_assert(pack([]) =:= []),
    ?_assert(pack([1]) =:= [[1]]),
    ?_assert(pack([1,2]) =:= [[1],[2]]),
    ?_assert(pack([1,1,1,2]) =:= [[1,1,1],[2]])
].
%%-endif.
