#include <iostream>
#include <iostream>
using namespace std;

int main() {
	double *ptr = (double *)52;
	double *value = &ptr[8];
	cout << dec << value << endl;
	return 0;
}
