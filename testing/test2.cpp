#include <iostream>
using namespace std;

extern "C" {
	int getValue(int a, long b);
}
int main() {
    cout << getValue(323, 4);
    return 0;
}
