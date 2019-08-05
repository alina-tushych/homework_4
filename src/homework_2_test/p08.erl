-module(p08).
-export([compress/1]).

%Удалить последовательно следующие дубликаты

compress([H|[]]) -> [H];
compress([H,H|T]) -> compress([H|T]);
compress([H|T]) -> [H|compress(T)].

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p08_test_() -> [
    ?_assert(compress([]) =:= []),
    ?_assert(compress([1]) =:= [1]),
    ?_assert(compress([1,1,2]) =:= [1,2]),
    ?_assert(compress([1,1,2,2,2,2,2,3]) =:= [1,2,3])
].
%%-endif.
