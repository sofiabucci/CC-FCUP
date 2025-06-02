#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void toLower(char* str){
    printf("Original: %s\n", str);

    for(int i = 0; str.lenght; i++){
        str[i] = tolower(str[i]);
    }

    printf("Lowercase: %s\n", str);
}

void occur(char* argv[]){
    char* substr = argv[1];
    char* str = argv[2];

    char* result = strstr(str, substr);

    if (result != NULL) {
        printf("'%s' occurs within '%s' at position %ld\n", 
               substr, str, result - str);
    } else {
        printf("'%s' does not occur within '%s'\n", substr, str);
    }
}

void timesOccur(char* argv[]){
    char* substr = argv[1];
    char* str = argv[2];
    int count = 0;
    size_t substr_len = strlen(substr);
    
    if (substr_len == 0) {
        printf("Substring length is 0, cannot count occurrences.\n");
        return EXIT_FAILURE;
    }
    
    char* pos = str;
    while ((pos = strstr(pos, substr)) != NULL) {
        count++;
        pos += substr_len; // Move past this occurrence
    }
    
    printf("'%s' occurs %d times in '%s'\n", substr, count, str);
}


int main(int argc, char* argv[]) {
    /* compare argv[1] and argv[2] using lexicographic order */
    int result = strcmp(argv[1], argv[2]);
    if (result == 0)
        printf("the strings are the same\n");
    else if (result < 0)
        printf("%s < %s\n", argv[1], argv[2]);
    else
        printf("%s > %s\n", argv[1], argv[2]);

    /* create a copy of argv[1] and another of argv[2] */
    char *p1 = strdup(argv[1]);
    char *p2 = strdup(argv[2]);
    printf("p1 holds:%s\n", p1);
    printf("p2 holds:%s\n", p2);

    /* * this is another way of doing it */
    char* p3 = (char*)malloc((strlen(argv[1]) + 1) * sizeof(char));
    char* p4 = (char*)malloc((strlen(argv[2]) + 1) * sizeof(char));
    strcpy(p3, argv[1]);
    strcpy(p4, argv[2]);
    printf("p3 holds:%s\n", p3);
    printf("p4 holds:%s\n", p4);

    /* concatenate both strings, allocating space for:
    all chars of argv[1],
    all chars of argv[2],
    the final ’\0’ */
    char* p5 = (char*)malloc((strlen(argv[1]) + strlen(argv[2]) + 1) * sizeof(char));
    strcpy(p5, p1);
    strcat(p5, p2);
    printf("p5 holds:%s\n", p5);

    exit(EXIT_SUCCESS);
}