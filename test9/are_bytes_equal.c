/*
    This file is intentionally provided (almost) empty.
    Remove this comment and add your code.
*/
#include <stdio.h>
#include <stdlib.h>

long num(FILE *fp);

int main(int argc, char *argv[]) {
    FILE *fp1 = fopen(argv[1], "rb");
    FILE *fp2 = fopen(argv[3], "rb");
    long pos1 = atol(argv[2]);
    long pos2 = atol(argv[4]);
    if (pos1 > num(fp1) || pos2 > num(fp2)) {
        printf("byte %ld in %s and byte %ld in %s are not the same\n", pos1, argv[1], pos2, argv[3]);
        return 0;
    }
    int ch1, ch2;
    fseek(fp1, pos1, SEEK_SET);
    fseek(fp2, pos2, SEEK_SET);
    ch1 = fgetc(fp1);
    ch2 = fgetc(fp2);
    if (ch1 == ch2) {
        printf("byte %ld in %s and byte %ld in %s are the same\n", pos1, argv[1], pos2, argv[3]);
    } else {
        printf("byte %ld in %s and byte %ld in %s are not the same\n", pos1, argv[1], pos2, argv[3]);
    }
    return 0;
}

long num(FILE *fp) {
    long num = 0;
    while(1) {
        int ch = fgetc(fp);
        if (ch == EOF) {
            break;
        }
        num++;
    }
    return num;
}
