#load "str.cma";;

let data () =
  let f = open_in "adv05.txt" in
  let rec loop acc =
    try
      loop (input_line f :: acc)
    with End_of_file ->
      close_in f;
      List.rev acc
  in loop []

(* First part *)

let rec count_matches r s i =
  try let i' = Str.search_forward r s i in
      1 + count_matches r s (i' + 1)
  with Not_found -> 0

let contains str sub =
  try Str.search_forward (Str.regexp_string sub) str 0;
      true
  with Not_found -> false

let nice str =
  count_matches (Str.regexp "[aeiou]") str 0 >= 3 &&
    Str.string_match (Str.regexp {|.*\(.\)\1.*|}) str 0 &&
    List.for_all (fun s -> not (contains str s)) ["ab"; "cd"; "pq"; "xy"]

let adv05 () = data () |> List.filter nice |> List.length

(* Second part *)

let nice' str =
  Str.string_match (Str.regexp {|.*\(..\).*\1.*|}) str 0 &&
    Str.string_match (Str.regexp {|.*\(.\).\1.*|}) str 0

let adv05b () = data () |> List.filter nice' |> List.length
