let parse str =
  String.split_on_char 'x' str |> List.map int_of_string

let data () =
  let f = open_in "adv02.txt" in
  let rec loop () =
    try
      let next = input_line f in
      parse next :: loop ()
    with End_of_file ->
      close_in f;
      []
  in loop ()

(* First part *)

let paper = function
    [l; w; h] -> let a = l * w
                 and b = w * h
                 and c = h * l in
                 2 * a + 2 * b + 2 * c + min a (min b c)
  |     _     -> failwith "invalid box"

let adv02 () = data () |> List.map paper |> List.fold_left ( + ) 0

(* Second part *)

let volume box = List.fold_left ( * ) 1 box

let ribbon box =
  let s = List.sort compare box in
  2 * (List.hd s + List.hd (List.tl s)) + volume box

let adv02b () = data () |> List.map ribbon |> List.fold_left ( + ) 0
