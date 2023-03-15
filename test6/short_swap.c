// Swap bytes of a short

#include <stdint.h>
#include <stdlib.h>
#include <assert.h>

// given uint16_t value return the value with its bytes swapped
uint16_t short_swap(uint16_t value) {
    // PUT YOUR CODE HERE
    uint16_t mask = 255; 
    uint16_t n = 0;

    uint16_t v1 = value & mask;
    mask = 65280; 
    n = n | v1 << 8; 
    uint16_t v2 = value & mask;
    n = n | v2 >> 8;
    return n;
}
