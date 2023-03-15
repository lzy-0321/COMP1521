#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    FILE *fp = fopen(argv[1], "r");
    char ch;
    int num = 0;
    while(1){
        ch = fgetc(fp);
        if (ch == EOF) {
            break;
        }
        if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u' 
            || ch == 'A'|| ch == 'E' || ch == 'I' || ch == 'O' || ch == 'U') {
            num++;
        }
    }
    printf("%d\n", num);
    fclose(fp);
    return 0;
}