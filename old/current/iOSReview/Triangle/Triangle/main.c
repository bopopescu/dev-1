//
//  main.c
//  Triangle
//
//  Created by Samuel Svenningsen on 5/25/15.
//  Copyright (c) 2015 Sam Svenningsen. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

float remainingAngle(float a, float b){
    return 180.0 - a - b;
}


int main(int argc, const char * argv[]) {
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    printf("The third angle is %.2f\n", angleC);
    return EXIT_SUCCESS;
}
