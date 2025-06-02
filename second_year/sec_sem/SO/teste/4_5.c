#include <stdio.h>
#include <stdlib.h>
#define BUFFER_SIZE 1024

int main(int argc, char* argv[]) {
    if (argc != 3) {
        printf("Usage: %s <source> <destination>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    FILE* file1 = fopen(argv[1], "r");
    FILE* file2 = fopen(argv[2], "w");

    if ( file1 == NULL || file2 == NULL) {
        printf("error: could not open file.\n");
        if (file1) fclose(file1);
        if (file2) fclose(file2);
        exit(EXIT_FAILURE);
    }

    char buffer[BUFFER_SIZE];
    size_t nchars;
    
    while (nchars = fread(buffer, sizeof(char), BUFFER_SIZE, file1)) {
        fwrite(buffer, sizeof(char), nchars, file2);
    }
    
    fclose(file1);
    fclose(file2);
    exit(EXIT_SUCCESS);
}