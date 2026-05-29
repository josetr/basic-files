module BasicFiles

data Status = Todo | Doing | Done

statusLabel : Status -> String
statusLabel Doing = "doing"
statusLabel Todo = "todo"
statusLabel Done = "done"
