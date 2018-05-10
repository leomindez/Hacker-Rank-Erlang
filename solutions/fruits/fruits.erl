-module(fruits).
-author("Leo").
-export([main/0]).

main() ->
    S= 7, 
    T= 11,
    A= 5, 
    B= 15,
    M= 3,
    N= 2,
    Counter= 1,
    Apples= [-2,2,1],
    Oranges= [5,-6],
    Fruits = Apples ++ Oranges,
    io:fwrite("Fruits ~w ~n", [Fruits]),
    Map= #{"apples" => 0, "oranges" => 0},
    count_fruits(S,T,A,B,M,N,Counter,Fruits,Map).




count_fruits(S,T,A,B,M,N,Counter,[Fruit|Fruits], MapAcc) when Counter =< M ->
    Position = (A + Fruit),
    NewCounter = Counter + 1,
    if
        Position >= S andalso Position =< T -> 
            FruitCounter = maps:get("apples", MapAcc) + 1,
            NewMap = MapAcc#{"apples" := FruitCounter},
            count_fruits(S,T,A,B,M,N,NewCounter,Fruits,NewMap);
        true -> 
            count_fruits(S,T,A,B,M,N,NewCounter,Fruits,MapAcc)
    end;

count_fruits(S,T,A,B,M,N,Counter,[Fruit|Fruits], MapAcc)  when Counter > M ->
    Position = (B + Fruit),
    NewCounter = Counter + 1,
    if
        Position >= S andalso Position =< T -> 
            FruitCounter = maps:get("oranges", MapAcc) + 1,
            NewMap = MapAcc#{"oranges" := FruitCounter},
            count_fruits(S,T,A,B,M,N,NewCounter,Fruits,NewMap);
        true -> 
            count_fruits(S,T,A,B,M,N,NewCounter,Fruits,MapAcc)
    end;

count_fruits(_S,_T,_A,_B,_M,_N,_Counter,[],MapAcc) ->
    Apples = maps:get("apples",MapAcc),
    Oranges = maps:get("oranges", MapAcc),
    io:fwrite("~w ~n",[Apples]),
    io:fwrite("~w ~n",[Oranges]).


