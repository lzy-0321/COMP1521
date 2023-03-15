#include <stdio.h>
#include <stdlib.h>
#include <spawn.h>
#include <sys/wait.h>

#define MAX 50

int main(int argc, char *argv[]) {
    char filepath[50]; 
    char *value = getenv("HOME");
    snprintf(filepath, MAX, "%s/.diary", value);
    FILE *fp = fopen(filepath, "a");
    if (fp == NULL) {
        printf("error: can't open file\n");
        exit(EXIT_FAILURE);
    }
    for (int i = 1; i < argc; i++) {
        fprintf(fp, "%s ", argv[i]);
    }
    fprintf(fp, "\n");
    fclose(fp);
    return 0;
}