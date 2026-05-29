pub struct Task {
    pub title: String,
    pub is_done: bool,
}

impl Task {
    pub fn new(title: &str, is_done: bool) -> Self {
        Self {
            title: title.to_string(),
            is_done,
        }
    }
}

pub fn build_greeting(platform: &str) -> String {
    format!("Hello from {platform}.")
}

pub fn sample_tasks() -> Vec<Task> {
    vec![
        Task::new("Print a greeting", true),
        Task::new("Load sample tasks", true),
        Task::new("Review generated output", false),
    ]
}

pub fn summarize_tasks(tasks: &[Task]) -> String {
    let mut lines = vec![String::from("Today's tasks:")];

    for task in tasks {
        let marker = if task.is_done { "[x]" } else { "[ ]" };
        lines.push(format!("{marker} {}", task.title));
    }

    lines.join("\n")
}
