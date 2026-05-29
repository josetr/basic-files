tasks = [
  title: "Add CoffeeScript fixture"
  status: "doing"
]

openTasks = tasks.filter (task) -> task.status isnt "done"
console.log openTasks
