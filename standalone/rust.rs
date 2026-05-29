enum Status {
    Todo,
    Doing,
    Done,
}

fn main() {
    println!("{:?}", Status::Doing as u8);
}
