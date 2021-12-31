let data () =
  let f = open_in "adv01.txt" in
  let line = input_line f in
  close_in f;
  line

(* First part *)

let count_floor s =
  let f n c =
    match c with
      '(' -> n + 1
    | ')' -> n - 1
    |  _  -> failwith "invalid character"
  in Seq.fold_left f 0 s

let adv01 () = data () |> String.to_seq |> count_floor

(* Second part *)

let basement_pos s =
  let f (k, n) c =
    if n < 0 then (k, n)
    else match c with
           '(' -> (k + 1, n + 1)
         | ')' -> (k + 1, n - 1)
         |  _  -> failwith "invalid character"
  in Seq.fold_left f (0, 0) s |> fst

let adv01b () = data () |> String.to_seq |> basement_pos
