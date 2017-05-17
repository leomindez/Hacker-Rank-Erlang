-module(consecutives).
-export([main/0]).

main() ->

    { ok, [N]} = io:fread("", "~d"),
    Binary = number_to_binary(N),
    Consecutives = find_consecutives(Binary),
    io:fwrite("~w~n",[Binary]),
    io:fwrite("~w~n",[Consecutives]),
    true.



find_consecutives(Array) ->
    find_consecutives(Array,0,0).

find_consecutives([],Res,Acc) -> erlang:max(Res,Acc);

find_consecutives([A|T],Res,Acc) -> 
case A of
    1 -> find_consecutives(T,Res+1,Acc);
    0 -> find_consecutives(T,0,Res)
end.
%% Res + 1, Res
number_to_binary(1) ->
	[1];

number_to_binary(Number) ->
	number_to_binary(Number,[]).
	
number_to_binary(0, Acc) ->
	Acc;

number_to_binary(Number, Acc) ->
	number_to_binary(Number div 2, [ Number rem 2 | Acc]).