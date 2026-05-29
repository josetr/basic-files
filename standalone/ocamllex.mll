{
  exception Eof
}

rule token = parse
  | [' ' '\t' '\n'] { token lexbuf }
  | eof { raise Eof }
