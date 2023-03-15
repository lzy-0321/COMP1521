#include <stdio.h>
#include <stdlib.h>

// replace '\r' to '\n' in file
int main(int argc, char *argv[]) {
    FILE *fp = fopen(argv[1], "r");
    // creating a extra file
    FILE *fp2 = tmpfile();
    // read the file fp and change '\r' to '\n'
    // if there is a '\n' after '\r', 
    int c;
    while ((c = fgetc(fp)) != EOF) {
        if (c == '\r') {
            c = fgetc(fp);
            if (c == '\n') {
                fputc('\n', fp2);
            }
            else {
                fputc('\n', fp2);
                fputc(c, fp2);
            }
        }
        else if (c != '\r') {
            fputc(c, fp2);
        }
    }
    fclose(fp);
    FILE *fp3 = fopen(argv[1], "w");
    // move the content of fp2 to fp3
    fseek(fp2, 0, SEEK_SET);
    c = fgetc(fp2);
    while (c != EOF) {
        fputc(c, fp3);
        c = fgetc(fp2);
    }
    fclose(fp2);
    fclose(fp3);
    return 0;
}
