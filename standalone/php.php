<?php

enum Status: string {
    case Todo = 'todo';
    case Doing = 'doing';
    case Done = 'done';
}

echo Status::Doing->value . PHP_EOL;
