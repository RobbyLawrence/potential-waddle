#include <iostream>
using namespace std;

int main() {
    int val = 0xcafefeed;
    unsigned char *p = (unsigned char *)&val;
    printf("%x", *p);
    return 0;
}
