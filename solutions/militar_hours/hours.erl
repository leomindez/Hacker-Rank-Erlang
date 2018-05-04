-module(hours).
-export([main/0]).
-author("Leo").


% https://www.hackerrank.com/challenges/time-conversion/problem
 
main() ->
    Time = "11:05:45AM",
    ConvertedTime = militar_hour(Time),
    io:fwrite("~p~n", [ConvertedTime]).

militar_hour(Time) ->
    PmAm = string:right(Time, 2),
    Hour = string:left(Time,2),
    convert_time(PmAm,Hour,Time).

convert_time("AM","12",Time) ->
    FullTime = string:concat("00",string:substr(Time,3,6)),
    FullTime;

convert_time("PM","12", Time) ->
    FullTime = string:concat("12",string:substr(Time,3,6)),
    FullTime;

convert_time("PM", StringHour, Time) -> 
    {Hour,_} = string:to_integer(StringHour),
    ConvertedTime = integer_to_list(Hour + 12),
    FullTime = string:concat(ConvertedTime,string:substr(Time,3,6)),
    FullTime;

convert_time(_,_,Time) ->
    FullTime = string:substr(Time,1,8),
    FullTime.