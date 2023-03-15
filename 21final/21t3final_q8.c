#include <stdio.h>

// print the location of a specified byte sequence in a file
// the first command line argument is a filname
// other command line arguments are integers specifying a byte sequence
// the first position the byte sequence occurs in the file is printed

int main(int argc, char *argv[]) {

    // s first argument will be the name of an existing file.

    // All remaining arguments will be decimal integers in the range 0..255. These integers specify a sequence of byte values.

    // When the sequence of byte values occurs in the file, your program should print the byte position of the first byte in that sequence in the format below. After finding the sequence in the file, and printing its location, your program should then exit. It should not continue to read the file.

    // If the byte sequence does not occur in the file, your program should print a message in the format below.

    // The position 0 specifies the first byte in the file, the position 1 the second byte, and so on.
    
    FILE *fp = fopen(argv[1], "r");
    int c;
    for (int i = 2; i < argc; i++) {
        // Sequence found at byte position
        int p = atoi(argv[i]);
        
    }
    return 0;
}
