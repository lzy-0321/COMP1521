/*
    This file is intentionally provided (almost) empty.
    Remove this comment and add your code.
*/
// Write a C program, time_travelling_files.c, which takes a list of files as command-line arguments. 

// Your program should, for each file, check if the file's access time or the file's modification time is in the future. 

// If either the file's access time or the file's modification time is in the future, your program should should print a message in the format below. 

// You can test your program by using the Unix utility touch to set the the access time or modification time of files. 

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/stat.h>   
#include <unistd.h>


int main(int argc, char *argv[]) {
    time_t now = time(NULL);
    struct stat fileStat;
    for (int i = 1; i < argc; i++) {
        stat(argv[i], &fileStat);
        if (fileStat.st_atime > now || fileStat.st_mtime > now) {
            printf("%s has a timestamp that is in the future\n", argv[i]);
        }
    }
    return 0;
}