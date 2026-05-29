package dev.basicfiles;

import java.time.LocalDate;
import java.util.EnumMap;
import java.util.List;
import java.util.Map;

public final class App {
    enum Status {
        TODO, DOING, DONE
    }

    static final class Task {
        private final String title;
        private final Status status;
        private final LocalDate due;

        Task(String title, Status status, LocalDate due) {
            this.title = title;
            this.status = status;
            this.due = due;
        }

        Status status() {
            return status;
        }

        @Override
        public String toString() {
            return title + " (" + status + ", due=" + due + ")";
        }
    }

    public static void main(String[] args) {
        List<Task> tasks = List.of(
            new Task("Add Java fixture", Status.DOING, LocalDate.of(2026, 5, 27)),
            new Task("Check highlighting", Status.TODO, null)
        );

        Map<Status, Long> counts = new EnumMap<>(Status.class);
        for (Status status : Status.values()) {
            counts.put(status, tasks.stream().filter(task -> task.status() == status).count());
        }

        System.out.println(counts);
    }
}
