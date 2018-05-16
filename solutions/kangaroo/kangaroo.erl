-module(kangaroo).
-author("Leo").
-export([main/0]).

% Problem
% https://www.hackerrank.com/challenges/kangaroo/problem

main() ->
  Location = location(0,2,5,3),
  Location.

location(X1, V1, X2, V2) ->
  same_location(X1,V1,X2,V2).

same_location(X1,V1,X2,V2) when V1 > V2 andalso ((X2-X1) rem (V1-V2)) =:= 0 ->
  "YES";
same_location(_X1,_V1,_X2,_V2) ->
  "NO".