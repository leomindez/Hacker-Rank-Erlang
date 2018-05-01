-module(cake).
-export([main/0]).
-author("Leo").

%We have one candle of height , one candle of height , and two candles of height . 
%Your niece only blows out the tallest candles, meaning the candles where . 
%Because there are  such candles, we print  on a new line.

main() ->
  Array = [3,1,2,3,3,4,52,3,4,5,7,8,9,0,7,65,45,6,7,8,9,0,8,75,443,3,2,1,2,3,4,5,67,4],
  FirstElement = takeFirst(Array),
  NewArray = takeRest(Array),
  Map = #{FirstElement => 1},
  blow_out(NewArray, Map).

blow_out(Array,Map) ->
  handle_blow_out(Array,Map).

handle_blow_out([], Map) ->
  List = maps:to_list(Map),
  SortedList = lists:sort(fun({_,FirstValue}, {_, SecondValue}) ->  FirstValue > SecondValue end,List),
  First = takeFirst(SortedList),
  First;

handle_blow_out([F|R],Map)->
  case maps:is_key(F, Map) of
    true -> 
      Counter = maps:get(F,Map) + 1,
      NewMap = Map#{F := Counter},
      handle_blow_out(R, NewMap);
    false ->
      NewMap = Map#{F => 1},
      handle_blow_out(R, NewMap)
  end.

takeFirst([F|_]) ->
  F.

takeRest([_|R]) ->
  R.