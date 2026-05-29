Task = Struct.new(:title, :status, keyword_init: true)

puts Task.new(title: "Add Ruby fixture", status: :doing)
