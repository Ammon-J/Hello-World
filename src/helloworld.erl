%%%-------------------------------------------------------------------
%%% @author ammon
%%% @doc
%%%
%%% @end
%%% Created : 06. Nov 2025 10:35 PM
%%%-------------------------------------------------------------------
-module(helloworld).
-author("ammon").
-export([ print/2, print_n_times/2, hello_world/0, change_me/2, fac/1, double/1, tuples/0]).

hello_world() ->
  io:fwrite("Hello, World!~n"),
  print_n_times(10, 15), % Print numbers from 10 to 15
  X = fac(10), % Calculate factorial of 10
  io:fwrite("Factorial of 10 is: ~w~n", [X]),
  change_me(10, 20), % Demonstrate variable swapping
  Numbers = [4, 6, 5, 13, 22, 7, 8, 19], % Original list
  print(0, Numbers), % Print original list
  io:fwrite("Original list: ~n~n"),
  Numbers2 = lists:map(fun(N)-> N * 3 end, Numbers), % Times each element by 3
  print(0, Numbers2), % Print modified list
  io:fwrite("List after multiplying each element by 3: ~n~n"),
  EvenNumbers = lists:filter(fun(N) -> N rem 2 =:= 0 end, Numbers2), % Filter even numbers
  print(0, EvenNumbers), % Print even numbers
  io:fwrite("Even numbers from the modified list: ~n~n"),
  io:fwrite("Double of 7 is: ~w~n", [double(7)]),
  io:fwrite("~nTuple demonstration:~n"),
  tuples(). % Demonstrate tuple usage


print_n_times(N, Max) when N =< Max->
    io:fwrite("~w~n",[N]),
    case N =/= Max of
        true -> print_n_times(N + 1, Max);
        false -> io:fwrite("Done printing numbers using recursion.~n~n")
    end;
    print_n_times(_, _) ->
    ok.

fac(N) when N == 0 -> 1; 
fac(N) when N > 0 -> N*fac(N-1). 

change_me(A, B) ->
  io:fwrite("Before variable swap: A=~w, B=~w~n", [A, B]),
    B2 = B,
    A2 = A,
  io:fwrite("After variable swap: A2=~w, B2=~w~n~n", [A2, B2]).

double(X) ->
  X * 2.

% Print each element of the list with its index
print(Index, List) when Index < length(List) ->
    io:fwrite("Element at index ~w: ~w~n", [Index, lists:nth(Index + 1, List)]),
    print(Index + 1, List);
print(_, _) ->
    ok.

tuples() ->
    T = {ok, 42, hello, world},
    io:fwrite("Tuple elements: ~w, ~w, ~w, ~w~n", [element(1, T), element(2, T), element(3, T), element(4, T)]).