// swap pairs of bits of a 64-bit value, using bitwise operators

#include <assert.h>
#include <stdint.h>
#include <stdlib.h>

// return value with pairs of bits swapped
uint64_t bit_swap(uint64_t value) {
    // PUT YOUR CODE HERE
    uint64_t mask1 = 1;     // 0000 0000 ... 0000 0001
    uint64_t mask2 = 2;     // 0000 0000 ... 0000 0010
    uint64_t mask = 0;      // 0000 0000 ... 0000 0000

    for (int n = 0; n < 32; n++) {
        mask = mask | ((value & mask1) << 1);
        mask = mask | ((value & mask2) >> 1);
        mask1 = mask1 << 2;
        mask2 = mask2 << 2;
    }
    return mask;
}
