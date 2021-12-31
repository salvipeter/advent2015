:- op(400, xfx, to).

weight([_], 0).
weight([X,Y|Xs], N) :-
    ( X to Y - N0 ; Y to X - N0 ),
    weight([Y|Xs], N1),
    N is N0 + N1.

adv09(X) :-
    setof(A, B^N^(A to B - N ;  B to A - N), L),
    aggregate_all(min(W), (permutation(L, L1), weight(L1, W)), X).

adv09b(X) :-
    setof(A, B^N^(A to B - N ;  B to A - N), L),
    aggregate_all(max(W), (permutation(L, L1), weight(L1, W)), X).

tristram to alphacentauri - 34.
tristram to snowdin - 100.
tristram to tambi - 63.
tristram to faerun - 108.
tristram to norrath - 111.
tristram to straylight - 89.
tristram to arbre - 132.
alphacentauri to snowdin - 4.
alphacentauri to tambi - 79.
alphacentauri to faerun - 44.
alphacentauri to norrath - 147.
alphacentauri to straylight - 133.
alphacentauri to arbre - 74.
snowdin to tambi - 105.
snowdin to faerun - 95.
snowdin to norrath - 48.
snowdin to straylight - 88.
snowdin to arbre - 7.
tambi to faerun - 68.
tambi to norrath - 134.
tambi to straylight - 107.
tambi to arbre - 40.
faerun to norrath - 11.
faerun to straylight - 66.
faerun to arbre - 144.
norrath to straylight - 115.
norrath to arbre - 135.
straylight to arbre - 127.
