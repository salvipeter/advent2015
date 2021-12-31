let data () =
  let f = open_in "adv03.txt" in
  let line = input_line f in
  close_in f;
  line

(* First part *)

module Pair =
  struct
    type t = int * int
    let compare = Stdlib.compare
  end
module PSet = Set.Make(Pair)

let move (x,y) = function
    '<' -> (x-1,y)
  | '^' -> (x,y-1)
  | '>' -> (x+1,y)
  | 'v' -> (x,y+1)
  |  _  -> failwith "invalid direction"

let deliver (pos, visited) c =
  let pos' = move pos c in
  (pos', PSet.add pos' visited)

let houses seq =
  let visited = PSet.add (0,0) PSet.empty in
  List.fold_left deliver ((0,0), visited) seq |> snd

let adv03 () = data () |> String.to_seq |> List.of_seq |> houses |> PSet.cardinal

(* Second part *)

let take_even xs = List.filteri (fun n _ -> n mod 2 = 0) xs

let adv03b () =
  let route = data () |> String.to_seq |> List.of_seq in
  let santa = take_even route |> houses
  and robot = List.tl route |> take_even |> houses in
  PSet.union santa robot |> PSet.cardinal
