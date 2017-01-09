//
// Created by altock on 1/9/17.
//

#include "lesson_1.h"

#include <iostream>
#include <string>

// 1-0: Done

// 1-1: They're valid because the const is initialized

// 1-2: No, can't add const arrays together (for some reason it defaults to that for "")

// 1-3: Is valid, {const} gets thrown away at end of unit, i.e. }

// 1-4: Not valid, redefining const

// 1-5: Not valid, x is not available in scope, remove brackets
void one_5() {
    { std::string s = "a string";
        std::string x = s + ", really";
        std::cout << s << std::endl;
        std::cout << x << std::endl;
    }
}

// 1-6: It only gets the beginning of your name (i.e. up till the whitespace)
// the first time, and then takes the other one in cin the second time
void one_6() {
    std::cout << "What is your name? ";
    std::string name;
    std::cin >> name;
    std::cout << "Hello, " << name
              << std::endl << "And what is yours? ";
    std::cin >> name;
    std::cout << "Hello, " << name
              << "; nice to meet you too!" << std::endl;
}

void lesson_1() {
    // ask for the persons name
//    std::cout << "Please enter your first name: ";
//
//    // read the name
//    std::string name; // define name
//    std::cin >> name; // read into
//
//    // write a greeting
////    std::cout << "* Hello, " << name << "! *" << std::endl;
//
//    const std::string greeting = "Hello, " + name + "!";
//    const std::string spaces(greeting.size(),' ');
//    const std::string second = "* " + spaces + " *";
//    const std::string first(second.size(),'*');
//
//    // write it all
//
//    std::cout << std::endl << first << std::endl;
//    std::cout << second << std::endl;
//    std::cout << "* " << greeting << " *" << std::endl;
//    std::cout << second << std::endl;
//    std::cout << first << std::endl;

    one_5();
    one_6();
}