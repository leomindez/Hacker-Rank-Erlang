-module(rotate).
-export([left_rotation/2]).

left_rotation(Times,Array) ->
    left_rotation(Times,Array,[]).

left_rotation(Times,[H|T],RotatedArray) when Times > 0 ->
    left_rotation(Times-1,T,[H|RotatedArray]);

left_rotation(0,Array,RotatedArray) ->
    lists:append(Array,lists:reverse(RotatedArray)).
