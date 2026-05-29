import { buildGreeting, describeTasks, seedTasks } from './lib.js';

const tasks = seedTasks();

console.log(buildGreeting('TypeScript'));
console.log('');
console.log(describeTasks(tasks));
