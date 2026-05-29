import 'dart_example.dart';

void main() {
  final repository = TaskRepository.seeded();
  final cli = TaskCli(repository: repository);

  print(cli.renderWelcome());
  print('');
  print(cli.renderTasks());
}
