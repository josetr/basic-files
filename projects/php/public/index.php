<?php

declare(strict_types=1);

enum Status: string
{
    case Todo = 'todo';
    case Doing = 'doing';
    case Done = 'done';
}

final readonly class Task
{
    public function __construct(
        public string $title,
        public Status $status,
        public ?DateTimeImmutable $due = null,
    ) {
    }
}

function summarize(array $tasks): array
{
    $counts = array_fill_keys(array_column(Status::cases(), 'value'), 0);
    foreach ($tasks as $task) {
        $counts[$task->status->value]++;
    }
    return $counts;
}

$tasks = [
    new Task('Add PHP fixture', Status::Doing, new DateTimeImmutable('2026-05-27')),
    new Task('Check tokens', Status::Todo),
];

header('Content-Type: application/json');
echo json_encode(summarize($tasks), JSON_PRETTY_PRINT);
