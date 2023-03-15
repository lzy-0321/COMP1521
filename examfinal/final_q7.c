/**
 * given a `UTF-8` encoded string,
 * return a new string that is the reversed version of the given string.
 *
 * `unicode` has specific rules about how string should be reversed
 * We don't want to reverse a `unicode` string
 * We want to reverse a sequence of `UTF-8` code points
 *
 * eg:
 * "hello world"
 * would return "dlrow olleh"
 *
 * "🍓🍇🍈🍍🍐"
 * would return "🍐🍍🍈🍇🍓"
**/

char *final_q7(char *string) {
    // takes a string, and returns it unmodified
    // returns a new string that is the reversed version of the given string
    // if the string is a single character, return the character
    // if the string is a sequence of characters, return the reversed sequence of characters
    int num = strlen(string);
    int i = 0;
    int j = num - 1;
    char *new_string = malloc(sizeof(char) * num);
    while (i < num) {
        if (string[i] == '\0') {
            new_string[i] = '\0';
            break;
        }
        else if (string[i] == '\n') {
            new_string[i] = '\n';
            i = i + 1;
            j = j - 1;
        }
        else if (string[i] == ' ') {
            new_string[i] = ' ';
            i = i + 1;
            j = j - 1;
        }
        else {
            new_string[i] = string[j];
            i = i + 1;
            j = j - 1;
        }
    }
    return new_string;
}
