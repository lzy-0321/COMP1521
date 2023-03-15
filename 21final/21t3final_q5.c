#include <stdlib.h>
#include <stdint.h>

// given 2 uint32_t values
// return the number of bits which are set (1) in both values

int final_q5(uint32_t value1, uint32_t value2) {
    int total = 0;
    uint32_t c = 1;
    for (int i = 0; i < 32; i++) {
        uint32_t v1 = value1 >> i;
        uint32_t v2 = value2 >> i;
        if ((v1 & c) == (v2 & c) && (v1 & c) == c) {
            total++;
        }
    }
    return total;
}
