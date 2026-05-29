program BasicFiles;

type
  TStatus = (Todo, Doing, Done);

begin
  WriteLn('status=', Ord(Doing));
end.
