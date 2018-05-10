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





%% unir el arreglo de manzanas con el de naranjas 
%% tener un contador para detener la iteracion este puede ser A + B = Manzanas + Naranjas = Contador
%% guardar en un mapa el numero de manzanas y naranjas que se encuentran en la casa 
%% aumentar el contador en el mapa de manzanas/naranjas 
%% calcular las manzanas que cayeron dentro de la casa con la siguiente operacion 
%% Primero calculariamos las manzanas 
%% A - N = RA verificar si esta entre el rango S y T  RA >= S andalso RA <= T si cumple
%% Entonces se aumentaria el contador apples => C + 1 
%% Mientras el contador sea menor o igual a M se seguiran contando manzanas, si no es asi 
%% Se empezara a contar naranjas y cambiara la validacion 

