// print 64-bit unsigned integers in hex
#include <stdio.h>

void print_qword(unsigned long long num) {
    printf("%016llx", num);
}
