//
// Created by altock on 1/11/17.
//

#include "lesson_3.h"

#include <iomanip>
#include <ios>
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <set>
#include <map>

using std::cin;
using std::cout;
using std::endl;
using std::setprecision;
using std::string;
using std::streamsize;
using std::sort;
using std::vector;
using std::map;
using std::make_pair;
using std::min;
using std::max;

// 3-0
int three_0() {

    // ask for and read the student's name
    cout << "Please enter your first name: ";
    string name;cin >> name;
    cout << "Hello, " << name << "!" << endl;
    // ask for and read the midterm and final grades
    cout << "Please enter your midterm and final exam grades: ";
    double midterm, final;
    cin >> midterm >> final;
    // ask for the homework grades
    cout << "Enter all your homework grades, "
            "followed by end-of-file: ";

    // a variable into which to read
    double x;
    vector<double> homework;

    // invariant: homework contains all the homework grades read so far
    while (cin >> x) {
        homework.push_back(x);
    }

    typedef vector<double>::size_type vec_sz;
    vec_sz size = homework.size();

    if (size == 0) {
        cout << endl << "You must enter your grades. "
                "Please try again." << endl;
        return 1;
    }
    sort(homework.begin(), homework.end());
    vec_sz mid = size/2;
    double median = size % 2 == 0 ? ((homework[mid] + homework[mid-1]) / 2)
                                  : homework[mid];

    // write the result
    streamsize prec = cout.precision();
    cout << "Your final grade is " << setprecision(3)
         << 0.2 * midterm + 0.4 * final + 0.4 * median
         << setprecision(prec) << endl;

    return 0;
}

// 3-1: have two values 12, 50. Remove 50, add 100. Median is 50, but now it's gone

// 3-2:
void three_2(vector<int> v) {
    typedef vector<int>::size_type vec_sz;
    vec_sz size = v.size();

    if (size == 0) {
        cout << endl << "Empty set" << endl;
    }
    sort(v.begin(), v.end());

    vec_sz q1 = size/4;
    double quart1 = size % 2 == 0 && size != 2 ? ((v[q1] + v[q1-1]) / 2)
                                  : v[q1];


    vec_sz mid = size/2;
    double median = size % 2 == 0 ? ((v[mid] + v[mid-1]) / 2)
                                  : v[mid];

    vec_sz q3 = (size*3)/4;
    double quart3 = size % 2 == 0 ? ((v[q3] + v[q3-1]) / 2)
                                  : v[q3];

    cout << "Quarter 1: " << quart1 << endl
         << "Median: " << median << endl
         << "Quarter 3: " << quart3 << endl;


}

// 3-3:
void three_3() {
    map<string,int> sMap;
    string s;
    cout << "Enter 5 strings for me: ";
    for (int i = 0; i < 5; i++) {
        cin >> s;
        if (sMap.find(s) != sMap.end()) {
            sMap[s] += 1;
        } else {
            sMap.insert(make_pair(s,1));
        }
    }

    std::map<std::string, int>::iterator it = sMap.begin();
    while(it != sMap.end())
    {
        cout<<it->first<<" :: "<<it->second<<endl;
        it++;
    }

}

// 3-4
void three_4() {

    typedef string::size_type str_sz;
    string s;

    str_sz small, large;
    large = 0;

    cout << "Enter 5 strings for me: ";
    for (int i = 0; i < 5; i++) {
        cin >> s;
        // first time through
        if (large == 0) {
            large = s.size();
            small = s.size();
        } else {
            large = max(large, s.size());
            small = min(small,s.size());
        }
    }
    cout << "Smallest is size: " << small << endl
         << "Largest is size: " << large << endl;
}

// TODO: 3-5/3-6



int lesson_3() {
//    return three_0();

//    vector<int> x;
//    x.push_back(1);
//
//    x.push_back(2);
//
//    x.push_back(3);
//
//    x.push_back(4);
//    three_2(x);

//    three_3();
    three_4();
    return 0;
}