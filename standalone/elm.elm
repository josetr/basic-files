module Main exposing (Status(..), statusLabel)

type Status
    = Todo
    | Doing
    | Done

statusLabel : Status -> String
statusLabel status =
    case status of
        Todo -> "todo"
        Doing -> "doing"
        Done -> "done"
