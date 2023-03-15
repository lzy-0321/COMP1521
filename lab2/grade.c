#include <stdio.h>

int main(void) {
    int mark;

    printf("Enter a mark: ");
    scanf("%d", &mark);

    if (mark >= 50) goto check1;
        printf("FL\n");
    goto end;
check1:  
    if (mark >= 65) goto check2;
        printf("PS\n");
    goto end;
check2:
    if (mark >= 75) goto check3;
        printf("CR\n");
    goto end;
check3:
    if (mark >= 85) goto check4;
        printf("DN\n");
    goto end;
check4:
        printf("HD\n");
    goto end;
end:
    return 0;
}