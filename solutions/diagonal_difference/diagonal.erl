-module(diagonal).
-author("Leonel").
-export([difference/1]).

difference(Array) ->
 diagonal_difference(Array, length(Array),1, 0 ,0).

diagonal_difference([], _PrimaryCounter, _SecundaryCounter ,PrimaryDiagonal, SecundaryDiagonal) -> 
  abs(PrimaryDiagonal - SecundaryDiagonal);

diagonal_difference([First | Rest], PrimaryCounter, SecundaryCounter,PrimaryDiagonal, SecundaryDiagonal) ->
  diagonal_difference(Rest, PrimaryCounter - 1, SecundaryCounter + 1, PrimaryDiagonal + lists:nth(PrimaryCounter, First), SecundaryDiagonal + lists:nth(SecundaryCounter, First)).



