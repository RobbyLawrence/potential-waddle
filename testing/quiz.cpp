#include <iostream>
using namespace std;

struct MyStruct {
    int i;
    int *j;
    long *k;
};

extern "C" {
    long runasm(const MyStruct &ms);
}

int main() {
    MyStruct ms = {34, (int *)31, (long *)66};
    cout << runasm(ms);
}
