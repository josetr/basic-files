#import <Foundation/Foundation.h>
#include <vector>

int main() {
    @autoreleasepool {
        std::vector<int> counts = {1, 2, 3};
        NSLog(@"Objective-C++ count: %lu", counts.size());
    }
}
