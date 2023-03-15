
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <filename> <start> <end>\n", argv[0]);
        return 1;
    }

    FILE *fp = fopen(argv[1], "w");
    if (fp == NULL) {
        fprintf(stderr, "Could not open file %s\n", argv[1]);
        return 1;
    }

    int start = atoi(argv[2]);
    int end = atoi(argv[3]);
    for (int i = start; i <= end; i++) {
        uint32_t bort = (uint32_t)i;
        fprintf(fp, "%c", bort >> 8);
        fprintf(fp, "%c", bort);
    }

    fclose(fp);
    return 0;
}
