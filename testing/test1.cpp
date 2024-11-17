#include <iostream>
using namespace std;

extern "C" {
	int asmtest();
}
int main() {
	cout << asmtest() << endl;
	return 0;
}
