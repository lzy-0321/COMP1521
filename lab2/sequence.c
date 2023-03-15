// Read three numbers `start`, `stop`, `step`
// Print the integers bwtween `start` and `stop` moving in increments of size `step`

#include <stdio.h>

int main(void) {
    int start, stop, step;

    printf("Enter the starting number: ");
    scanf("%d", &start);

    printf("Enter the stopping number: ");
    scanf("%d", &stop);

    printf("Enter the step size: ");
    scanf("%d", &step);
    
    int i = start;
    
    if (stop >= start) goto nextcheck;
        if (step < 0) goto loop1;

nextcheck:
    if (stop <= start) goto end;
        if (step > 0) goto loop2;
    
loop1:
    if (i < stop) goto end;
    printf("%d\n", i);
    i += step;
    goto loop1;

loop2:
    if (i > stop) goto end;
    printf("%d\n", i);
    i += step;
    goto loop2;

end:
    return 0;
}