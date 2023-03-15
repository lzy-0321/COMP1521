// Read a number n and print the first n tetrahedral numbers
// https://en.wikipedia.org/wiki/Tetrahedral_number

#include <stdio.h>

int main(void) {
    int i, j, n, total, how_many;

    printf("Enter how many: ");
    scanf("%d", &how_many);

    n = 1;
loop1:
    if (n > how_many) goto end;
        total = 0;
        j = 1;
    loop2:
        if (j > n) goto next1;
            i = 1;
        
        loop3:
            if (i > j) goto next2;
                total = total + i;
                i = i + 1;
            goto loop3;
        
        next2:
            j = j + 1;
        goto loop2;

    next1:
        printf("%d\n", total);
        n = n + 1;
    goto loop1;

end:
    return 0;
}
