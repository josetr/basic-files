import std.stdio;

enum Status { todo, doing, done }

void main() {
    auto status = Status.doing;
    writeln("status=", status);
}
