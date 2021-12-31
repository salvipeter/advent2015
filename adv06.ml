#load "str.cma";;

type point = Point of int * int
type rectangle = Rectangle of point * point
type action = TurnOn | TurnOff | Toggle

(* included in String since 4.13.0 *)
let starts_with prefix str =
  let n = String.length prefix
  and m = String.length str in
  m >= n && String.equal prefix (String.sub str 0 n)

let action_type str =
  if starts_with "turn on" str then TurnOn
  else if starts_with "turn off" str then TurnOff
  else if starts_with "toggle" str then Toggle
  else invalid_arg "invalid action"

let parse str =
  let r = Str.regexp {| \([0-9]+\),\([0-9]+\) through \([0-9]+\),\([0-9]+\)|} in
  let g k =
    let s = Str.matched_group k str in
    int_of_string s
  in Str.search_forward r str 0;
     (action_type str, Rectangle (Point (g 1, g 2), Point (g 3, g 4)))

let data () =
  let f = open_in "adv06.txt" in
  let rec loop acc =
    try
      parse (input_line f) :: acc |> loop
    with End_of_file ->
      close_in f;
      List.rev acc
  in loop []

(* First part *)

let switch m (a, Rectangle (Point (x1, y1), Point(x2, y2))) =
  for i = x1 to x2 do
    for j = y1 to y2 do
      match a with
        TurnOn -> m.(i).(j) <- 1
      | TurnOff -> m.(i).(j) <- 0
      | Toggle -> m.(i).(j) <- 1 - m.(i).(j)
    done
  done

let matrix_sum m =
  let f n mi = Array.fold_left ( + ) n mi in
  Array.fold_left f 0 m

let adv06 () =
  let m = Array.make_matrix 1000 1000 0 in
  data () |> List.iter (switch m);
  matrix_sum m

(* Second part *)

let switch' m (a, Rectangle (Point (x1, y1), Point(x2, y2))) =
  for i = x1 to x2 do
    for j = y1 to y2 do
      let v = m.(i).(j) in
      match a with
        TurnOn -> m.(i).(j) <- v + 1
      | TurnOff -> m.(i).(j) <- if v > 0 then v - 1 else 0
      | Toggle -> m.(i).(j) <- v + 2
    done
  done

let adv06b () =
  let m = Array.make_matrix 1000 1000 0 in
  data () |> List.iter (switch' m);
  matrix_sum m
