
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc <= 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *fp = fopen(argv[1], "w");
    if (fp == NULL) {
        fprintf(stderr, "Could not open file %s\n", argv[1]);
        return 1;
    }

    for (int i = 2; i < argc; i++) {
        int c = atoi(argv[i]);
        fputc(c, fp);
    }
    

    fclose(fp);
    return 0;
}