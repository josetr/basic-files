export type Task = {
  title: string;
  done: boolean;
};

export function buildGreeting(platform: string): string {
  return `Hello from ${platform}.`;
}

export function seedTasks(): Task[] {
  return [
    { title: 'Print a greeting', done: true },
    { title: 'Load sample tasks', done: true },
    { title: 'Review generated output', done: false },
  ];
}

export function describeTasks(tasks: Task[]): string {
  const lines = ["Today's tasks:"];

  for (const task of tasks) {
    const marker = task.done ? '[x]' : '[ ]';
    lines.push(`${marker} ${task.title}`);
  }

  return lines.join('\n');
}
