#include <iostream>
using namespace std;

extern "C" {
    double asmfloat(int value1, float value2);
}

int main() {
    double val;
    val = asmfloat(5, 2.81);
    cout << val << '\n';
}
