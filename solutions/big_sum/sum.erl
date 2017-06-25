-module(sum).
-author("leo").

%% API
-export([big_numbers/1]).

big_numbers(Numbers) ->
  sum_big(Numbers,0).

sum_big([A|T],Acc) ->
  sum_big(T,Acc+A);

sum_big([],Acc) ->
  Acc.