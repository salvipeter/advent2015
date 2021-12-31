let key = "iwrupvqb"

(* First part *)

let test n k =
  let code = key ^ Int.to_string n
  and zeros = String.make k '0' in
  let md5 = Digest.string code |> Digest.to_hex in
  String.sub md5 0 k |> String.equal zeros

let adv04 () =
  let rec f n = if test n 5 then n else f (n + 1) in
  f 1

(* Second part *)

(* about 6s with ocamlopt *)
let adv04b () =
  let rec f n = if test n 6 then n else f (n + 1) in
  f 1
