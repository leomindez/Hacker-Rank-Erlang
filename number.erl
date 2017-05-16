-module(number).
-export([number_to_binary/1]).

number_to_binary(Number) ->
	number_to_binary(Number,[]).
	
number_to_binary(0, Acc) ->
	Acc;

number_to_binary(Number, Acc) ->
	number_to_binary(Number div 2, lists:reverse([ Number rem 2 | Acc])).

