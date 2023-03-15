#include <stdio.h>
#include <stdlib.h>

// Write a C program, print_select_bytes.c, which is given a filename and one or more possitions as command line arguments. It should print the byte that is located at each given possition within the file. It should print each byte in decimal, two digit hex, and (if possible) the character itself.

// Follow the output format below.

// ./print_select_bytes lorem-ipsum.txt 542 361 840 97 546 1612 2508 96 85 1382
// 116 - 0x74 - 't'
// 101 - 0x65 - 'e'
// 117 - 0x75 - 'u'
// 101 - 0x65 - 'e'
// 108 - 0x6C - 'l'
// 32 - 0x20 - ' '
// 111 - 0x6F - 'o'
// 116 - 0x74 - 't'
// 114 - 0x72 - 'r'
// 116 - 0x74 - 't'

int main(int argc, char *argv[]) {
    FILE *fp = fopen(argv[1], "rb");
    long num = 0;
    while(1) {
        int ch = fgetc(fp);
        if (ch == EOF) {
            break;
        }
        num++;
    }
    for (int i = 2; i < argc; i++) {
        long p = atol(argv[i]);
        long n = p % num;
        fseek(fp, n, SEEK_SET);
        int ch = fgetc(fp);
        printf("%1d - 0x%02X - '%c'\n", ch, ch, ch);
    }
    fclose(fp);
    return 0;
}




