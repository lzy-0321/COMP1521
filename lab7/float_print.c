// Print out a float.

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <assert.h>

#include "floats.h"

//
// float_print is given the bits of a float as a uint32_t
// it prints out the float in the same format as "%.9g\n"
// using only putchar & puts
//
void float_print(uint32_t bits) {
    // PUT YOUR CODE HERE
    float_components_t b = float_bits(bits);
    putchar;
}

float_components_t float_bits(uint32_t f) {
    // PUT YOUR CODE HERE
    float_components_t n;
    uint32_t mask = 2147483648;  // 1000 0000 0000 0000 0000 0000 0000 0000
    n.sign = (mask & f) >> 31;
    mask = 2139095040;           // 0111 1111 1000 0000 0000 0000 0000 0000
    n.exponent = (mask & f) >> 23;
    mask = 8388607;              // 0000 0000 0111 1111 1111 1111 1111 1111 
    n.fraction = (mask & f);
    return n;
}
