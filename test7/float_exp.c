#include "float_exp.h"

// given the 32 bits of a float return the exponent
uint32_t float_exp(uint32_t f) {
    f = f << 1;         //Remove the sign
    f = f >> 24;
    uint32_t mask = 255;        // 0000 0000 ... 1111 1111
    mask = f & mask;
    return mask;
}
