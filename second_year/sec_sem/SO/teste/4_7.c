#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <unistd.h>

void count_file(const char *filename, int count_chars, int count_words, int count_lines) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "mywc: cannot open '%s'\n", filename);
        exit(EXIT_FAILURE);
    }

    int chars = 0, words = 0, lines = 0;
    int in_word = 0;
    int c;

    while ((c = fgetc(file)) != EOF) {
        chars++;
        
        if (c == '\n') {
            lines++;
        }
        
        if (isspace(c)) {
            in_word = 0;
        } else if (!in_word) {
            in_word = 1;
            words++;
        }
    }

    fclose(file);

    if (count_lines) printf("%d ", lines);
    if (count_words) printf("%d ", words);
    if (count_chars) printf("%d ", chars);
    printf("%s\n", filename);
}

int main(int argc, char *argv[]) {
    int opt;
    int count_chars = 0, count_words = 0, count_lines = 0;

    while ((opt = getopt(argc, argv, "cwl")) != -1) {
        switch (opt) {
            case 'c':
                count_chars = 1;
                break;
            case 'w':
                count_words = 1;
                break;
            case 'l':
                count_lines = 1;
                break;
            default:
                fprintf(stderr, "Usage: %s [-c] [-w] [-l] file\n", argv[0]);
                exit(EXIT_FAILURE);
        }
    }

    if (optind >= argc) {
        fprintf(stderr, "Expected filename after options\n");
        fprintf(stderr, "Usage: %s [-c] [-w] [-l] file\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // If no options specified, count all three
    if (!count_chars && !count_words && !count_lines) {
        count_chars = count_words = count_lines = 1;
    }

    count_file(argv[optind], count_chars, count_words, count_lines);

    return EXIT_SUCCESS;
}