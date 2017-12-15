-module(minus).
-author("Leonel").
-export([fractions/1]).

fractions(Array) ->
  plus_minus(Array, length(Array), 0, 0, 0).

plus_minus([], Size,Positive, Negative, Zero) -> {decimal_trunc(Positive/Size,6), decimal_trunc(Negative/Size, 6), decimal_trunc(Zero/Size, 6)};

plus_minus([Element | Rest], Size, Positive, Negative, Zero) ->
  if 
    Element > 0 -> plus_minus(Rest, Size, Positive + 1, Negative, Zero);
    Element < 0 -> plus_minus(Rest, Size, Positive, Negative + 1, Zero);
    Element == 0 -> plus_minus(Rest, Size, Positive, Negative, Zero + 1)
  end.

decimal_trunc(Decimal, Limit) ->
  erlang:float_to_list(Decimal, [{decimals, Limit}]).
