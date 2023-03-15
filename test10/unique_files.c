#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

// Your program should, for each file, check if the file's inode number has previously been encountered.

// If the inode number has not been encountered, print the file's name.

// If the inode number has been encountered, simply continue to the next file without printing anything.

// The inode number for a file can be retrieved with the stat system call.

int main(int argc, char **argv)
{   
    int *inode = malloc(sizeof(int) * (argc - 1));
    for (int i = 1; i < argc; i++) {
        struct stat file_stat;
        stat(argv[i], &file_stat);
        inode[i - 1] = file_stat.st_ino;
        int n = 0;
        for (int j = 0; j < i - 1; j++) {
            if (inode[j] == inode[i - 1]) {
                n = 1;
            }
        }
        if (n == 0) {
            printf("%s\n", argv[i]);
        }
    }
}
