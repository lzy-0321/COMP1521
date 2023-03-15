#include <stdio.h>
#include <stdlib.h>

#define SERIES_MAX 30

int fibonacci(int i);

int main(void) {
    int i = 0;
	while (scanf("%d", &i) != EOF) {
		printf("%d\n", fibonacci(i));
	}
    return 0;
}

int fibonacci(int i) {
    if (i == 0) {
        return 0;
    }
    else if (i == 1) {
        return 1;
    }
    return (fibonacci(i-1) + fibonacci(i -2));
}