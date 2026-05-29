#include <iostream>
#include <string>

enum class Status { Todo, Doing, Done };

int main() {
    Status status = Status::Doing;
    std::cout << "status=" << static_cast<int>(status) << '\n';
}
