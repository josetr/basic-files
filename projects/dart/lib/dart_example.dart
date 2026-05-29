class Task {
  final String title;
  final bool isDone;

  const Task({required this.title, required this.isDone});
}

class TaskRepository {
  final List<Task> tasks;

  const TaskRepository({required this.tasks});

  factory TaskRepository.seeded() {
    return const TaskRepository(
      tasks: <Task>[
        Task(title: 'Print a greeting', isDone: true),
        Task(title: 'Load sample tasks', isDone: true),
        Task(title: 'Review generated output', isDone: false),
      ],
    );
  }

  int completedCount() {
    return tasks.where((task) => task.isDone).length;
  }
}

class TaskCli {
  final TaskRepository repository;

  const TaskCli({required this.repository});

  String renderWelcome() {
    final completedCount = repository.completedCount();
    return 'Hello from Dart. $completedCount tasks are already done.';
  }

  String renderTasks() {
    final buffer = StringBuffer("Today's tasks:");
    for (final task in repository.tasks) {
      final marker = task.isDone ? '[x]' : '[ ]';
      buffer.writeln();
      buffer.write('$marker ${task.title}');
    }
    return buffer.toString();
  }
}
