val data = [3,1,1,3,3,2,2,1,1,3]

fun lookSay   []     NONE        = []
  | lookSay   []    (SOME (n,k)) = [k, n]
  | lookSay (x::xs)  NONE        = lookSay xs (SOME (x,1))
  | lookSay (x::xs) (SOME (n,k)) =
    if x = n then lookSay xs (SOME (n,k+1))
    else k :: n :: lookSay xs (SOME (x,1))

fun repeat 0 xs = xs
  | repeat n xs = repeat (n-1) (lookSay xs NONE)

val adv10 = (length o repeat 40) data
val adv10b = (length o repeat 50) data
