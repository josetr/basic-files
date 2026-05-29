package dev.basicfiles

import java.time.LocalDate

enum class Status { TODO, DOING, DONE }

data class Task(
    val title: String,
    val status: Status,
    val due: LocalDate? = null,
)

fun summarize(tasks: List<Task>): Map<Status, Int> =
    Status.values().associateWith { status -> tasks.count { it.status == status } }

fun main() {
    val tasks = listOf(
        Task("Add Kotlin fixture", Status.DOING, LocalDate.of(2026, 5, 27)),
        Task("Review colors", Status.TODO),
    )
    println(summarize(tasks))
}
