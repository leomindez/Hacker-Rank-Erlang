-module(grading).
-author("Leo").
-export([main/0]).

%% Problem
%% https://www.hackerrank.com/challenges/grading/problem

main() ->
  Grades = [73,67,38,33],
  NewGrades = lists:map(fun(X) ->  calculate_grade(X) end, Grades),
  NewGrades.

calculate_grade(Grade) ->
  Div = Grade div 10,
  Rem = Grade rem 10,
  ComparedGrade = calculate_compare_grade(Div,Rem),
  NewGrade = calculate_next_grade(ComparedGrade, Grade),
  NewGrade.

calculate_next_grade(_ComparedGrade, Grade) when Grade < 38 ->
  Grade;

calculate_next_grade(ComparedGrade, Grade) when (ComparedGrade - Grade) < 3 ->
  ComparedGrade;

calculate_next_grade(ComparedGrade, Grade) when (ComparedGrade - Grade) =:= 3 ->
  Grade;

calculate_next_grade(_ComparedGrade, Grade) ->
  Grade.

calculate_compare_grade(Div, Rem) when Rem =< 5 ->
  NewDiv = Div * 10,
  NewGrade = NewDiv + 5,
  NewGrade;


calculate_compare_grade(Div, Rem) when Rem >= 6 ->
  NewDiv = Div * 10,
  NewGrade = NewDiv + 10,
  NewGrade.