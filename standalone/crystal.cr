enum Status
  Todo
  Doing
  Done
end

record Task, title : String, status : Status

puts Task.new("Add Crystal fixture", Status::Doing)
