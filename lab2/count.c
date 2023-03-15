// read a number n and print the integers 1..n one per line

#include <stdio.h>

int main(void) {
    int number, i;

    printf("Enter number: ");
    scanf("%d", &number);

    i = 1;
    loop:
    if (i > number) goto end;
        
        printf("%d", i);
        printf("\n");
        i++;
    goto loop;
end:

    return 0;
}