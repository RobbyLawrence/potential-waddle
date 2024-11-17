#include <iostream>
#include <iomanip>
using namespace std;

struct MyStruct {
    char i;
    short j;
    int k;
    double l;
};

int main() {
    MyStruct ms;
    cout << sizeof(ms) << endl;
}
