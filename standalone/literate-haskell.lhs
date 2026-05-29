This is a small literate Haskell fixture.

> module Main where
>
> data Status = Todo | Doing | Done deriving (Eq, Show)
>
> taskLabel :: Status -> String
> taskLabel status =
>   case status of
>     Todo -> "todo"
>     Doing -> "doing"
>     Done -> "done"
>
> main :: IO ()
> main = print (taskLabel Doing)
