//
//  main.c
//  CountDown
//
//  Created by Samuel Svenningsen on 5/25/15.
//  Copyright (c) 2015 Sam Svenningsen. All rights reserved.
//

#include <readline/readline.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    printf("Where should I start counting? ");
    const char *input = readline(NULL);
    int x = atoi(input);
    for (int i = x; i + 1; i--) {
        printf("%d\n", i);
        if (!(i % 5)) {
            printf("Found one!\n");
        }
    }
    return 0;
}
