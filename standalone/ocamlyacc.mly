%token TODO DOING DONE
%start status
%type <string> status
%%
status:
  | TODO { "todo" }
  | DOING { "doing" }
  | DONE { "done" }
