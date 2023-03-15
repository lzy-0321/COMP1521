#include <stdio.h>

// copy file specified as command line argument 1 to
// file specified as command line argument 2
// convert UTF8 to ASCII by replacing multibyte UTF8 characters with '?'

int main(int argc, char *argv[]) {

    FILE *in = fopen(argv[1], "r");
    FILE *out = fopen(argv[2], "w");
    int c;
    int ch = '?';
    while ((c = fgetc(in)) != EOF) {
        if (c < 0x80) {
            fputc(c, out);
        }
        else if (c > 0xBF && c < 0xF8) {
            fputc(ch, out);
        }
    }
    fclose(in);
    fclose(out);
    
    return 0;
}
