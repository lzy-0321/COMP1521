#include "sign_flip.h"

// given the 32 bits of a float return it with its sign flipped
uint32_t sign_flip(uint32_t f) {
    uint32_t mask = 2147483648;      // 1000 0000 0000 0000 0000 0000 0000 0000
    mask = mask ^ f;
    return mask;
}
