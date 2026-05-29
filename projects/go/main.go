package main

import (
	"encoding/json"
	"fmt"
	"time"
)

type Status string

const (
	Todo  Status = "todo"
	Doing Status = "doing"
	Done  Status = "done"
)

type Task struct {
	Title  string     `json:"title"`
	Status Status     `json:"status"`
	Due    *time.Time `json:"due,omitempty"`
}

func groupByStatus(tasks []Task) map[Status]int {
	counts := map[Status]int{}
	for _, task := range tasks {
		counts[task.Status]++
	}
	return counts
}

func main() {
	due := time.Date(2026, time.May, 27, 10, 0, 0, 0, time.UTC)
	tasks := []Task{{Title: "Add Go fixture", Status: Doing, Due: &due}}
	output, _ := json.MarshalIndent(groupByStatus(tasks), "", "  ")
	fmt.Println(string(output))
}
