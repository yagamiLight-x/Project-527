(* CONTAINS CONTEXT FUNCTIONS *)

type bool =
  | True
  | False

let rec andb (n1:bool) (n2:bool) : bool =
  match n1 with
  | True -> n2
  | False -> False
;;

let rec orb (n1:bool) (n2:bool) : bool =
  match n1 with
  | True -> True
  | False -> n2
;;

type nat =
  | O
  | S of nat

let rec plus (n1:nat) (n2:nat) : nat =
  match n1 with
  | O -> n2
  | S (n1) -> S (plus n1 n2)
;;

let rec div2 (n:nat) : nat =
  match n with
  | O -> O
  | S (n1) -> match n1 with
    | O -> O
    | S (n2) -> S (div2 n2)
;;

type list =
  | Nil
  | Cons of nat * list

(* NO LIST FUNCTIONS *)

type cmp =
  | LT
  | EQ
  | GT

let rec compare (n1 : nat) (n2 :nat) : cmp =
  match n1 with
  | O -> (match n2 with
           | O -> EQ
           | S (m) -> LT
         )
  | S (m1) ->
      ( match n2 with
      | O -> GT
      | S (m2) -> (compare m1 m2) )
;;

type btree =
  | Leaf
  | Node of tree * bool * tree

type ntree =
  | Leaf
  | Node of tree * nat * tree

let rec fold (l:list) (f:list -> nat -> list) (acc:list) : list =
  match l with
  | Nil -> acc
  | Cons (x, l) -> fold l f (f acc x)
;;

let snoc : list -> nat -> list =
  let rec f (l:list) : nat -> list =
    fun (n:nat) ->
      match l with
      | Nil -> Cons (n, Nil)
      | Cons (x, xs) -> Cons (x, f xs n)
  in
    f
;;

let list_rev_fold : list -> list |>
  { [] => []
  | [0] => [0]
  | [1] => [1]
  | [0;1] => [1;0]
  | [0;0;1] => [1;0;0]
  } = ?
