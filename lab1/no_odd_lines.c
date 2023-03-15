#include <stdlib.h>
#include <stdio.h>

#define MAX_length 4096

void copy(FILE *, FILE *);

int main(int argc, char *argv[]) {
	copy(stdin,stdout);
	return 0;
}

void copy(FILE *input, FILE *output) {
    char line[MAX_length];
    while(fgets(line,MAX_length,input) != NULL) {
        int num = 0;
        int i = 0;
        while (line[num] != '\0') {
            if (line[num] != '\t') {
                i++;
            }
            num++;
        }
        if (i % 2 == 0) {
            fputs(line,output);
        }
    }
}
