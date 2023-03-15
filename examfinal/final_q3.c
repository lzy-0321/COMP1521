#include <stdint.h>

/**
 * Return `1` if `value` *is* "balanced"
 * Return `0` if `value` *is not* "balanced"
 *
 * a number is said to be balanced iff it has the same number of bits set
 * set in its upper 16 bits as it does in its lower 16 bits.
 *
 * 0x10500c04 in binary, is 0b00010000010100000000110000000100
 * 0x10500c04 is balanced because there are 3 bits set in the upper 16 bits
 * and 3 bits set in the lower 16 bits
 * given 0x10500c04 final_q3 should return 1.
 *
 * 0x04300090 in binary, is 0b00000100001100000000000010010000
 * 0x04300090 is not balanced because there are 3 bits set in upper 16 bits
 * and 2 bits set in the second 16 bits.
 * given 0x04300090 final_q3 should return 0.
**/

// A number is said to be balanced iff it has the same number of bits set in its upper 16 bits as it does in its lower 16 bits
int final_q3(uint32_t value) {
    uint32_t upper = value >> 16;
    uint32_t lower = value & 0x0000FFFF;
    int numupper = 0;
    int numlower = 0;
    for (int i = 0; i < 16; i++) {
        if (upper & (1 << i)) {
            numupper++;
        }
    }
    for (int i = 0; i < 16; i++) {
        if (lower & (1 << i)) {
            numlower++;
        }
    }
    if (numupper == numlower) {
        return 1;
    }
    return 0;
}
