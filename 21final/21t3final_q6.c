#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// print a specified byte from a file
//
// first command line argument specifies a file
// second command line argument specifies a byte location

// Its second argument will be an integer specifying a byte position in the file; so, the value 0 specifies the first byte in the file, the value 1 the second byte, and so on.
// If the integer is negative, then it specifies a byte position relative to the end of the file; so, the value -1 specifies the last byte in the file, the value -2 the second-last byte, and so on.
//
// output is a single line containing only the byte's value
// printed as a unsigned decimal integer (0..255)
// if the location does not exist in the file
// a single line is printed saying: error

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "usage: %s <filename> <byte_location>\n", argv[0]);
        exit(1);
    }
    FILE *fp = fopen(argv[1], "r");
    long p = atoi(argv[2]);
    int start = SEEK_SET;
    if (p < 0) {
        start = SEEK_END;
    }
    int r = fseek(fp, p, start);
    int c = fgetc(fp);
    if (r == 0 && c != EOF) {
        printf("%d\n", c);
    }
    else {
        printf("error\n");
    }
    fclose(fp);

    return 0;
}