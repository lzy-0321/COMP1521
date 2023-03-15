#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc <= 1) {
        printf("Usage: ./collatz NUMBER\n");
    }
    else {
        int i = 1;
        int num = strtol(argv[i], NULL, 10);
        if (num == 1) {
            printf("%d\n", num);
        }
        else {
            printf("%d\n", num);
            while (num != 1) {    
                if (num % 2 == 0) {
                num = num / 2;
                }
                else {
		    		num = 3 * num + 1;
                }
                printf("%d\n", num);
                i++;
            }
        }
    }
	return 0;
}
