-module(triplets).
-author("leo").

%% API
-export([compare/2]).

compare(First,Second) ->
  compare_triplets(First,Second,0,0).

compare_triplets([A|Tail],[B|Tail2],Acc,Acc2) ->
  if
    A > B -> compare_triplets(Tail,Tail2,Acc + 1,Acc2);
    A < B -> compare_triplets(Tail,Tail2,Acc,Acc2 + 1);
    true -> compare_triplets(Tail,Tail2,Acc,Acc2)
  end;

compare_triplets([],[],Acc,Acc2) ->
  {Acc,Acc2}.