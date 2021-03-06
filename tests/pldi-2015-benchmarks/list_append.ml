type nat =
  | O
  | S of nat

type list =
  | Nil
  | Cons of nat * list

let list_append : list -> list -> list |>
  { [] => ( [] => []
          | [0] => [0])
  | [0] => ( [] => [0]
           | [0] => [0; 0])
  | [1;0] => ( [] => [1; 0]
             | [0] => [1; 0; 0])
  } = ?
