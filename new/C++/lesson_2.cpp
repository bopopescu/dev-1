//
// Created by altock on 1/10/17.
//

#include "lesson_2.h"

#include <iostream>
#include <string>

void lesson_2 (){
    // ask for the persons name
    std::cout << "Please enter your first name: ";

    // read the name
    std::string name; // define name
    std::cin >> name; // read into

    const std::string greeting = "Hello, " + name + "!";

    const int pad = 1
    const int rows = pad * 2 + 3;

    std::cout << std::endl;

    int r = 0;
    while (r != rows) {
        std::cout << std::endl;
        ++r;
    }
}
