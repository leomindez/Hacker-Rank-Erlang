-module(number).
-export([number_to_binary/1]).

number_to_binary(1) ->
	[1];

number_to_binary(Number) ->
	number_to_binary(Number,[]).
	
number_to_binary(0, Acc) ->
	lists:reverse(Acc);

number_to_binary(Number, Acc) ->
	number_to_binary(Number div 2, [ Number rem 2 | Acc]).

