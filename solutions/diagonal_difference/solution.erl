-module(solution).
-author("Leonel").
-export([main/0]).


main() ->
  {ok, [Size]} = io:fread("", "~d"),
  Matrix = read_2d_linear_array(Size, "~d"),
  Result = diagonal:difference(Matrix),
  io:fwrite("~p~n", [Result]),
  true.

read_2d_linear_array(Size, Format) ->
  read_2d_array(Size, Size, Format, []).

read_array(0, _Format, Acc) ->
  lists:reverse(Acc);

read_array(Size, Format, Acc) -> 
  {ok, [Value]} = io:fread("",Format),
  read_array(Size - 1, Format, [Value | Acc]).

read_2d_array(0,_FirstSize,_Format, Acc) -> 
  lists:reverse(Acc);

read_2d_array(Size, FirstSize, Format, Acc) ->
  Array = read_array(FirstSize, Format,[]),
  read_2d_array(Size - 1,  FirstSize, Format, [Array | Acc]).

