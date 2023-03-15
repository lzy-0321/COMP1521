/*
    This file is intentionally provided (almost) empty.
    Remove this comment and add your code.
*/
// Your program should accept one command line argument, the path to a command.

// Your program should read lines of input from stdin until end-of-file and execute the command once for each line of input.

// You must execute the command with posix_spawn.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <spawn.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <command>\n", argv[0]);
        exit(1);
    }
    char *command = argv[1];
    // get one name and put it after the command
    char *name = NULL;
    size_t name_len = 0;
    ssize_t read;
    while ((read = getline(&name, &name_len, stdin)) != -1) {
        // remove the newline
        name[read - 1] = '\0';
        // spawn the command
        pid_t pid;
        posix_spawn(&pid, command, NULL, NULL, (char *[]){command, name, NULL}, NULL);
        // wait for the command to finish
        int status;
        waitpid(pid, &status, 0);
    }

}