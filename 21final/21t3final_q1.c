#include <stdio.h>

// read two integers and print all the integers which have their bottom 2 bits set.

int main(void) {
    int x, y;

    scanf("%d", &x);
    scanf("%d", &y);

    // PUT YOUR CODE HERE
    int s = 3;     // 0000 0011
    for (int i = x + 1; i < y; i++) {
        if ((i & s) == s) {
            printf("%d\n", i);
        }
    }
    return 0;
}
