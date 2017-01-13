#include <iostream>
#include "lesson_0.h"
#include "lesson_1.h"
#include "lesson_2.h"
//#include "lesson_3.h"
//#include "lesson_4.h"


int* getMem() {
    int* ptrMemory;
    ptrMemory = (int*) malloc(2 * sizeof(int));
    ptrMemory[0] = 2;
    ptrMemory[1] = 3;
    return ptrMemory;
}


int main() {
//    lesson_0();
//    lesson_1();
//    lesson_2();
//    return lesson_3();
//    lesson_4();

    int nSize = 1;
    int* ptrMyArray = 0;
    ptrMyArray = (int*) malloc(sizeof(int) * nSize);
    for (int i = 0; i < nSize; i++) {
        ptrMyArray[i] = i;
    }

    char * ptrTempBuffer;
    ptrTempBuffer = new char[30];
    delete [] ptrTempBuffer;

    int *ptrMem = getMem();
    std::cout << ptrMem[0];
    delete [] ptrMem;

}