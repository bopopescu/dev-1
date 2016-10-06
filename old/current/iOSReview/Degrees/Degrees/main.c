//
//  main.c
//  Degrees
//
//  Created by Samuel Svenningsen on 5/25/15.
//  Copyright (c) 2015 Sam Svenningsen. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

// Declare a static variable, doesn't really matter though.
static float lastTemperature;

float fahrenheightFromCelsius(float cel){
    lastTemperature = cel;
    float fahr = cel * 1.8 + 32.0;
    printf("%f Celsius is %f Fahrenheight\n", cel, fahr);
    return fahr;
}

int main(int argc, const char * argv[]) {
    float freezeInC = 0;
    float freezeInF = fahrenheightFromCelsius(freezeInC);
    printf("Water freezes at %f degrees Fahrenheight.\n", freezeInF);
    printf("The last temperature converted was %f.\n", lastTemperature);
    return EXIT_SUCCESS;
}
