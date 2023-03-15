// Compare 2 floats using bit operations only

#include <stdint.h>
#include <stdlib.h>
#include <assert.h>

#include "floats.h"

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

// float_less is given the bits of 2 floats bits1, bits2 as a uint32_t
// and returns 1 if bits1 < bits2, 0 otherwise
// 0 is return if bits1 or bits2 is Nan
// only bit operations and integer comparisons are used
uint32_t float_less(uint32_t bits1, uint32_t bits2) {
    // PUT YOUR CODE HERE
    float_components_t b1 = float_bits(bits1);
    float_components_t b2 = float_bits(bits2);
    if (is_nan(b1) || is_nan(b2)) {
        return 0;
    }
    if (b1.sign == b2.sign) {
        if (b1.sign == 0) {
            if (b1.exponent == b2.exponent) { 
                if (b1.fraction < b2.fraction) {
                    return 1;
                }
            } else {
                if (b1.exponent < b2.exponent) {
                    return 1;
                }
            }
        } else {
            if (b1.exponent == b2.exponent) { 
                if (b1.fraction > b2.fraction) {
                    return 1;
                }
            } else {
                if (b1.exponent > b2.exponent) {
                    return 1;
                }
            }
        }
    } else {
        if (b1.sign > b2.sign) {
            return 1;
        }
    }
    
    return 0;
}


// given the 3 components of a float
// return 1 if it is NaN, 0 otherwise
int is_nan(float_components_t f) {
    // PUT YOUR CODE HERE
    // if is NaN, exponent is 1111 1111 and fraction is not 0
    // first check exponent
    if (f.exponent == 255 && f.fraction != 0) {
        return 1;
    }
    return 0;
}

// given the 3 components of a float
// return 1 if it is inf, 0 otherwise
int is_positive_infinity(float_components_t f) {
    // PUT YOUR CODE HERE
    if (f.exponent == 255 && f.fraction == 0 && f.sign == 0) {
        return 1;
    }
    return 0;
}

// given the 3 components of a float
// return 1 if it is -inf, 0 otherwise
int is_negative_infinity(float_components_t f) {
    // PUT YOUR CODE HERE
    if (f.exponent == 255 && f.fraction == 0 && f.sign == 1) {
        return 1;
    }
    return 0;
}

// given the 3 components of a float
// return 1 if it is 0 or -0, 0 otherwise
int is_zero(float_components_t f) {
    // PUT YOUR CODE HERE
    if (f.exponent == 0 && f.fraction == 0) {
        return 1;
    }
    return 0;
}
