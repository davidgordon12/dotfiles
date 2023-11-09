#include "common.h"
#include "lexer/lexer.h"
#include "lib/array.h"

static void init_lexer(lexer* lexer, char* source);

token_array tokens;

static void init_lexer(lexer* lexer, char* source) {
    lexer->left = 0;
    lexer->right = 0;
    lexer->line = 1;
    lexer->ch = 'a';
    lexer->source = source;

    init_array(&tokens);

    printf("Lexer initialized\n\n");

    print_lexer(lexer);
}

void print_lexer(lexer* lexer) {
    printf("Left: %d\n",   lexer->left);
    printf("Right: %d\n",  lexer->right);
    printf("Line: %d\n",   lexer->line);
    printf("Char: %c\n",   lexer->ch);
    printf("Source: %s\n", lexer->source);
    printf("\n");
}

token* tokenize(lexer* lexer, char* source) {
    init_lexer(lexer, source);

    // Read every token from left->right
    char ch = ' ';
    while(ch != '\0') {
        ch = read_char(lexer);
        printf("%c\n", ch);
    }
}

token* next_token() {
   // advance read_char() until white space.
   // grab whatever is between right-left.
   // add it to tokens, set left = right.
   // repeat until EOF. 
}

char read_char(lexer* lexer) {
    if(lexer->right >= strlen(lexer->source)) {
        return '\0';
    } else {
        return lexer->source[lexer->right++];
    }
}