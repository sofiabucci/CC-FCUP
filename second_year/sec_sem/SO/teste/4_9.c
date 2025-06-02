#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 1024

void search_in_file(const char *pattern, const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "mygrep: cannot open '%s'\n", filename);
        exit(EXIT_FAILURE);
    }

    char line[MAX_LINE_LENGTH];
    int line_number = 1;
    size_t pattern_len = strlen(pattern);

    while (fgets(line, MAX_LINE_LENGTH, file) != NULL) {
        char *pos = line;
        int column = 1;

        while ((pos = strstr(pos, pattern)) != NULL) {
            printf("%s:%d:%d: %s", filename, line_number, (int)(pos - line + 1), line);
            pos += pattern_len; // Move past this match
            column = pos - line + 1;
        }

        line_number++;
    }

    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <pattern> <file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    search_in_file(argv[1], argv[2]);

    return EXIT_SUCCESS;
}