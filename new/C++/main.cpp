#include <iostream>

// And zero_4?
void zero_0() {
    std::cout << "Hello, World" << std::endl;
}

void zero_1() {
    3+4;
}

void zero_2() {
    std::cout << "This (\") is a quote, and this (\\) is a backslash." << std::endl;
}

void zero_3() {
    std::cout << "\t These are \t my \t\t tabs." << std::endl;
}


// 0-5: Can't, requires initializer, i.e. {}
//int main() std::cout << "Hello, world!" << std::endl;

// 0-6: Can, {} cancel out
//int main() {{{{{{ std::cout << "Hello, world!" << std::endl; }}}}}}

// 0-7: No, the *  / messes it up
//int main()
//{
// /* This is a comment that extends over several lines
//because it uses /* and */ as its starting and ending delimiters */
//                                                     std::cout << "Does this work?" << std::endl;
//    return 0;
//}

// 0-8 Yes, the /* doesn't start any comments because it is already commented

// 0-9 int main;

void zero_10() {
    std::cout << "Hello,\nworld!" << std::endl;
}

int main() {

    zero_0();

    zero_1();

    zero_2();

    zero_3();

    zero_10();
    return 0;
}