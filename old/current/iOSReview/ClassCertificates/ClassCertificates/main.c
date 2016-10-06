//
//  main.c
//  ClassCertificates
//
//  Created by Samuel Svenningsen on 5/25/15.
//  Copyright (c) 2015 Sam Svenningsen. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>

void congradulateStudent(char *student, char *course, int numDays){
    printf("%s has done as much %s Programming as I could fit into %d days.\n",
           student, course, numDays);
}

int main(int argc, const char * argv[]) {
    congradulateStudent("Kate", "Cocoa", 5);
    sleep(2);
    congradulateStudent("Bo", "Objectiv-C", 2);
    sleep(2);
    congradulateStudent("Mike", "Python", 5);
    sleep(2);
    congradulateStudent("Liz", "iOS", 5);
    
    return 0;
}
