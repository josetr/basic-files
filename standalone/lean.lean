inductive Status where
  | todo
  | doing
  | done
deriving Repr

#eval Status.doing
