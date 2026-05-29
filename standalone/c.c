#include <stdio.h>

enum status { TODO, DOING, DONE };

int main(void) {
    enum status current = DOING;
    printf("status=%d\n", current);
    return 0;
}
