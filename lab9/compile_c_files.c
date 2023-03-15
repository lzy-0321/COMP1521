// compile .c files specified as command line arguments
//
// if my_program.c and other_program.c is speicified as an argument then the follow two command will be executed:
// /usr/local/bin/dcc my_program.c -o my_program
// /usr/local/bin/dcc other_program.c -o other_program

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <spawn.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>

#define DCC_PATH "/usr/local/bin/dcc"

extern char **environ;

void compile(char *c_file, char *binary);
char *get_binary_name(char *c_file);

int main(int argc, char **argv)
{
    for (int arg = 1; arg < argc; arg++) {
        char *binary = get_binary_name(argv[arg]);
        compile(argv[arg], binary);
        free(binary);
    }
    return 0;
}

void compile(char *c_file, char *binary) {
    int pid;
    extern char **environ;
    char *cc_argv[] = {DCC_PATH, c_file, "-o", binary, NULL};

    // print compile command
    int i = 0;
    printf("running the command: \"");
    for (char **p = cc_argv; *p; p++) {
        printf("%s", *p);
        if (i < 3) {
            printf(" ");
        }
        i++;
    }
    printf("\"\n");

    // run compile command
    posix_spawn(&pid, DCC_PATH, NULL, NULL, cc_argv, environ);
    waitpid(pid, NULL, 0);
}


// give a string ending in .c
char *get_binary_name(char *c_file) {
    char *binary = strdup(c_file);
    if (binary == NULL) {
        exit(1);
    }

    // remove .c suffix
    char *last_dot = strrchr(binary, '.');
    if (last_dot == NULL || last_dot[1] != 'c' || last_dot[2] != '\0') {
        fprintf(stderr, "'%s' does not end in  .c\n", c_file);
        exit(1);
    }
    *last_dot = '\0';
    return binary;
}