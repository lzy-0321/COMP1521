// count bits in a uint64_t

#include <assert.h>
#include <stdint.h>
#include <stdlib.h>

// return how many 1 bits value contains
int bit_count(uint64_t value) {
    // PUT YOUR CODE HERE
    int count = 0;
    uint64_t mask = 1;      // 0000 0000 ... 0000 0001
    for (int i = 0; i < 64; i++) {
        uint64_t check = mask & value;
        if (mask == check) {
            count++;
        }
        mask = mask << 1;
    }
    return count;
}
