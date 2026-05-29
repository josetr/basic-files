from enum import StrEnum


class Status(StrEnum):
    TODO = "todo"
    DOING = "doing"
    DONE = "done"


print(Status.DOING)
