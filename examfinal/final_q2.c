// given one integer value return the right justified version of the value.
// right-justification is (in this case)
// the process of removing all zeros from the right side of the value
// eg:
// given  (in $a0) 0b00000000000000000000000001101000
// return (in $v0) 0b00000000000000000000000000001101

#include <stdio.h>
#include <stdint.h>

int main(void) {
    int a0;
    scanf("%d", &a0);
    // find all 0 bits in the right side of the value
    int i = 0;
    int j = 0;
    while (i < 32) {
        if ((a0 & (1 << i)) == 0) {
            j = j + 1;
        }
        else {
            break;
        }
        i = i + 1;
    }
    // shift the value to the right by the number of 0 bits
    int v0 = a0 >> j;
    printf("%d\n", v0);
    return 0;
}