
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

static void printModes(int m, char *path);

int main(int argc, char *argv[]) {
    for (int i = 1; i < argc; i++) {
        struct stat s;
        stat(argv[i], &s);
        int m = s.st_mode;
        printModes(m, argv[i]);
    }
    return 0;
}

static void printModes(int m, char *path) {
    if (S_ISDIR(m)) {
        putchar('d');
    } 
    else if (S_ISREG(m)) {
        putchar('-');
    }
    if (m & S_IRUSR) {
        putchar('r');
    }
    else {
        putchar('-');
    }
    if (m & S_IWUSR) {
        putchar('w');
    }
    else {
        putchar('-');
    }
    if (m & S_IXUSR) {
        putchar('x');
    }
    else {
        putchar('-');
    }
    if (m & S_IRGRP) {
        putchar('r');
    }
    else {
        putchar('-');
    }
    if (m & S_IWGRP) {
        putchar('w');
    }
    else {
        putchar('-');
    }
    if (m & S_IXGRP) {
        putchar('x');
    }
    else {
        putchar('-');
    }
    if (m & S_IROTH) {
        putchar('r');
    }
    else {
        putchar('-');
    }
    if (m & S_IWOTH) {
        putchar('w');
    }
    else {
        putchar('-');
    }
    if (m & S_IXOTH) {
        putchar('x');
    }
    else {
        putchar('-');
    }
    printf(" %s\n", path);
}