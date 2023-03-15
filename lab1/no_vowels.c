#include <stdio.h>

#define MAX_length 4096

int main(void) {
    while (EOF) {  
        char input[MAX_length];
        int innum = 0;
        char C;
        if (scanf("%c" , &input[0]) == EOF ) {
            return 0;
        } 
        //input[0] = getchar();
        innum++;
        while (input[0] != EOF) {
            scanf("%c" , &C);
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
                if (input[outnum] != 'a' && input[outnum] != 'e' && input[outnum] != 'i' && input[outnum] != 'o' && input[outnum] != 'u' && input[outnum] != 'A' && input[outnum] != 'E' && input[outnum] != 'I' && input[outnum] != 'O' && input[outnum] != 'U') {
                    printf("%c" , input[outnum]);       
                }
                outnum++;
            }
            printf("\n");
        }
        else {
            return 0;
        }
    }
    return 0;
}
