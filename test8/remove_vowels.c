#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    FILE *fp1 = fopen(argv[1], "r");
    FILE *fp2 = fopen(argv[2], "w");
    int ch;
    while(1) { 
        ch = fgetc(fp1); 
        if (ch == EOF) {
            break;
        }
        while (1) {
            if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u' 
                || ch == 'A'|| ch == 'E' || ch == 'I' || ch == 'O' || ch == 'U') {
                break;
            }
            else {
                fputc(ch, fp2);
                break;
            }
        }
    }
    fclose(fp1);
    fclose(fp2);
    return 0;
}

