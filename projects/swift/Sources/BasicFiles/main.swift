import Foundation

enum Status: String, Codable, CaseIterable {
    case todo
    case doing
    case done
}

struct Task: Codable {
    let title: String
    let status: Status
    let due: Date?
}

let formatter = ISO8601DateFormatter()
let tasks = [
    Task(title: "Add Swift fixture", status: .doing, due: formatter.date(from: "2026-05-27T09:00:00Z")),
    Task(title: "Inspect output", status: .todo, due: nil)
]

let counts = Dictionary(grouping: tasks, by: \.status).mapValues(\.count)
print(counts)
