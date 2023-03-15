//#include <stdio.h>
//#include <string.h>

//#define MAX_length 4096

//int findnextone(int checknum, char input[], int innum);
//int findnextone1(int checknum, char input[], int innum);

//int main(int argc, char **argv) {
//    char input[MAX_length] ;
//    *input = argv[argc];
//    int innum = argc - 1;
//    printf("Program name: %s\n", argv[0]);
//    if (innum == 0) {
//        printf("There are no other arguments\n");
//        return 0;
//    }
//    else {
//        int outnum = 0;
//        int checknum = 0;
//        int num = 1;
//        while (checknum < innum) {
//           if (input[0] != '"') {
//                char output[MAX_length];        
//                int out = 0;
//                checknum = findnextone1(checknum, input, innum);
//                //printf("first in %d %d\n", checknum, outnum);
//                while (outnum < checknum) {
//                    output[out] = input[outnum];
//                    out++;
//                    outnum++;            
//                }
//                printf("	Argument %d is \"%s\"\n", num, output);
//                num++;
//                memset(output, 0, sizeof output);
  //              //printf("first out %d %d\n", checknum, outnum);       
//            }
//            else if (input[checknum] == '"') {
//                char output[MAX_length];        
//                int out = 0;
//                outnum++;
//                checknum = findnextone(checknum, input, innum);
//                //printf("q in %d %d\n", checknum, outnum);
//                while (outnum < checknum) {
//                    output[out] = input[outnum];
//                    out++;
//                    outnum++;            
//                }
//                printf("	Argument %d is \"%s\"\n", num, output);
//                num++;
//                memset(output, 0, sizeof output); 
//                //printf("q out %d %d\n", checknum, outnum);
//            }
//            else if (input[checknum] == ' ') {
//                char output[MAX_length];        
//                int out = 0;
//               outnum++;
//                checknum = findnextone1(checknum, input, innum);
//               //printf("b in %d %d\n", checknum, outnum);
//                while (outnum < checknum) {
//                    output[out] = input[outnum];
//                    out++;
//                    outnum++;            
//                }
//                printf("	Argument %d is \"%s\"\n", num, output);
//                num++;
//                memset(output, 0, sizeof output); 
//                checknum--;
//                outnum--;
                //printf("b out %d %d\n", checknum, outnum);
                
//            }
            //printf("final %d %d\n", checknum, outnum);
//            checknum++;
//            outnum++;
//        }
//    }
//    return 0;
//}

//int findnextone(int checknum, char input[], int innum) {
//    int c = checknum + 1;
//    while (c < innum) {
//            if (input[c] == '"') {
//                return c;
//            }
//            c++;
//        }
//        return c;
//}
//int findnextone1(int checknum, char input[], int innum) {
//    int c = checknum + 1;
//    while (c < innum) {
//            if (input[c] == ' ') {
//                return c;
//            }
//            c++;
//        }
//        return c;
//}

#include <stdio.h>
#include <stdlib.h>


int main(int argc, char **argv) {
    printf("Program name: %s\n", argv[0]);
    if (argc == 1) {
        printf("There are no other arguments\n");
    } else {
        printf("There are %d arguments:\n", argc-1);
    for (int i = 1; i < argc; i++) {
        printf(" Argument %d is \"%s\"\n", i, argv[i]);
        }
    }
    return 0;
}