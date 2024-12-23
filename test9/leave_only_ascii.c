/*
    This file is intentionally provided (almost) empty.
    Remove this comment and add your code.
*/
#include <stdio.h>

#define MAX_CHARS 100000

int isnotascii(int c) {
    return c >= 128 && c <= 255;
}

int main(int argc, char *argv[]) {
    FILE *file = fopen(argv[1], "r");
    int pos = 0;
    int c;

    int outChars[MAX_CHARS] = {0};

    while ((c = fgetc(file)) != EOF) {
        if (!isnotascii(c)) {
            outChars[pos] = c;
            pos++;
        }
    }
    fclose(file);

    file = fopen(argv[1], "w");
    for (int i = 0; i < pos; i++) {
        fputc(outChars[i], file);
    }
    fclose(file);

    return 0;
}