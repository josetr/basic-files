package main

import "core:fmt"

Status :: enum { Todo, Doing, Done }

main :: proc() {
    fmt.println(Status.Doing)
}
