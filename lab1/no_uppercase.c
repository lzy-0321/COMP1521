#include <stdio.h>

#define MAX_length 4096

int main(void) {
    while (EOF) {  
        char input[MAX_length];
        int innum = 0;
        int C;
        input[0] = getchar();
        if (input[0] == EOF ) {
            return 0;
        } 
        innum++;
        while((C = getchar()) != '\n') {
            input[innum] = C;
            if (C != '\n') {
                input[innum] = C;
                innum++;
            }
            else {
                break;
            }
        }
        if (input[0] != EOF) {
            int outnum = 0;
            while (outnum < innum) {
                if (input[outnum] <= 'Z' && input[outnum] >= 'A') {
                    input[outnum] = input[outnum] + 32;
                    putchar(input[outnum]);       
                }
                else {
                    putchar(input[outnum]);
                }
                outnum++;
            }
            putchar('\n');
        }
        else {
            return 0;
        }
    }
    return 0;
}
