#include "bit_rotate.h"

// return the value bits rotated left n_rotations
uint16_t bit_rotate(int n_rotations, uint16_t bits) {
    int neg = 0;
    uint16_t bit_return;
    if(n_rotations < 0){
        neg = 1;
        n_rotations = n_rotations * -1;
    }
    if(n_rotations >= 16){
        n_rotations = n_rotations % 16;
    }
    // if n_rotations is negative, rotated right
    if(neg == 1){
        bit_return = (bits >> n_rotations) | (bits << (16 - n_rotations));
    }
    else {
        bit_return = (bits << n_rotations) | (bits >> (16 - n_rotations));
    }
    return bit_return;
}
