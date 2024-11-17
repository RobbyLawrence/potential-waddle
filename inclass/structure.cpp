#include <iostream>
#include <iomanip>
using namespace std;

struct MyStruct {
    int i;
    long j;
    short k;
};
// pointers and "by reference" are the same for assembly
extern "C" {
    long asmtest(MyStruct *ms);
}

int main() {
    MyStruct ms[] = {
        {10,20,30},
        {20,30,40},
        {50,60,70}
    };
    asmtest(ms); // the reason this works without & is because line 16 gives ms the memory address
                 // of the first element in the array
    cout << ms[0].i << ' ' << ms[0].j << ' ' << ms[0].k << endl;
}
