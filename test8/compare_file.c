#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>


int main(int argc, char *argv[]) {
    FILE *f1 = fopen(argv[1], "r");
    FILE *f2 = fopen(argv[2], "r");
    int c1, c2;
    int n = 0;
    while (1) {
        c1 = fgetc(f1);
        c2 = fgetc(f2);
        if (c1 == EOF && c2 == EOF) {
            printf("Files are identical\n");
            break;
        }
        else if (c1 == EOF) {
            printf("EOF on %s\n",argv[1]);
            break;
        }
        else if (c2 == EOF) {
            printf("EOF on %s\n",argv[2]);
            break;
        }
        else if (c1 != c2) {
            printf("Files differ at byte %d\n" ,n);
            break;
        }
        n++;
    }
    fclose(f1);
    fclose(f2);
    return 0;
}

/*
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main(int argc, char *argv[]) {

    FILE *input_stream = fopen(argv[1], "r");
    FILE *output_stream = fopen(argv[2], "r");

    char c1; 
    char c2;
    int i = 0;
    while (1) {
        c1 = fgetc(input_stream);
        c2 = fgetc(output_stream);
        i++;
        if (c1 != c2) {
            printf("Files differ at byte %d\n", i-1);
            break;
        } else if (c1 == EOF && c2 == EOF) {
            printf("Files are identical\n");
            break;
        } else if (c2 == EOF) {
            printf("EOF on %s\n", argv[2]);
            break;
        } else if (c1 == EOF) {
            printf("EOF on %s\n", argv[1]);
            break;
        }
    }
    
    fclose(input_stream); 
    fclose(output_stream);
    return 0;
}
*/
