#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc <= 1) {
        printf("Usage: ./arg_stats NUMBER [NUMBER ...]\n");
        return 0;
    }
    else if (argc == 2) {
        printf("MIN:  %s\n", argv[1]);
        printf("MAX:  %s\n", argv[1]);
        printf("SUM:  %s\n", argv[1]);
        printf("PROD: %s\n", argv[1]);
        printf("MEAN: %s\n", argv[1]);
    }
    else {
        int i = 1;
        int min = 999, max = 0, sum = 0, prod = 1, mean;
        while (i < argc) {
            int num = strtol(argv[i], NULL, 10);
            if (num < min) {
				min = num;
			}
			if (num > max) {
				max = num;
			}
			sum += num;
			prod *= num;
			mean = sum / (argc - 1);
            i++;
        }
        printf("MIN:  %d\n", min);
        printf("MAX:  %d\n", max);
        printf("SUM:  %d\n", sum);
        printf("PROD: %d\n", prod);
        printf("MEAN: %d\n", mean);
    }
	return 0;
}
