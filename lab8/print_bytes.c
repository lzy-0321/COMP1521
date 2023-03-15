
#include <stdio.h>
#include <ctype.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *fp = fopen(argv[1], "r");
    if (fp == NULL) {
        fprintf(stderr, "Could not open file %s\n", argv[1]);
        return 1;
    }

    int c;
    for (long int i = 0; (c = fgetc(fp)) != EOF; i++) {
        printf("byte %4ld: %3d 0x%02x ", i, c, c);
        if (isprint(c)) {
            printf("'%c'", c);
        }
        printf("\n");
    }

    fclose(fp);
    return 0;
}