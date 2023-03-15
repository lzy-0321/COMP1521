#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <assert.h>

int bcd(int bcd_value);

int main(int argc, char *argv[]) {

    for (int arg = 1; arg < argc; arg++) {
        long l = strtol(argv[arg], NULL, 0);
        assert(l >= 0 && l <= 0x0909);
        int bcd_value = l;
        printf("%d\n", bcd(bcd_value));
    }

    return 0;
}

// given a  BCD encoded value between 0 .. 99
// return corresponding integer
int bcd(int bcd_value) {

    // PUT YOUR CODE HERE
    uint8_t mask1 = 255;  // 1111 1111
    uint8_t mask2 = 255;  // 1111 1111
    int num = 0;
    num =  ((((mask2 << 4) & bcd_value)) >> 8) * 10 + ((mask1 >> 4) & bcd_value);

    return num;
}

