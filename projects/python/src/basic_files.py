from __future__ import annotations

from dataclasses import dataclass
from datetime import date
from enum import StrEnum


class Status(StrEnum):
    TODO = "todo"
    DOING = "doing"
    DONE = "done"


@dataclass(frozen=True)
class Task:
    title: str
    status: Status
    due: date | None = None

    @property
    def is_open(self) -> bool:
        return self.status is not Status.DONE


def summarize(tasks: list[Task]) -> dict[Status, int]:
    counts = {status: 0 for status in Status}
    for task in tasks:
        counts[task.status] += 1
    return counts


if __name__ == "__main__":
    backlog = [
        Task("Collect sample files", Status.DOING, date(2026, 5, 27)),
        Task("Review syntax output", Status.TODO),
    ]
    print(summarize(backlog))
