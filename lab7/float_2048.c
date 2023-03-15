// Multiply a float by 2048 using bit operations only

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <assert.h>

#include "floats.h"



// float_2048 is given the bits of a float f as a uint32_t
// it uses bit operations and + to calculate f * 2048
// and returns the bits of this value as a uint32_t
//
// if the result is too large to be represented as a float +inf or -inf is returned
//
// if f is +0, -0, +inf or -inf, or Nan it is returned unchanged
//
// float_2048 assumes f is not a denormal number
//
uint32_t float_2048(uint32_t f) {
    // PUT YOUR CODE HERE
    float_components_t nf = float_bits(f);
    if (is_nan(nf) == 1 || is_negative_infinity(nf) == 1 || is_positive_infinity(nf) == 1 || is_zero(nf) == 1) {
        return f;
    }
    uint32_t num = (nf.sign << 31);
    if ((nf.exponent + 11) > 0xff) {
        nf.exponent = 0xff << 23;
        num = num | nf.exponent;
    }
    else {
        nf.exponent = (nf.exponent + 11) << 23;
        num = num | nf.exponent;
        num = num | nf.fraction;
    }
    return num;
}

// separate out the 3 components of a float
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
