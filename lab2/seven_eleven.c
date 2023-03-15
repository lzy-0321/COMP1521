// Read a number and print positive multiples of 7 or 11 < n

#include <stdio.h>

int main(void) {
    int number, i;

    printf("Enter number: ");
    scanf("%d", &number);

    i = 1;
    loop:
    if(i >= number) goto end;
        if (i % 7 == 0) goto next;  
        if (i % 11 == 0) goto next; 
        goto out;
        next:
            printf("%d\n", i);
            goto out;
    out:
        i = i + 1;
    goto loop;
end:
    return 0;
}