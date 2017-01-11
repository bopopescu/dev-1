//
// Created by altock on 1/10/17.
//

#include "lesson_2.h"

#include <iostream>
#include <string>


// 2-6: Prints the numbers 1-10

// 2-7
void two_7 () {
    int i = 11;
    while (i != -5) {
        std::cout << --i << std::endl;
    }
}

// 2-8
void two_8() {
    int prod = 1;
    for (int i = 1; i != 10; i++) {
        prod *= i;
    }
    std::cout << std::to_string(prod) << std::endl;
}

// 2-9
void two_9() {
    std::string firstString;
    std::string secondString;
    std::cout << "Enter Two Numbers: ";
    std::cin >> firstString;
    std::cin >> secondString;

    int first = std::stoi(firstString);
    int second = std::stoi(secondString);

    if (first > second) {
        std::cout << firstString << " is larger than " << secondString << std::endl;
    } else if (first < second) {

        std::cout << secondString << " is larger than " << firstString << std::endl;
    } else {
        std::cout << "They are the same size" << std::endl;
    }
}

/* 2-10
 * In each iteration of the while loop, cout is redefined form its namespace
 * Outside the while loop, cout is not defined, so you have to use std::
 * endl is never defined in the general namespace, so std::endl must be used.
 *
 * */

void lesson_2 (){
    // ask for the persons name
    std::cout << "Please enter your first name: ";

    // read the name
    std::string name; // define name
    std::cin >> name; // read into

    const std::string greeting = "Hello, " + name + "!";

    // ask for the persons name
    std::cout << "Please enter how much space to leave between the frame and the greeting: ";

    // read the name
    std::string stringRPad; // define name
    std::cin >> stringRPad; // read into




    const int rPad = std::stoi(stringRPad);
    const int cPad = 2;
    const int rows = rPad * 2 + 3;
    const std::string::size_type cols = greeting.size() + cPad*2 + 2;

    std::cout << std::endl;

    for (int r = 0; r != rows; r++) {

        std::string::size_type c = 0;

        while (c != cols) {
            if (r == rPad + 1 && c == cPad + 1) {
                std::cout << greeting;
                c += greeting.size();
            } else {
                if (r == 0 || r == rows - 1 || c == 0 || c == cols - 1) {
                    std::cout << "*";
                    c++;
                } else if (r == rPad + 1) {
                    std::string space(cPad,' ');
                    std::cout << space;
                    c += cPad;
                } else {
                    std::string space(cols - 2,' ');
                    std::cout << space;
                    c += cols - 2;
                }
            }
        }


        std::cout << std::endl;
    }


    two_7();
    two_8();
    two_9();
}
