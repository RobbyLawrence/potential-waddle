#include <iostream>
using namespace std;
/* Convert addi x3, x5, -16 to machine code
* we know addi is imm[11:0]
* rs1 is the register's value saved in binary (so it's 00101 here)
* rd1 is the destination register (00011)
* f3 is 000
*So the instruction is 1111_1111_0000_0010_1000_0001_1001_0001
* converting to hex, we get FF028193.
*
*
*
*
*
*/
extern "C" {
    int asmtest();
}
int main() {
    cout << asmtest() << endl;
    return 0;
}
