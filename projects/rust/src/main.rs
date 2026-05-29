use rust_example::{build_greeting, sample_tasks, summarize_tasks};

fn main() {
    let tasks = sample_tasks();

    println!("{}", build_greeting("Rust"));
    println!();
    println!("{}", summarize_tasks(&tasks));
}
