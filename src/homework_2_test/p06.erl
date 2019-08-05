-module(p06).
-export([is_palindrome/1]).

%Определить, является ли список палиндромом

is_palindrome(L) -> is_palindrome(L, L, []).
is_palindrome([H1|T1], [], [H1|T2]) -> is_palindrome(T1, [], T2);
is_palindrome(L, [H|T], L2) -> is_palindrome(L, T, [H|L2]);
is_palindrome([], [], []) -> true;
is_palindrome(_, [], _) -> false.

%%-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p06_test_() -> [
    ?_assert(is_palindrome([]) =:= true),
    ?_assert(is_palindrome([1]) =:= true),
    ?_assert(is_palindrome([1,2,3,2,1]) =:= true),
    ?_assert(is_palindrome([1,2,3,4]) =:= false)
].
%%-endif.
