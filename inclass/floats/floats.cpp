#include <iostream>
#include <iomanip>
using namespace std;

extern "C" {
    float asmtest(double i[], int size);
}

int main() {
    double values[] = {1.2,7.4,5.3,0.1,2.1,4.2,-8.4};
    asmtest(values, sizeof(values) / sizeof(values[0]));

    for (int i = 0;i < 7;i++) {
        cout << values[i] << endl;
    }
}
