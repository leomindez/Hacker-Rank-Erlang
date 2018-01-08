-module(sum).
-author("Leo Mendez").
-export([main/0, min_max/1]).

main() ->
    Arr = read_array(5,"~d",[]),
    {Min, Max} = min_max(Arr),
    io:fwrite("~p ~p~n", [Min, Max]).

read_array(0, _Format, Acc) ->
  lists:reverse(Acc);

read_array(Size, Format, Acc) -> 
  {ok, [Value]} = io:fread("",Format),
  read_array(Size - 1, Format, [Value | Acc]).

elements(Array) ->
    array_sum(Array, 0).

array_sum([], Acc) -> Acc;

array_sum([Element|Rest], Acc) ->
    array_sum(Rest, Acc + Element).

min_max(Array) ->
    Sum = elements(Array),
    MinMax = get_min_max(Array, Sum, []),
    {lists:min(MinMax), lists:max(MinMax)}.

get_min_max([], _Total, Acc) -> Acc;

get_min_max([Element|Rest], Total, Acc) ->
    get_min_max(Rest, Total, [Total - Element | Acc]).