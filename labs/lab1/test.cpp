#include <iostream>
using namespace std;

int main() {
    int test[10] = {1,2,3,4,5,6,7,8,9};
    for (int i = 0;i<10;i++) {
        cout << &test[i] << endl;
    }
}
