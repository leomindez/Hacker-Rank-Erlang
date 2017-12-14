-module(diagonal).
-author("Leonel").
-export([difference/1]).

difference(Matrix) ->
 diagonal_difference(Matrix, length(Matrix),1, 0 ,0).

diagonal_difference([], _PrimaryCounter, _SecondaryCounter ,PrimaryDiagonal, SecondaryCounter) -> 
  abs(PrimaryDiagonal - SecondaryCounter);

diagonal_difference([First | Rest], PrimaryCounter, SecondaryCounter,PrimaryDiagonal, SecondaryCounter) ->
  diagonal_difference(Rest, PrimaryCounter - 1, SecondaryCounter + 1, PrimaryDiagonal + lists:nth(PrimaryCounter, First), SecondaryCounter + lists:nth(SecondaryCounter, First)).



